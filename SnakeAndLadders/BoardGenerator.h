//
//  BoardGenerator.h
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Board.h"
#import "GameRow.h"
#import "GameSquare.h"
#import "Snake.h"
#import "Ladder.h"
#import "NullSquare.h"


@interface BoardGenerator : NSObject


-(Board*)generateBoardWithSize:(NSInteger)size;

-(GameRow*)generateGameRowWithSize:(NSInteger)size;

-(GameSquare*)generateRandomGameSquare;

-(void)initializeSquares:(Board *)board;

-(void)designateSnakeRisePoint:(GameSquare *)square withBoard:(Board *)board andWithX:(NSInteger)x andWithY:(NSInteger)y;

-(void)designateLadderFallPoint:(GameSquare *)square withBoard:(Board *)board;

-(NSInteger)tossCoin:(NSInteger)size soFar:(NSInteger)position;

@end
