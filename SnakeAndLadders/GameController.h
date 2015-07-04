//
//  GameController.h
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BoardGenerator.h"
#import "Board.h"
#import "InputHandler.h"
#import "LogService.h"
#import "Player.h"
#import "Snake.h"
#import "Ladder.h"

@interface GameController : NSObject

@property InputHandler *inputHandler;

@property Board *board;

@property Player *player1;

@property Player *player2;

@property LogService *logger;

@property BOOL running;

-(instancetype)init;

-(void)start;

-(void)runGameLoop;

-(void)game;

-(void)movePlayer;

-(BoardPosition *)moveXPosition:(NSInteger)xPosition andYPosition:(NSInteger)yPosition squaresAhead:(NSInteger)roll;

-(void)evaluateState:(Player *)player;

-(void)statusOfPlayerSquare:(Player *)player;

-(void)changeStatusOfPlayer:(Player *)player with:(GameSquare *)currentSquare;

-(void)hasPlayerWon:(Player *)player;

-(void)playerTurn:(Player *)player;

@end
