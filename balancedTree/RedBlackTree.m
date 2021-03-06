//
//  RedBlackTree.m
//  balancedTree
//
//  Created by zyuan22 on 5/10/21.
//

#import "RedBlackTree.h"

@implementation RedBlackTree

-(instancetype)init{
    if(self){
        self = [super init];
    }
    return self;
}

-(instancetype)initWithNode:(Node *)input{
    if(self){
        self = [super init];
        self.root = input;
    }
    return self;
}

-(void) rotateRight: (Node *) leftInput :(Node *)rightInput{
    bool left;
    if(rightInput != self.root){
    Node *tempParent = rightInput.prevParent;
    if(tempParent.left == leftInput){
        left = YES;
    } else {
        left = NO;
    }
    if(left){
        tempParent.left = leftInput;
    } else {
        tempParent.right = rightInput;
    }
    leftInput.prevParent = tempParent;
    } else {
        self.root = leftInput;
        rightInput.prevParent = leftInput;
        leftInput.prevParent = nil;
    }
    rightInput.left = leftInput.right;
    leftInput.right.prevParent = rightInput;
    rightInput.prevParent = leftInput;
    leftInput.right = rightInput;
}

-(void) rotateLeft: (Node *) leftInput :(Node *)rightInput{
    bool left;
    if(leftInput != self.root){
    Node *tempParent = leftInput.prevParent;
    if(tempParent.left == leftInput){
        left = YES;
    } else {
        left = NO;
    }
    if(left){
        tempParent.left = leftInput;
    } else {
        tempParent.right = rightInput;
    }
    rightInput.prevParent = tempParent;
    } else {
        self.root = rightInput;
        rightInput.prevParent = nil;
        leftInput.prevParent = rightInput;
        
    }
    leftInput.right = rightInput.left;
    rightInput.left.prevParent = leftInput;
    leftInput.prevParent = rightInput;
    rightInput.left = leftInput;
}

@end
