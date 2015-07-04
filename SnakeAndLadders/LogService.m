//
//  LogService.m
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "LogService.h"

@implementation LogService


-(void)welcomePlayer {
    
    NSLog(@"Welcome To Snake And Ladders!");
    
}


// PLAYER PROMPTS ------------------------

-(void)sizePrompt {
    
    NSLog(@"What Size Board Will You Be Playing With Today??");
}

-(void)player1NamePrompt {
    
    NSLog(@"What Is Player 1's Name?");
}

-(void)player2NamePrompt {
    
    NSLog(@"What Is Player 2's Name?");
}

-(void)rollPrompt:(Player *)player {
    NSString *name = player.name;
    NSLog(@"%@ : Please Sumbit Roll:",name);
}

@end
