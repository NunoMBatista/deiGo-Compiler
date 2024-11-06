#include <stdlib.h>
#include <stdio.h>
#include "ast.h"
#include <string.h>

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
    if(parent == NULL || child == NULL){
        return;
    }

    struct node_list *new = malloc(sizeof(struct node_list));
    new->node = child;
    new->next = NULL;
    struct node_list *children = parent->children;
    while(children->next != NULL)
        children = children->next;
    children->next = new;
}

// Remove the first child from the list of children of the parent node
void remove_first_child(struct node *parent) {
    struct node_list *children = parent->children;
    if(children->next == NULL)
        return;
    struct node_list *new = children->next;
    parent->children = new;
    free(children);
}


// Names defined in ast.h
const char *category_name[] = names;

// Perform a depth-first search to print the AST
void dfs(struct node *cur_node, int depth){
    // No AST
    if(cur_node == NULL){
        return;
    }

    // Don't print auxiliary nodes
    if(cur_node->category != AUX){
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
    }
    
    // Visit all children
    if(cur_node->children == NULL){
        return;
    }
    struct node_list *child = cur_node->children;
    while((child = child->next) != NULL){
        if(child->node->category == AUX){
            // Don't increase the depth for auxiliary nodes
            dfs(child->node, depth);
        }
        else{
            dfs(child->node, depth+1);
        }
    }
}

// Free the AST
void free_ast (struct node * cur_node){
    if(cur_node == NULL){
        return;
    }

    struct node_list *child = cur_node->children;
    while(child != NULL){
        struct node_list *next = child->next;
        
        if(child->node != NULL){
            free_ast(child->node);
        }
        free(child);
        child = next;
    }
    if(cur_node->token != NULL){
        free(cur_node->token);
        cur_node->token = NULL;
    }
    free(cur_node);
}

// free the AST
void deallocate(struct node *node) {
    if(node != NULL) {
        struct node_list *child = node->children;
        while(child != NULL) {
            deallocate(child->node);
            struct node_list *tmp = child;
            child = child->next;
            free(tmp);
        }
        if(node->token != NULL)
            free(node->token);
        free(node);
    }
}

/*
Count the number of block elements in order to 
determine whether or not the node is supperfluous
*/
int block_elements(struct node* cur_node){
    int count = 0;
    if(cur_node == NULL){
        return count;
    }

    struct node_list *child = cur_node->children;
    while((child = child->next) != NULL){
        if(child->node->category != AUX){
            count++;
        }
        else{
            // If the child node is an auxiliary node, we need to count its children
            count += block_elements(child->node);
        }
    }
    return count;
}