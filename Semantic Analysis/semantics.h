#ifndef _SEMANTICS_H
#define _SEMANTICS_H

#include "ast.h"

struct symbol_list {
    char *identifier;
    enum type type;
    struct node *node; 
    int is_parameter;
    struct symbol_list *next;
};

// Sequence of symbol lists
struct scopes_queue {
    struct symbol_list *table;
    struct scopes_queue *next;
    char *identifier;
};

enum type category_to_type(enum category category);


int check_program(struct node *program);
void check_var_decl(struct node *var_decl, struct symbol_list *scope);

void check_func_decl(struct node *func_decl);
void check_parameters(struct node *func_params, struct symbol_list *scope);
void check_func_body(struct node *func_body, struct symbol_list *scope);

void check_statements(struct node *cur_node, struct symbol_list *scope);
enum type check_call(struct node *call_node, struct symbol_list *scope, int is_statement);
void check_assign(struct node *assign, struct symbol_list *scope);
void check_if(struct node *if_node, struct symbol_list *scope);
void check_for(struct node *for_node, struct symbol_list *scope);
void check_return(struct node *return_node, struct symbol_list *scope);
enum type check_expression(struct node *expression, struct symbol_list *scope);

int var_exists(struct node *var, struct symbol_list *scope);

struct symbol_list *insert_symbol(struct symbol_list *symbol_table, char *identifier, enum type type, struct node *node, int is_parameter);
struct symbol_list *search_symbol(struct symbol_list *symbol_table, char *identifier);
char *get_func_parameter_types(char *function_name, struct scopes_queue *scope);
void show_symbol_table();
void show_symbol_scopes();

#endif