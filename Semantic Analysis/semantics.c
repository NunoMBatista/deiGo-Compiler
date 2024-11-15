#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"
#include "semantics.h"

int semantic_errors = 0;

struct symbol_list *symbol_table;
struct symbol_list_queue *symbol_scopes;

char *type_name[] = t_name;

enum type category_to_type(enum category category){
    switch(category){
        case Int:
            return integer;
        case Float32:
            return float32;
        case Bool:
            return bool;
        case String:
            return string;
        default:
            return undef;
    }
}

int check_program(struct node *program){
    if(program == NULL){
        return 0;
    }

    // Initialize the global symbol table
    symbol_table = (struct symbol_list *) malloc(sizeof(struct symbol_list));
    symbol_table->next = NULL;

    // Initialize the local scopes
    symbol_scopes = (struct symbol_list_queue *) malloc(sizeof(struct symbol_list_queue));
    
    struct node_list *cur_child = program->children;

    while((cur_child = cur_child->next) != NULL){
        enum category cur_category = cur_child->node->category;
        struct node *cur_node = cur_child->node;
        
        if(cur_category == VarDecl){
            check_var_decl(cur_child->node, symbol_table);
        }
        if(cur_category == FuncDecl){
            struct node *func_header = get_child(cur_node, 0);
            struct node *id = get_child(func_header, 0);

            check_func_decl(cur_child->node);
        }
    }
    return semantic_errors;
}

void check_func_decl(struct node *func_decl){
    if(func_decl == NULL){
        return;
    }

    struct node *func_header = get_child(func_decl, 0);
    struct node *id = get_child(func_header, 0);

    if(search_symbol(symbol_table, id->token) != NULL){
        /* TODO: HANDLE ERRORS */
    }

    // Get the return type of the function
    struct node *return_type_node = get_child(func_header, 1);

    enum type return_type;
    // If the second child of the FuncHeader are the parameters, then there is no return type
    if(return_type_node->category == FuncParams){
        return_type = none;
    }
    else{
        return_type = category_to_type(return_type_node->category);
    }
    
    
    // Insert the function id in the global symbol table
    insert_symbol(symbol_table, id->token, return_type, func_decl, 0);


    // Create a new scope for the function
    struct symbol_list *new_scope = (struct symbol_list *) malloc(sizeof(struct symbol_list));
    new_scope->identifier = strdup(id->token);
    new_scope->next = NULL;

    // Add the new scope to the queue
    struct symbol_list_queue *new_queue_entry = (struct symbol_list_queue *) malloc(sizeof(struct symbol_list_queue));
    new_queue_entry->table = new_scope; 
    new_queue_entry->next = symbol_scopes; 
    new_queue_entry->identifier = strdup(id->token); // The identifier of the function is the same as the scope identifier
    symbol_scopes = new_queue_entry;

    // Check the function parameters
    struct node *func_params = get_child(func_header, 1);
    check_parameters(func_params, new_scope);
}

void check_parameters(struct node *func_params, struct symbol_list *scope){

}

void check_var_decl(struct node *var_decl, struct symbol_list *scope){
    if(var_decl == NULL){
        return;
    }

    // The id is the second child of the VarDecl node
    struct node *id = get_child(var_decl, 1);
    // The type is the first child of the VarDecl node
    struct node *type = get_child(var_decl, 0);

    // Check if the variable is already declared in the current scope
    if(search_symbol(scope, id->token) != NULL){
        /* TODO: HANDLE ERRORS */
        return;
    }

    // Insert the variable in the current scope
    enum category type_category = type->category;
    enum type var_type = category_to_type(type_category);

    insert_symbol(scope, id->token, var_type, id, 0);
}   

// insert a new symbol in the list, unless it is already there
struct symbol_list *insert_symbol(struct symbol_list *table, char *identifier, enum type type, struct node *node, int is_parameter) {
    struct symbol_list *new = (struct symbol_list *) malloc(sizeof(struct symbol_list));
    new->identifier = strdup(identifier);
    new->type = type;
    new->node = node;
    new->next = NULL;
    new->is_parameter = is_parameter;
    struct symbol_list *symbol = table;
    while(symbol != NULL) {
        if(symbol->next == NULL) {
            symbol->next = new;    /* insert new symbol at the tail of the list */
            break;
        } else if(strcmp(symbol->next->identifier, identifier) == 0) {
            free(new);
            return NULL;           /* return NULL if symbol is already inserted */
        }
        symbol = symbol->next;
    }
    return new;
}

// look up a symbol by its identifier
struct symbol_list *search_symbol(struct symbol_list *table, char *identifier) {
    struct symbol_list *symbol;
    for(symbol = table->next; symbol != NULL; symbol = symbol->next)
        if(strcmp(symbol->identifier, identifier) == 0)
            return symbol;
    return NULL;
}

void show_symbol_table() {
    printf("\n==== Global Scope ====\n");
    struct symbol_list *symbol;
    for(symbol = symbol_table->next; symbol != NULL; symbol = symbol->next)
        printf("%s\t%s\n", symbol->identifier, type_name[symbol->type]);
}

void show_symbol_scopes() {
    // Reverse the linked list to print in FIFO order
    struct symbol_list_queue *prev = NULL;
    struct symbol_list_queue *current = symbol_scopes;
    struct symbol_list_queue *next = NULL;

    while (current != NULL) {
        next = current->next;
        current->next = prev;
        prev = current;
        current = next;
    }
    symbol_scopes = prev;

    // Print the reversed list
    struct symbol_list_queue *cur_scope = symbol_scopes;
    while((cur_scope = cur_scope->next) != NULL){
        printf("\n==== Function %s(PARAMETER TYPES) Symbol Table ====\n", cur_scope->identifier);
        struct symbol_list *cur_symbol = cur_scope->table;
        
        while((cur_symbol = cur_symbol->next) != NULL){
            printf("%s\t%s", cur_symbol->identifier, type_name[cur_symbol->type]);
            if(cur_symbol->is_parameter){
                printf("\tparam\n");
            }
            printf("\n");
        }
        // cur_scope = cur_scope->next;
    }
}