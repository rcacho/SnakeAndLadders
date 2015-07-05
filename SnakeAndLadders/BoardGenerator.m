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
    NSInteger x = 0;
    NSInteger y = 0;
    
    for (GameRow *row in rows) {
        x++;
        NSArray *squares = row.gameSquares;
        
        for (GameSquare *square in squares) {
            y++;
            if ([square isMemberOfClass:[Snake class]]) {
                [self designateSnakeRisePoint:square withBoard:board andWithX:x andWithY:y];
            } else if ([square isMemberOfClass:[Ladder class]]) {
                [self designateLadderFallPoint:square withBoard:board];
            }
        }
    }
}

-(void)designateSnakeRisePoint:(Snake *)square withBoard:(Board *)board andWithX:(NSInteger)x andWithY:(NSInteger)y {
    NSInteger fromHomeToX = x - board.boardSize;
    NSInteger fromHomeToY = y - board.boardSize;
    
    NSInteger pointsToXPosition = [self tossCoin:fromHomeToX soFar:0];
    NSInteger pointsToYPosition = [self tossCoin:fromHomeToY soFar:0];
    
    square.pointsToXPosition = x - pointsToXPosition;
    square.pointsToYPosition = y - pointsToYPosition;
    

}

-(void)designateLadderFallPoint:(Ladder *)square withBoard:(Board *)board {
    square.pointsToXPosition = [self tossCoin:board.boardSize - 1 soFar:0];
    square.pointsToYPosition = [self tossCoin:board.boardSize - 1 soFar:0];
    
}


-(NSInteger)tossCoin:(NSInteger)size soFar:(NSInteger)position {
    int diceRoll = arc4random_uniform(99);
    
    if (size >= 0) {
        if (diceRoll > 50) {
            return [self tossCoin:size - 1 soFar: position + 1];
        } else {
            return position;
        }
    } else {
        return position;
    }
    


}

@end
