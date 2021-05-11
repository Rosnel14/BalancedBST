//
//  ViewController.m
//  balancedTree
//
//  Created by Rosnel Leyva-Cortés on 5/10/21.
//

#import "ViewController.h"
#import "AAPLRenderer.h"


@implementation ViewController{
    AAPLRenderer *_renderer;
}

//setup METAL API
-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _metalView.enableSetNeedsDisplay = YES;
    _metalView.device = MTLCreateSystemDefaultDevice();
    _metalView.clearColor = MTLClearColorMake(0.0, 0.5, 1.0, 1.0);
    _renderer = [[AAPLRenderer alloc] initWithMetalKitView:_metalView];
    if(!_renderer)
    {
        NSLog(@"Renderer initialization failed");
        return;
    }
    // Initialize the renderer with the view size.
    [_renderer mtkView:_metalView drawableSizeWillChange:_metalView.drawableSize];

    
    _metalView.delegate = _renderer;
    
}


-(void)viewDidAppear:(BOOL)animated{
    
}


@end
