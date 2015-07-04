//
//  main.m
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//
//    Simple Snake and Ladder Game
//    Player Requires their own Dice
//    The size of the board is determined by the player at the start of the game

#import <Foundation/Foundation.h>
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GameController *game = [[GameController alloc] init];
        
        [game start];
        
    }
    return 0;
}
