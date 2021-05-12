//
//  RedBlackTree.h
//  LLRBGame
//
//  Created by Rosnel Leyva-Cortés on 5/11/21.
//

#ifndef RedBlackTree_h
#define RedBlackTree_h

#import <Foundation/Foundation.h>
#import "Node.h"

@interface RedBlackTree : NSObject

@property Node* root;

-(instancetype)init;

-(instancetype)initWithNode:(Node*) input;

-(Node *) rotateRight:(Node *)rightInput;

-(Node *) rotateLeft: (Node *) leftInput;


-(void) insert: (int) input;

-(bool) switchColors:(Node *) input;


@end
#endif /* RedBlackTree_h */
