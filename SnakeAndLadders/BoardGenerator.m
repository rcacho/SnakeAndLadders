//
//  BoardGenerator.m
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "BoardGenerator.h"
#import "Snake.h"
#import "Ladder.h"


@implementation BoardGenerator


-(Board*)generateBoardWithSize:(NSInteger)size {
    Board *board = [[Board alloc] init];
    [board setBoardSize:size];
    
    NSMutableArray *tempBoard = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < size; i++) {
        GameRow *row = [self generateGameRowWithSize:size];
    
        [tempBoard addObject:row];
    }
    
    
    NSArray *boardArray = [[NSArray alloc] initWithArray:tempBoard];
    [board setGameRows:boardArray];

    return board;
}

-(GameRow*)generateGameRowWithSize:(NSInteger)size {
    GameRow *row = [[GameRow alloc] init];
    NSMutableArray *tempRow = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < size; i++) {
        GameSquare *square = [self generateRandomGameSquare];
        
        [tempRow addObject:square];
    }
    
    NSArray *rowArray = [[NSArray alloc] initWithArray:tempRow];
    [row setGameSquares:rowArray];
    
    return row;
}

// randomly generate one of the possible GameSquares
-(GameSquare *)generateRandomGameSquare {
    GameSquare *square = nil;
    
    // generate a random number between 0 and 99
    int diceRoll = arc4random_uniform(99);
    
    if (diceRoll < 10) {
        square =  [[Snake alloc] init];
    } else if (diceRoll < 20) {
        square = [[Ladder alloc] init];
    } else {
        square = [[NullSquare alloc] init];
    }
    
    return square;
    
}

-(void) initializeSquares:(Board *)board {
    NSArray *rows = board.gameRows;
    for (GameRow *row in rows) {
        
        NSArray *squares = row.gameSquares;
        
        for (GameSquare *square in squares) {
            if ([square isMemberOfClass:[Snake class]]) {
                [self designateSnakeRisePoint:square withBoard:board];
            } else if ([square isMemberOfClass:[Ladder class]]) {
                [self designateLadderFallPoint:square withBoard:board];
            }
        }
    }
}

@end
