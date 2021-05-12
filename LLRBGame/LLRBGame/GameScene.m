//
//  GameScene.m
//  LLRBGame
//
//  Created by Rosnel Leyva-Cortés on 5/11/21.
//

#import "GameScene.h"
#import "RedBlackTree.h"
#import "Node.h"
#import "GameViewController.h"

@implementation GameScene {
    RedBlackTree * gameTree;
    CGPoint rootPosiiton;
    CGFloat NodeBodySize;
    int connectionDistance;
    int storedValueFontSize;
}


//init the scene, starts first
- (void)didMoveToView:(SKView *)view {
    
    //initialization of values and important constants
    Node * rootNode = [[Node alloc] initWithVal:4];
    gameTree = [[RedBlackTree alloc] initWithNode:rootNode];
    rootPosiiton = CGPointMake(30.0, 30.0);
    NodeBodySize = 30;
    connectionDistance = 50;
    storedValueFontSize = 26;
    
    //array of vals to be inserted
   int insertionVals[4] = {3,6,100,2};
    
    //telling the user what's going on
    SKLabelNode *tellUser = [SKLabelNode labelNodeWithFontNamed:@"Arial"];tellUser.text = [NSString stringWithFormat:@"%@",@"Now Inserting: "];tellUser.fontSize = 26;
    tellUser.position = CGPointMake(50, 100);
    [self addChild:tellUser];
    
    
    //here we'll add the values of this tree
    for(int i=0;i<3;i++){
        [gameTree insert:insertionVals[i]];
    }
    
    //here we'll draw tree with just one object
    //[self drawChildren:gameTree.root];
}


//when the user touches, do things (draw the tree)
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //array of vals to be inserted
   int insertionVals[4] = {3,6,100,2};
    
    for(int i=1;i<4;i++){
        SKLabelNode *value = [SKLabelNode labelNodeWithFontNamed:@"Arial"];value.text = [NSString stringWithFormat:@" %i",insertionVals[i-1]];value.fontSize = 26;
        value.position = CGPointMake(130+(i*40), 100);
        [self addChild:value];
    }
    
    [self drawChildren:gameTree];
    
    
}



-(void)drawChildren:(RedBlackTree *)currentTree{
    
    //initialization, aka draw the root node first
    SKShapeNode * nodeBody = [SKShapeNode shapeNodeWithCircleOfRadius:NodeBodySize];
    SKLabelNode *nodeStoredValue = [SKLabelNode labelNodeWithFontNamed:@"Arial"];nodeStoredValue.text = [NSString stringWithFormat:@"%i",currentTree.root.storedValue];nodeStoredValue.fontSize = storedValueFontSize;
    nodeStoredValue.position = rootPosiiton;
    [nodeBody setPosition:rootPosiiton];
    [self addChild:nodeBody];
    [self addChild:nodeStoredValue];
    
    //draw left and right branches (rectangles that connect to next node)
    [self drawChildNodeConnections:gameTree.root xCord:rootPosiiton.x yCord:rootPosiiton.y];
    
    //keep on drawing recursively
    [self drawChildrenHelper:currentTree.root.left Xcoord:rootPosiiton.x - connectionDistance Ycoord:rootPosiiton.y - connectionDistance]; //left drawing
    [self drawChildrenHelper:currentTree.root.right Xcoord:rootPosiiton.x + connectionDistance Ycoord:rootPosiiton.y - connectionDistance]; //right drawing
}

-(void)drawChildrenHelper:(Node *)node Xcoord:(CGFloat)x Ycoord:(CGFloat)y{
    //if we reach a leaf node, just print the current node and its stored value, base case
    if(node.left == nil && node.right == nil){
        SKShapeNode * nodeBody = [SKShapeNode shapeNodeWithCircleOfRadius:NodeBodySize];
        SKLabelNode *nodeStoredValue = [SKLabelNode labelNodeWithFontNamed:@"Arial"];nodeStoredValue.text = [NSString stringWithFormat:@"%i",node.storedValue];nodeStoredValue.fontSize = storedValueFontSize;
        nodeBody.position =CGPointMake(x, y);
        nodeStoredValue.position =CGPointMake(x, y);
        [self addChild:nodeBody];
        [self addChild:nodeStoredValue];
        return;
    } else {
        SKShapeNode * nodeBody = [SKShapeNode shapeNodeWithCircleOfRadius:NodeBodySize];
        SKLabelNode *nodeStoredValue = [SKLabelNode labelNodeWithFontNamed:@"Arial"];nodeStoredValue.text = [NSString stringWithFormat:@"%i",node.storedValue];nodeStoredValue.fontSize = storedValueFontSize;
        nodeBody.position =CGPointMake(x, y);
        nodeStoredValue.position =CGPointMake(x, y);
        [self addChild:nodeBody];
        [self addChild:nodeStoredValue];
        [self drawChildNodeConnections:node xCord:x yCord:y];
        
        if(node.left != nil){ //if left is valid
            [self drawChildrenHelper:node.left Xcoord:x-connectionDistance Ycoord:y-connectionDistance];
        }
        if(node.right != nil){
            [self drawChildrenHelper:node.right Xcoord:x+connectionDistance Ycoord:y-connectionDistance];
        }
    }
}


-(void)drawChildNodeConnections:(Node *)node xCord:(CGFloat)x yCord:(CGFloat)y{
    if(node.left.red == true){
        SKShapeNode *yourline = [SKShapeNode node];
        CGMutablePathRef pathToDraw = CGPathCreateMutable();
        CGPathMoveToPoint(pathToDraw, NULL, x, y);
        CGPathAddLineToPoint(pathToDraw, NULL, x-connectionDistance, y-connectionDistance); //50 to the left/right or up/down is the way to draw this
        yourline.path = pathToDraw;
        [yourline setStrokeColor:[SKColor redColor]];
        [self addChild:yourline];
    } else {
        SKShapeNode *yourline = [SKShapeNode node];
        CGMutablePathRef pathToDraw = CGPathCreateMutable();
        CGPathMoveToPoint(pathToDraw, NULL, x, y);
        CGPathAddLineToPoint(pathToDraw, NULL, x-connectionDistance, y-connectionDistance); //50 to the left/right or up/down is the way to draw this
        yourline.path = pathToDraw;
        [yourline setStrokeColor:[SKColor blackColor]];
        [self addChild:yourline];
    }
    
    if(node.right.red == true){
        SKShapeNode *yourline = [SKShapeNode node];
        CGMutablePathRef pathToDraw = CGPathCreateMutable();
        CGPathMoveToPoint(pathToDraw, NULL, x, y);
        CGPathAddLineToPoint(pathToDraw, NULL, x+connectionDistance, y-connectionDistance); //50 to the left/right or up/down is the way to draw this
        yourline.path = pathToDraw;
        [yourline setStrokeColor:[SKColor redColor]];
        [self addChild:yourline];
    } else {
        SKShapeNode *yourline = [SKShapeNode node];
        CGMutablePathRef pathToDraw = CGPathCreateMutable();
        CGPathMoveToPoint(pathToDraw, NULL, x, y);
        CGPathAddLineToPoint(pathToDraw, NULL, x+connectionDistance, y-connectionDistance); //50 to the left/right or up/down is the way to draw this
        yourline.path = pathToDraw;
        [yourline setStrokeColor:[SKColor blackColor]];
        [self addChild:yourline];
    }
}



-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
