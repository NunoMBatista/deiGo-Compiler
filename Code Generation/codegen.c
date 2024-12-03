#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"
#include "semantics.h"
#include "codegen.h"

int temporary = 0;

extern struct symbol_list *symbol_table;

char* llvm_types(enum type type){
    switch(type){
        case integer:
            return "i32";
        case float32:
            return "double";
        case bool:
            return "i1";
        case string:
            return "i8*";
        default:
            return "void";
    }
}

void codegen_parameters(struct node *func_params){
    if(func_params == NULL){
        return;
    }

    struct node_list *cur_param = func_params->children;
    while((cur_param = cur_param->next) != NULL){
        struct node *param_decl = cur_param->node;
        
        struct node *type = get_child(param_decl, 0);
        struct node *id = get_child(param_decl, 1);
    
        enum category category = type->category;
        enum type param_type = category_to_type(category);
        printf("%s %%%s", llvm_types(param_type), id->token);
        if(cur_param->next != NULL){
            printf(", ");
        }
    }
}

void codegen_func_header(struct node *func_header, enum type return_type){
    if(func_header == NULL){
        return;
    }

    struct node *id = get_child(func_header, 0);
    
    temporary = 1;
    
    // If the return type doesn't exist, func_params is the second child of the header
    struct node *func_params;
    if(return_type == none){
        func_params = get_child(func_header, 1);
    }
    else{
        func_params = get_child(func_header, 2);
    }

    // Start of function header
    printf(
        "define %s @_%s(", llvm_types(return_type), id->token
    );
    // Print comma separated parameters
    codegen_parameters(func_params);
    // End of function header
    printf(") {\n");
}

void codegen_var_decl(struct node *var_decl){
    if(var_decl == NULL){
        return;
    }
}

int codegen_statement(struct node *statement){
    if(statement == NULL){
        return temporary;
    }
}

void codegen_body(struct node *func_body){
    if(func_body == NULL){
        return;
    }

    struct node_list *cur_child = func_body->children;
    while((cur_child = cur_child->next) != NULL){
        struct node *cur_node = cur_child->node; 

        // There are only VarDecl and Statements in the function body
        if(cur_node->category == VarDecl){
            codegen_var_decl(cur_node);
        }
        else{
            codegen_statement(cur_node);
        }
    }

}

void codegen_function(struct node *function){
    if(function == NULL){
        return;
    }
    
    struct node *func_header = get_child(function, 0);
    struct node *func_body = get_child(function, 1);

    // Get the function's return type (check it in the symbol table to avoid child index mismatch)
    struct symbol_list *function_symbol = search_symbol(symbol_table, get_child(func_header, 0)->token);
    enum type return_type = function_symbol->type;

    // Generate the function header
    codegen_func_header(func_header, return_type);

    // Generate the function body
    codegen_body(func_body);

    // Generate the function footer (add a default return statement)
    printf("  ret %s", llvm_types(return_type));
    switch(return_type){
        case integer:
            printf(" 0\n");
            break;
        case float32:
            printf(" 0.0\n");
            break;
        case bool:
            printf(" false\n");
            break;
        case string:
            printf(" null\n");
            break;
        default:
            printf("\n");
    }
    printf("}\n\n");

    return;
}

void codegen_program(struct node *program){
    if(program == NULL){
        return;
    }

    // Analyse every function in the program
    struct node_list *functions = program->children;
    while((functions = functions->next) != NULL){
        codegen_function(functions->node);
    }

    struct symbol_list *entry = search_symbol(symbol_table, "main");
    if((entry != NULL) && (entry->node->category == FuncDecl)){
        printf(
                "define i32 @main() {\n"
                "  call void @_main()\n"
                "  ret i32 0\n"
                "}\n"
            );
    }

}