#ifndef _AST_H
#define _AST_H

enum category {  Program ,  VarDecl ,  FuncHeader ,  FuncParams ,  FuncBody ,  ParamDecl ,  Block ,  If ,  For ,  Return ,  Call ,  Print ,  ParseArgs ,  Or ,  And ,  Eq ,  Ne ,  Lt ,  Gt ,  Le ,  Ge ,  Add ,  Sub ,  Mul ,  Div ,  Mod ,  Not ,  Minus ,  Plus ,  Assign ,  Int ,  Float32 ,  Bool ,  String ,  Natural ,  Decimal ,  Identifier ,  StrLit  };
#define names { "Program", "VarDecl", "FuncHeader", "FuncParams", "FuncBody", "ParamDecl", "Block", "If", "For", "Return", "Call", "Print", "ParseArgs", "Or", "And", "Eq", "Ne", "Lt", "Gt", "Le", "Ge", "Add", "Sub", "Mul", "Div", "Mod", "Not", "Minus", "Plus", "Assign", "Int", "Float32", "Bool", "String", "Natural", "Decimal", "Identifier", "StrLit" }

struct node {
    enum category category;
    char *token;
    struct node_list *children;
};

struct node_list {
    struct node *node;
    struct node_list *next;
};

struct node *new_node(enum category category, char *token);
void add_child(struct node *parent, struct node *child);
void dfs(struct node *cur_node, int depth);

#endif
