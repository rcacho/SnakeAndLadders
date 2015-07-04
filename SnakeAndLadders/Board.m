//
//  Board.m
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "Board.h"
#import "GameRow.h"


@implementation Board


-(void)printBoard {
    
    for (GameRow *row in [self gameRows]) {
        [row printRow];
    }
}


@end
