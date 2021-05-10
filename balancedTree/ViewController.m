//
//  ViewController.m
//  balancedTree
//
//  Created by Rosnel Leyva-Cortés on 5/10/21.
//

#import "ViewController.h"



@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _metalView.enableSetNeedsDisplay = YES;
    _metalView.device = MTLCreateSystemDefaultDevice();
    _metalView.clearColor = MTLClearColorMake(0.0, 0.5, 1.0, 1.0);
}


@end
