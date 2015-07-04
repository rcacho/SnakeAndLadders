//
//  InputHandler.h
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InputHandler : NSObject

-(NSString *)fetchInput;

-(NSInteger)fetchNSInteger;

-(NSInteger)getSize;

-(NSString *)getName;

-(NSInteger)getRoll;

@end
