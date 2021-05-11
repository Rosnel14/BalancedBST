//
//  AAPLRenderer.h
//  balancedTree
//
//  Created by Rosnel Leyva-Cortés on 5/10/21.
//

#ifndef AAPLRenderer_h
#define AAPLRenderer_h

@import MetalKit;

@interface AAPLRenderer : NSObject<MTKViewDelegate>

- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;

@end
#endif /* AAPLRenderer_h */
