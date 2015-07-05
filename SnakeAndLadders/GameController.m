//
//  GameController.m
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "GameController.h"

@implementation GameController

-(instancetype)init {
    self = [super init];
    if (self) {
        self.inputHandler = [[InputHandler alloc] init];
        self.logger = [[LogService alloc] init];
    }
    return self;
}

-(void)start {
    BoardGenerator *generator = [[BoardGenerator alloc] init];
    
    [self.logger welcomePlayer];
    [self.logger sizePrompt];
    
    // Create the Board According To Player specified Size
    NSInteger size = [self.inputHandler getSize];
    Board *board = [generator generateBoardWithSize:(NSInteger)size];
    [board printBoard];
    
    // get the name of player 1
    [self.logger player1NamePrompt];
    NSString *player1Name = [self.inputHandler getName];
    // get the name of player 2
    [self.logger player2NamePrompt];
    NSString *player2Name = [self.inputHandler getName];
    
    Player *player1 = [[Player alloc] initWithName:player1Name];
    Player *player2 = [[Player alloc] initWithName:player2Name];
    self.player1 = player1;
    self.player2 = player2;
    
    [self runGameLoop];

}


-(void)runGameLoop {
    while (self.running) {
        
        [self game];
    }
}

-(void)game {
    
    //Player1's turn:
    [self playerTurn:self.player1];
    
    //Player2's turn:
    [self playerTurn:self.player2];
    
    
}

-(void)playerTurn:(Player *)player {
    // ask for player's roll:
    [self.logger rollPrompt:player];
    NSInteger player1roll = [self.inputHandler getRoll];
    [self movePlayer:player squaresAhead:player1roll];
    [self evaluateState:player];
}


-(void)evaluateState:(Player *)player {
    [self statusOfPlayerSquare:player];
    [self hasPlayerWon:player];
    
}

-(void)statusOfPlayerSquare:(Player *)player {
    BoardPosition *position = player.position;
    
    GameSquare *currentSquare = [self.board getSquare:position];
    [self changeStatusOfPlayer:player with:currentSquare];
}

-(void)changeStatusOfPlayer:(Player *)player with:(GameSquare *)currentSquare {

    //check if square has method to get new square
    // if so the player gets moved to that new square
    if ( [currentSquare isMemberOfClass:[Snake class]] || [currentSquare isMemberOfClass:[Ladder class]])
    {
        Snake *snake = currentSquare;
        
        BoardPosition *newPosition = malloc(sizeof(BoardPosition));
        newPosition->xPosition = snake.pointsToXPosition;
        newPosition->yPosition = snake.pointsToYPosition;
        
        player.position = newPosition;
    }
    
    
}

// recursively move the player one square
-(Player *)movePlayer:(Player *)player squaresAhead:(NSInteger)roll {
    if (roll >  0) {
        BoardPosition *position = player.position;
        NSInteger size = self.board.boardSize;
        
        if (position->xPosition == size) {
            if (position->yPosition != size) {
                position->yPosition = position->yPosition + 1;
                return [self movePlayer:player squaresAhead:roll -1];
            } else {
                // player has won, wait until controller evaluates this result
                return player;
            }
        } else {
            position->xPosition = position->xPosition + 1;
            return [self movePlayer:player squaresAhead:roll -1];
        }
    } else {
        return player;
    }

}

@end
