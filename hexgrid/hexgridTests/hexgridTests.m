//
//  hexgridTests.m
//  hexgridTests
//
//  Created by Casey Duncan on 3/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "hexgridTests.h"

@implementation hexgridTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testInitDefaultWidth
{
    HexGrid* hg = [[HexGrid alloc] init];
    STAssertEqualsWithAccuracy(hg.hexWidth, (CGFloat)1.f, 0.00001f, @"hexWidth not expected value");
    [hg release];
}

- (void)testInitWithWidth
{
    HexGrid* hg = [[HexGrid alloc] initWithHexWidth:23.f];
    STAssertEqualsWithAccuracy(hg.hexWidth, (CGFloat)23.f, 0.00001f, @"hexWidth not expected value");
    [hg release];
}

- (void)testWidth
{
    HexGrid* hg = [[HexGrid alloc] init];
    hg.hexWidth = 42;
    STAssertEqualsWithAccuracy(hg.hexWidth, (CGFloat)42.f, 0.00001f, @"hexWidth not expected value");
    hg.hexWidth = 1;
    STAssertEqualsWithAccuracy(hg.hexWidth, (CGFloat)1.f, 0.00001f, @"hexWidth not expected value");
    [hg release];
}

- (void)testPointCart2HexUnitHexWidth
{
    HexGrid* grid = [[HexGrid alloc] init];
    CGPoint cp, hp;
    
    cp.x = 0; cp.y = 0;
    hp = [grid pointCart2Hex:cp];
    STAssertEquals(hp.x, (CGFloat)0, @"expected x=0");
    STAssertEquals(hp.y, (CGFloat)0, @"expected y=0");
    
    cp.x = 3; cp.y = 0;
    hp = [grid pointCart2Hex:cp];
    STAssertEquals(hp.x, (CGFloat)3, @"expected x=3");
    STAssertEquals(hp.y, (CGFloat)0, @"expected y=0");
    
    cp.x = -99; cp.y = 0;
    hp = [grid pointCart2Hex:cp];
    STAssertEquals(hp.x, (CGFloat)-99, @"expected x=-99");
    STAssertEquals(hp.y, (CGFloat)0, @"expected y=0");
    
    cp.x = 0.4; cp.y = 0.3;
    hp = [grid pointCart2Hex:cp];
    STAssertEquals(hp.x, (CGFloat)0, @"expected x=0");
    STAssertEquals(hp.y, (CGFloat)0, @"expected y=0");
    
    cp.x = -0.5; cp.y = 1;
    hp = [grid pointCart2Hex:cp];
    STAssertEquals(hp.x, (CGFloat)-1, @"expected x=-1");
    STAssertEquals(hp.y, (CGFloat)1, @"expected y=1");
    
    cp.x = 0; cp.y = 3;
    hp = [grid pointCart2Hex:cp];
    STAssertEquals(hp.x, (CGFloat)-2, @"expected x=-0");
    STAssertEquals(hp.y, (CGFloat)4, @"expected y=2");
    
    [grid release];
}

- (void)testPointHex2CartUnitHexWidth
{
    HexGrid* grid = [[HexGrid alloc] init];
    CGPoint cp, hp;
    
    hp.x = 0; hp.y = 0;
    cp = [grid pointHex2Cart:hp];
    STAssertEquals(cp.x, (CGFloat)0, @"expected x=0");
    STAssertEquals(cp.y, (CGFloat)0, @"expected y=0");
    
    hp.x = 1; hp.y = 0;
    cp = [grid pointHex2Cart:hp];
    STAssertEquals(cp.x, (CGFloat)1, @"expected x=1");
    STAssertEquals(cp.y, (CGFloat)0, @"expected y=0");
    
    hp.x = -42; hp.y = 0;
    cp = [grid pointHex2Cart:hp];
    STAssertEquals(cp.x, (CGFloat)-42, @"expected x=-42");
    STAssertEquals(cp.y, (CGFloat)0, @"expected y=0");
    
    hp.x = 0; hp.y = 2;
    cp = [grid pointHex2Cart:hp];
    STAssertEquals(cp.x, (CGFloat)1, @"expected x=1");
    STAssertEqualsWithAccuracy(cp.y, (CGFloat)(3 / sqrt(3)), .00001f, @"expected y=0");
    
    hp.x = 20; hp.y = -4;
    cp = [grid pointHex2Cart:hp];
    STAssertEquals(cp.x, (CGFloat)18, @"expected x=1");
    STAssertEqualsWithAccuracy(cp.y, (CGFloat)(-6 / sqrt(3)), .00001f, @"expected y=0");
}
@end
