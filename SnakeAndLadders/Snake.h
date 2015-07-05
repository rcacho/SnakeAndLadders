//
//  Snake.h
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameSquare.h"

// has a pointer to a row lower than the one this one is in
@interface Snake : GameSquare

@property NSInteger pointsToXPosition;

@property NSInteger pointsToYPosition;


-(void)printSquare;

@end
