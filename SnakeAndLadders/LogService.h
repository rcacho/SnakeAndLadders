//
//  LogService.h
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
@interface LogService : NSObject



-(void)welcomePlayer;


// PLAYER PROMPTS ------------------------

-(void)sizePrompt;

-(void)player1NamePrompt;

-(void)player2NamePrompt;

-(void)rollPrompt:(Player *)player;

@end
