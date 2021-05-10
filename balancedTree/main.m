//
//  main.m
//  balancedTree
//
//  Created by Rosnel Leyva-Cortés on 5/10/21.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "RedBlackTree.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
        Node *temp = [[Node alloc]initWithVal:1];
        RedBlackTree *test2 = [[RedBlackTree alloc]initWithNode:temp];
        test2.root.left = [[Node alloc]initWithVal:2];
        test2.root.left.prevParent = test2.root;
        test2.root.right = [[Node alloc]initWithVal:1];
        test2.root.right.prevParent = test2.root;
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}
//test
