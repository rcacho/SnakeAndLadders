//
//  Player.h
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef struct BoardPosition {
    NSInteger xPosition;
    NSInteger yPosition;
} BoardPosition;

@interface Player : NSObject

@property NSString *name;

@property BoardPosition *position;

-(instancetype)init;

-(instancetype)initWithName:(NSString *)name;

@end


