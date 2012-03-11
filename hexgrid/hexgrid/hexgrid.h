//
//  hexgrid.h
//  hexgrid
//
//  Created by Casey Duncan on 3/7/12.
//  Copyright (c) 2012 All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HexGrid : NSObject {
    CGFloat r; // Radius hex center to edge
    CGFloat s; // Radius hex center to vertex
}

@property (nonatomic, readwrite) CGFloat hexWidth;

- (id)initWithHexWidth:(CGFloat)w;
- (CGPoint)pointCart2Hex:(CGPoint)cartPt;
- (CGPoint)pointHex2Cart:(CGPoint)hexPt;

@end
