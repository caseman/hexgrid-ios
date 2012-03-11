//
//  hexgrid.h
//  hexgrid
//
//  Created by Casey Duncan on 3/7/12.
//  Copyright (c) 2012 All rights reserved.
//

#import <Foundation/Foundation.h>

typedef CGPoint HGHexPoints[6];

@interface HexGrid : NSObject {
    CGFloat r; // Radius hex center to edge
    CGFloat s; // Radius hex center to vertex
}

@property (nonatomic, readwrite) CGFloat hexWidth;

// Initialize the grid with the specified hex cell width
- (id)initWithHexWidth:(CGFloat)w;

// Return the hex grid coordinate for the specified cartesian coordinate
- (CGPoint)pointCart2Hex:(CGPoint)cartPt;

// Return the cartesian coordinate for the center point of the hex cell
// at the specified hex cell coordinate
- (CGPoint)pointHex2Cart:(CGPoint)hexPt;

// Set an array of 6 points to contain the cartesian coordinates 
// for the hex cell vertices at the hex cell coordinate specified.
// The points are returned in clockwise order starting from the
// "top" (max Y) vertex.
- (void)hexVerts:(CGPoint)hexPt intoArray:(HGHexPoints)pts;

@end
