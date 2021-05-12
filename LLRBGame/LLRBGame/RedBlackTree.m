//
//  RedBlackTree.m
//  LLRBGame
//
//  Created by Rosnel Leyva-Cortés on 5/11/21.
//

#import <Foundation/Foundation.h>
#import "RedBlackTree.h"

@implementation RedBlackTree{
    int preOrderPos;
}

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


-(Node *) rotateRight:(Node *)rightInput{


   Node *leftInput = rightInput.left;

   rightInput.left = leftInput.right;

   leftInput.right = rightInput;

   bool temp = leftInput.red;

   leftInput.red = rightInput.red;

   rightInput.red = temp;

   return leftInput;

}


-(Node *) rotateLeft: (Node *) leftInput{

   Node *rightInput = leftInput.right;

   leftInput.right = rightInput.left;

   rightInput.left = leftInput;

   bool temp = leftInput.red;

   leftInput.red = rightInput.red;

   rightInput.red = temp;

   return rightInput;

}


-(void) insert: (int) input{

   Node *GrandParentNode = self.root;

   Node *ParentNode = self.root;

   Node *CurrentNode = self.root;

   bool right = NO;

   bool right2 = NO;

   while(CurrentNode != nil){

       if(input > CurrentNode.storedValue){

           right2 = right;

           right = YES;

           GrandParentNode = ParentNode;

           ParentNode = CurrentNode;

           CurrentNode = CurrentNode.right;

       } else {

           right2 = right;

           right = NO;

           GrandParentNode = ParentNode;

           ParentNode = CurrentNode;

           CurrentNode = CurrentNode.left;

       }

   }

   CurrentNode = [[Node alloc]initWithVal:input];

   if(right){

       ParentNode.right = CurrentNode;

   } else {

       ParentNode.left = CurrentNode;

   }

   [self fix:GrandParentNode];

}


- (bool) switchColors:(Node *) input{

   if(input.left.red && input.right.red){

       input.left.red = NO;

       input.right.red = NO;

       input.red = YES;

       return YES;

   }

   return NO;

}


- (Node *) fix:(Node *) input{

   if(input == nil){

       return nil;

   }

   if(input.right.red){

       input = [self rotateLeft:input];

   }

   input.left = [self fix:input.left];

   input.right = [self fix:input.right];

   if(input.left.red && input.left.left.red){

       input = [self rotateRight:input];

   }

   if([self switchColors:input]){

       [self fix:self.root];

   }

   return input;

}

@end
