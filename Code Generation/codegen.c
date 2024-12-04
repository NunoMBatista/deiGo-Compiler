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

    struct node *type = get_child(var_decl, 0);
    struct node *id = get_child(var_decl, 1);

    enum category category = type->category;
    enum type var_type = category_to_type(category);

    printf(
        "  %%%s = alloca %s\n", id->token, llvm_types(var_type)
        );
}

int codegen_identifier(struct node *id){
    if(id == NULL){
        return 0;
    }

    printf(
        "  %%%d = load %s, %s* %%%s\n", temporary, llvm_types(id->type), llvm_types(id->type), id->token
    );

    return temporary++;
}

int codegen_natural(struct node *natural_node){
    if(natural_node == NULL){
        return 0;
    }

    printf(
        "  %%%d = add i32 %s, 0\n", temporary, natural_node->token
    );

    return temporary++;
}

int codegen_add(struct node *add) {
    if(add == NULL) {
        return 0;
    }

    struct node *left = get_child(add, 0);
    struct node *right = get_child(add, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    // Choose add instruction based on type
    if(add->type == float32) {
        printf("  %%%d = fadd double %%%d, %%%d\n", 
            temporary, left_temp, right_temp);
    } else {
        printf("  %%%d = add i32 %%%d, %%%d\n", 
            temporary, left_temp, right_temp);
    }

    return temporary++;
}

int codegen_sub(struct node *sub){
    if(sub == NULL){
        return 0;
    }

    struct node *left = get_child(sub, 0);
    struct node *right = get_child(sub, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    if(sub->type == float32){
        printf(
            "  %%%d = fsub double %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else{
        printf(
            "  %%%d = sub i32 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }

    return temporary++;
}

int codegen_mul(struct node *mul){
    if(mul == NULL){
        return 0;
    }

    struct node *left = get_child(mul, 0);
    struct node *right = get_child(mul, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    if(mul->type == float32){
        printf(
            "  %%%d = fmul double %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else{
        printf(
            "  %%%d = mul i32 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }

    return temporary++;
}

int codegen_div(struct node *div){
    if(div == NULL){
        return 0;
    }

    struct node *left = get_child(div, 0);
    struct node *right = get_child(div, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    if(div->type == float32){
        printf(
            "  %%%d = fdiv double %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else{
        printf(
            "  %%%d = sdiv i32 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }

    return temporary++;
}

int codegen_mod(struct node *mod){
    if(mod == NULL){
        return 0;
    }

    struct node *left = get_child(mod, 0);
    struct node *right = get_child(mod, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    printf(
        "  %%%d = srem i32 %%%d, %%%d\n", temporary, left_temp, right_temp
    );

    return temporary++;
}

int codegen_decimal(struct node *decimal){
    if(decimal == NULL){
        return 0;
    }

    printf(
        "  %%%d = fadd double %s, 0.0\n", temporary, decimal->token
    );

    return temporary++;
}

int codegen_strlit(struct node *strlit){
    // Strlits should be type i8*
    if(strlit == NULL){
        return 0;
    }

    // Remove the quotes from the string
    char *clean_str = strlit->token + 1;
    clean_str[strlen(clean_str) - 1] = '\0';

    printf(
        "  %%%d = alloca [ %ld x i8 ]\n"
        "  store [ %ld x i8 ] c\"%s\\00\", [ %ld x i8 ]* %%%d\n", 
        temporary, strlen(clean_str) + 1, strlen(clean_str) + 1, clean_str, strlen(clean_str) + 1, temporary
    );

    return temporary++;
}

int codegen_or(struct node *or){
    if(or == NULL){
        return 0;
    }

    struct node *left = get_child(or, 0);
    struct node *right = get_child(or, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    printf(
        "  %%%d = or i1 %%%d, %%%d\n", temporary, left_temp, right_temp
    );

    return temporary++;
}

int codegen_eq(struct node *eq){
    if(eq == NULL){
        return 0;
    }

    struct node *left = get_child(eq, 0);
    struct node *right = get_child(eq, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    // Can compare integers, floats, and booleans

    if (left->type == bool){
        printf(
            "  %%%d = icmp eq i1 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else if(left->type == float32){
        printf(
            "  %%%d = fcmp oeq double %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else{
        printf(
            "  %%%d = icmp eq i32 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }       

    return temporary++;
}

int codegen_and(struct node *and){
    if(and == NULL){
        return 0;
    }

    struct node *left = get_child(and, 0);
    struct node *right = get_child(and, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    printf(
        "  %%%d = and i1 %%%d, %%%d\n", temporary, left_temp, right_temp
    );

    return temporary++;
}

int codegen_ne(struct node *ne){
    if(ne == NULL){
        return 0;
    }

    struct node *left = get_child(ne, 0);
    struct node *right = get_child(ne, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    if (left->type == bool){
        printf(
            "  %%%d = icmp ne i1 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else if(left->type == float32){
        printf(
            "  %%%d = fcmp one double %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else{
        printf(
            "  %%%d = icmp ne i32 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }       

    return temporary++;
}

int codegen_lt(struct node *lt){
    if(lt == NULL){
        return 0;
    }

    struct node *left = get_child(lt, 0);
    struct node *right = get_child(lt, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    if(left->type == float32){
        printf(
            "  %%%d = fcmp olt double %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else{
        printf(
            "  %%%d = icmp slt i32 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }

    return temporary++;
}

int codegen_gt(struct node *gt){
    if(gt == NULL){
        return 0;
    }

    struct node *left = get_child(gt, 0);
    struct node *right = get_child(gt, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    if(left->type == float32){
        printf(
            "  %%%d = fcmp ogt double %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else{
        printf(
            "  %%%d = icmp sgt i32 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }

    return temporary++;
}

int codegen_le(struct node *le){
    if(le == NULL){
        return 0;
    }

    struct node *left = get_child(le, 0);
    struct node *right = get_child(le, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    if(left->type == float32){
        printf(
            "  %%%d = fcmp ole double %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else{
        printf(
            "  %%%d = icmp sle i32 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }

    return temporary++;
}

int codegen_ge(struct node *ge){
    if(ge == NULL){
        return 0;
    }

    struct node *left = get_child(ge, 0);
    struct node *right = get_child(ge, 1);

    int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);

    if(left->type == float32){
        printf(
            "  %%%d = fcmp oge double %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }
    else{
        printf(
            "  %%%d = icmp sge i32 %%%d, %%%d\n", temporary, left_temp, right_temp
        );
    }

    return temporary++;
}

int codegen_not(struct node *not){
    if(not == NULL){
        return 0;
    }

    struct node *expression = get_child(not, 0);

    int expr_temp = codegen_expression(expression);

    printf(
        "  %%%d = xor i1 %%%d, true\n", temporary, expr_temp
    );

    return temporary++;
}

int codegen_minus(struct node *minus){
    if(minus == NULL){
        return 0;
    }

    struct node *expression = get_child(minus, 0);

    int expr_temp = codegen_expression(expression);

    if(expression->type == float32){
        printf(
            "  %%%d = fsub double 0.0, %%%d\n", temporary, expr_temp
        );
    }
    else{
        printf(
            "  %%%d = sub i32 0, %%%d\n", temporary, expr_temp
        );
    }

    return temporary++;
}

int codegen_plus(struct node *plus){
    if(plus == NULL){
        return 0;
    }

    struct node *expression = get_child(plus, 0);

    int expr_temp = codegen_expression(expression);

    return expr_temp;
}

int codegen_call(struct node *call){
    if(call == NULL){
        return 0;
    }

    struct node *id = get_child(call, 0);

    // Get the function's return type
    struct symbol_list *function_symbol = search_symbol(symbol_table, id->token);
    enum type return_type = function_symbol->type;


    char args_str[4096];
    args_str[0] = '\0';

    // Print comma separated arguments
    int cur_idx = 1;
    struct node *cur_arg;
    while((cur_arg = get_child(call, cur_idx)) != NULL){
        int arg_temp = codegen_expression(cur_arg);
        char arg_str[128];
        sprintf(arg_str, "%s %%%d", llvm_types(cur_arg->type), arg_temp);
        strcat(args_str, arg_str);
        if(get_child(call, cur_idx + 1) != NULL){
            strcat(args_str, ", ");
        }
        cur_idx++;
    }
    // Start of the call
    printf("  call %s @_%s(", llvm_types(return_type), id->token);
    // Print arguments
    printf("%s", args_str);
    // End of the call
    printf(")\n");

    return temporary++;
}

int codegen_expression(struct node *expression){
    if(expression == NULL){
        return 0;
    }

    enum category cur_category = expression->category;

    int tmp = temporary;
    switch(cur_category){
        case Or:
            tmp = codegen_or(expression);
            break;
        case And:
            tmp = codegen_and(expression);
            break;
        case Eq:
            tmp = codegen_eq(expression);
            break;
        case Ne:
            tmp = codegen_ne(expression);
            break;
        case Lt:
            tmp = codegen_lt(expression);
            break;
        case Gt:
            tmp = codegen_gt(expression);
            break;
        case Le:
            tmp = codegen_le(expression);
            break;
        case Ge:
            tmp = codegen_ge(expression);
            break;
        case Add:
            tmp = codegen_add(expression);
            break;
        case Sub:
            tmp = codegen_sub(expression);
            break;
        case Mul:
            tmp = codegen_mul(expression);
            break;
        case Div:
            tmp = codegen_div(expression);
            break;
        case Mod:
            tmp = codegen_mod(expression);
            break;
        case Not:
            tmp = codegen_not(expression);
            break;
        case Minus:
            tmp = codegen_minus(expression);
            break;
        case Plus:
            tmp = codegen_plus(expression);
            break;
        case StrLit:
            tmp = codegen_strlit(expression);
            break;
        case Natural:
            tmp = codegen_natural(expression);
            break;
        case Decimal:
            tmp = codegen_decimal(expression);
            break;
        case Identifier:
            tmp = codegen_identifier(expression);
            break;
        case Call:
            tmp = codegen_call(expression);
            break;
        default:
            break;
    }

    return tmp;
}

void codegen_assign(struct node *assign){
    if(assign == NULL){
        return;
    }

    struct node *left = get_child(assign, 0);
    struct node *right = get_child(assign, 1);

    //int left_temp = codegen_expression(left);
    int right_temp = codegen_expression(right);
    printf(
        "  store %s %%%d, %s* %%%s\n", llvm_types(left->type), right_temp, llvm_types(left->type), left->token
    );
}

void codegen_print(struct node *print_node){
    if(print_node == NULL){
        return;
    }

    struct node *expression = get_child(print_node, 0);

    enum type print_type = expression->type;
    
    int expr_temp = codegen_expression(expression);
    switch(print_type){
        case integer:
            printf("  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_int, i32 0, i32 0), i32 %%%d)\n", 
                expr_temp);
            temporary++;
            break;
        case float32:
            printf("  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_float, i32 0, i32 0), double %%%d)\n", 
                expr_temp);
            temporary++;
            break;
        case bool:
            // Print false (@.str_false) or true (@.str_true) based on the value

            // branch to print either the strings "true" or "false"
            printf(
                "  br i1 %%%d, label %%L%dtrue, label %%L%dfalse\n"
                "L%dtrue:\n"
                "  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str_true, i32 0, i32 0))\n"
                "  br label %%L%dend\n"
                "L%dfalse:\n"
                "  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str_false, i32 0, i32 0))\n"
                "  br label %%L%dend\n"
                "L%dend:\n",
                expr_temp, temporary, temporary, temporary, temporary, temporary, temporary, temporary
                );
            temporary += 2;
            break;
        case string:
            // Get pointer to start of array
            printf("  %%ptr%d = getelementptr inbounds [%zu x i8], [%zu x i8]* %%%d, i32 0, i32 0\n", 
                temporary, strlen(expression->token), strlen(expression->token), expr_temp);
            // Print using the pointer
            printf("  call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str_string, i32 0, i32 0), i8* %%ptr%d)\n",
                temporary);
            temporary++;
            break;
        default:
            break;
    }

}

void codegen_return(struct node *return_node){
    if(return_node == NULL){
        return;
    }

    struct node *expression = get_child(return_node, 0);

    int expr_temp = codegen_expression(expression);
    printf(
        "  ret %s %%%d\n", llvm_types(expression->type), expr_temp
    );
}

void codegen_if(struct node *if_node){
    if(if_node == NULL){
        return;
    }

    struct node *condition = get_child(if_node, 0);
    struct node *if_body = get_child(if_node, 1);
    struct node *else_body = get_child(if_node, 2);

    int cond_temp = codegen_expression(condition);

    // Create labels for the if statement
    int if_label = temporary++;
    int else_label = temporary++;
    int end_label = temporary++;

    // Branch to the if or else body
    printf(
        "  br i1 %%%d, label %%L%dtrue, label %%L%dfalse\n"
        "L%dtrue:\n", cond_temp, if_label, else_label, if_label
    );

    codegen_statement(if_body);

    // Jump to the end of the if statement
    printf(
        "  br label %%L%dend\n"
        "L%dfalse:\n", end_label, else_label
    );

    codegen_statement(else_body);

    // End of the if statement
    printf(
        "  br label %%L%dend\n"
        "L%dend:\n", end_label, end_label
    );
}

void codegen_for(struct node *for_node){
    if(for_node == NULL){
        return;
    }

    struct node *init = get_child(for_node, 0);
    struct node *condition = get_child(for_node, 1);
    struct node *increment = get_child(for_node, 2);
    struct node *for_body = get_child(for_node, 3);

    // Create labels for the for loop
    int init_label = temporary++;
    int condition_label = temporary++;
    int body_label = temporary++;
    int increment_label = temporary++;
    int end_label = temporary++;

    // Initialisation
    printf(
        "  br label %%L%dinit\n"
        "L%dinit:\n", init_label, init_label
    );
    codegen_statement(init);

    // Condition
    printf(
        "  br label %%L%dcond\n"
        "L%dcond:\n", condition_label, condition_label
    );
    int cond_temp = codegen_expression(condition);
    printf(
        "  br i1 %%%d, label %%L%dbody, label %%L%dend\n"
        "L%dbody:\n", cond_temp, body_label, end_label, body_label
    );

    // Body
    codegen_statement(for_body);
    printf(
        "  br label %%L%dincr\n"
        "L%dincr:\n", increment_label, increment_label
    );

    // Increment
    codegen_statement(increment);
    printf(
        "  br label %%L%dcond\n", condition_label
    );

    // End of the for loop
    printf(
        "L%dend:\n", end_label
    );
}

void codegen_block(struct node *block){
    if(block == NULL){
        return;
    }

    struct node_list *cur_child = block->children;
    while((cur_child = cur_child->next) != NULL){
        struct node *cur_node = cur_child->node;
        codegen_statement(cur_node);
    }
}

int codegen_statement(struct node *statement){
    if(statement == NULL){
        return temporary;
    }

    enum category cur_category = statement->category;
    switch(cur_category){
        case Assign:
            codegen_assign(statement);
            break;
        case If:
            codegen_if(statement);
            break;
        case For:
            codegen_for(statement);
            break;
        case Return:
            codegen_return(statement);
            break;
        case Call:
            codegen_call(statement);
            break;
        case Block:
            codegen_block(statement);
            break;
        case Print:
            codegen_print(statement);
            break;
        case ParseArgs:
            //codegen_parse_args(statement);
            break;
        default:
            break;
    }

    return temporary; 
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

    // Declare printf function
    printf(
        "declare i32 @printf(i8*, ...)\n"
        "@.str_int = private constant [4 x i8] c\"%%d\\0A\\00\"\n"
        "@.str_float = private constant [7 x i8] c\"%%.08f\\0A\\00\"\n"
        "@.str_true = private constant [6 x i8] c\"true\\0A\\00\"\n"
        "@.str_false = private constant [7 x i8] c\"false\\0A\\00\"\n"
        "@.str_string = private constant [4 x i8] c\"%%s\\0A\\00\"\n"
        "\n\n"
    );

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