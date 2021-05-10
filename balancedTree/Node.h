//
//  Node.h
//  balancedTree
//
//  Created by Rosnel Leyva-Cortés on 5/10/21.
//

#ifndef Node_h
#define Node_h

@interface Node : NSObject

@property Node * prevParent;

@property Node * left;

@property Node * right;

@property BOOL red;

@property int storedValue;

-(instancetype)init;

-(instancetype)initWithVal:(int)value;

@end

#endif /* Node_h */
