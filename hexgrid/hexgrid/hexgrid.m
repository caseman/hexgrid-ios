//
//  hexgrid.m
//  HexGrid
//
//  Copyright (c) 2012 Casey Duncan. All rights reserved.
//

#include <tgmath.h>
#import "hexgrid.h"

#define SQRT3 1.732050807568877

@implementation HexGrid

- (id)init
{
    self = [super init];
    if (self) {
        self.hexWidth = 1.;
    }
    return self;
}

- (id)initWithHexWidth:(CGFloat)w
{
    self = [super init];
    if (self) {
        self.hexWidth = w;
    }
    return self;
}

- (void)setHexWidth:(CGFloat)w
{
    r = w / 2.;
    s = w / SQRT3;
}

- (CGFloat)hexWidth
{
    return 2. * r;
}

// Point conversion algorithms derived from:
// http://playtechs.blogspot.com/2007/04/hex-grids.html

- (CGPoint)pointCart2Hex:(CGPoint)cartPt
{
    CGPoint hexPt;
    CGFloat xi, yi, xj, yj;
    
    xi = floor(cartPt.x * 1./(2.*r) + cartPt.y * -1./s);
    yi = floor(cartPt.x * 1./r);
    hexPt.x = floor((xi + yi + 2.) / 3.);
    
    xj = floor(cartPt.x * 1./(2.*r) + cartPt.y * 1./s);
    yj = floor(cartPt.x * -1./(2.*r) + cartPt.y * 1./s);
    hexPt.y = floor((xj + yj + 2.) / 3.);
    
    return hexPt;
}

- (CGPoint)pointHex2Cart:(CGPoint)hexPt
{
    CGPoint cartPt;
    
    cartPt.x = hexPt.x * 2. * r + hexPt.y * r;
    cartPt.y = hexPt.y * s * 1.5;
    return cartPt;
}

@end
