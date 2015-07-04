//
//  Player.m
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "Player.h"

@implementation Player

-(instancetype) init {
    self = [super init];
    
    if (self) {
        BoardPosition *position = malloc(sizeof(BoardPosition));
        position->xPosition = 0;
        position->yPosition = 0;
        self.position = position;
    }
    return self;
}

-(instancetype)initWithName:(NSString *)name {
    self = [self init];
    self.name = name;
    return self;
}

@end
