#ifndef _CODEGEN_H
#define _CODEGEN_H

#include "ast.h"
#include "semantics.h"

char* llvm_types(enum type type);

void codegen_program(struct node *program);

void codegen_function(struct node * function);
void codegen_func_header(struct node *func_header, enum type return_type);
void codegen_body(struct node *func_body);
int codegen_statement(struct node *statement);
void codegen_body(struct node *func_body);

#endif