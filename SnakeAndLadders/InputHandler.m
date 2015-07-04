//
//  InputHandler.m
//  SnakeAndLadders
//
//  Created by ricardo antonio cacho on 2015-07-04.
//  Copyright (c) 2015 ricardo antonio cacho. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler


-(NSString *)fetchInput {
    char input[300];
    fgets(input, 300, stdin);
    strtok(input, "\n"); // trim newline at end of input
    
    NSString *inputNSString = [NSString stringWithUTF8String:input];
    NSLog(@"This was your input: %@", inputNSString);
    return inputNSString;
    
}

-(NSInteger)fetchNSInteger {
    NSString *intAsString = [self fetchInput];
    
    NSInteger integer = [intAsString intValue];
    
    return integer;
}

-(NSInteger)getSize {
    NSInteger size = [self fetchNSInteger];
    return size;
}

-(NSString *)getName {
    NSString *name = [self fetchInput];
    
    return name;
}

-(NSInteger)getRoll {
    NSInteger roll = [self fetchNSInteger];
    return roll;
}

@end
