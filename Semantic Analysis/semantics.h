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

struct symbol_list_queue {
    struct symbol_list *table;
    struct symbol_list_queue *next;
    char *identifier;
};

enum type category_to_type(enum category category);


int check_program(struct node *program);
void check_var_decl(struct node *var_decl, struct symbol_list *scope);

void check_func_decl(struct node *func_decl);
void check_parameters(struct node *func_params, struct symbol_list *scope);

struct symbol_list *insert_symbol(struct symbol_list *symbol_table, char *identifier, enum type type, struct node *node, int is_parameter);
struct symbol_list *search_symbol(struct symbol_list *symbol_table, char *identifier);
void show_symbol_table();
void show_symbol_scopes();

#endif