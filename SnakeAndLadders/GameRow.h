//
//  GameRow.h
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"
#import "GameSquare.h"

@interface GameRow : NSObject

@property NSArray *gameSquares;

-(void)printRow;

-(GameSquare *)getSquare:(BoardPosition *)position;

@end
