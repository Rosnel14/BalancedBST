//
//  RedBlackTree.h
//  balancedTree
//
//  Created by zyuan22 on 5/10/21.
//

#import <Foundation/Foundation.h>

#import "Node.h"
@interface RedBlackTree : NSObject

@property Node* root;

-(instancetype)init;

-(instancetype)initWithNode:(Node*) input;

-(void) rotateRight: (Node *) leftInput :(Node *)rightInput;

-(void) rotateLeft: (Node *) leftInput :(Node *)rightInput;

@end

