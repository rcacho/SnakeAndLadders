//
//  Board.h
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameSquare.h"


// A Board is made of n GameRows where n is a player input
@interface Board : NSObject

@property NSArray *gameRows;

@property NSInteger boardSize;

-(void)printBoard;




@end
