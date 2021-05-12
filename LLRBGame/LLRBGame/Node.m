//
//  Node.m
//  LLRBGame
//
//  Created by Rosnel Leyva-Cortés on 5/11/21.
//


#import <Foundation/Foundation.h>

#import "Node.h"


@implementation Node


-(instancetype)init{

   if(self){

       self = [super init];

       self.red = true;

       self.storedValue = 0;

   }

   return self;

}


-(instancetype)initWithVal:(int)value{

   if(self){

       self = [super init];

       self.red = true;

       self.storedValue = value;

   }

   return self;

}


@end
