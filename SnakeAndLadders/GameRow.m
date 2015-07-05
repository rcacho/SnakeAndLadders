//
//  GameRow.m
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "GameRow.h"
#import "GameSquare.h"

// A GameRow is made of n GameSquares
@implementation GameRow

-(void)printRow {
    
    for (GameSquare *square in [self gameSquares]) {
        [square printSquare];
    }
    printf("\n");
}

-(GameSquare *)getSquare:(BoardPosition *)position {
    NSArray *squares = self.gameSquares;
    
    GameSquare *square = [squares objectAtIndex:position->xPosition - 1];
    
    return square;
}

@end
