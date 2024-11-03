#include <stdlib.h>
#include <stdio.h>
#include "ast.h"

// Create a node of a given category with a given lexical symbol
struct node *new_node(enum category category, char *token) {
    struct node *new = malloc(sizeof(struct node));
    new->category = category;
    new->token = token;
    new->children = malloc(sizeof(struct node_list));
    new->children->node = NULL;
    new->children->next = NULL;
    return new;
}

// Append a node to the list of children of the parent node
void add_child(struct node *parent, struct node *child) {
    struct node_list *new = malloc(sizeof(struct node_list));
    new->node = child;
    new->next = NULL;
    struct node_list *children = parent->children;
    while(children->next != NULL)
        children = children->next;
    children->next = new;
}

// Names defined in ast.h
const char *category_name[] = names;

// Perform a depth-first search to print the AST
void dfs(struct node *cur_node, int depth){
    // Add indentation according to the current depth
    for(int i = 0; i < depth; i++){
        printf("..");
    }    

    // Print the category and the token (if it exists)
    if(cur_node->token == NULL){
        printf("%s\n", category_name[cur_node->category]);
    }
    else{
        printf("%s(%s)\n", category_name[cur_node->category], cur_node->token);
    }
    
    // Visit all children
    struct node_list *child = cur_node->children;
    while((child = child->next) != NULL){
        dfs(child->node, depth+1);
    }
}
