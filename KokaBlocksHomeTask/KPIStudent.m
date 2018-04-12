//
//  KPIStudent.m
//  KokaBlocksHomeTask
//
//  Created by paul on 4/12/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "KPIStudent.h"



@implementation KPIStudent
-(void) introduction{
    NSLog(@"Hi, my name is %@", self.name);
    if (self.delegae) {
    [self.delegae writeMessage:self];
    }
};

-(void)introductionWithBlock:(TaskBlock) anotherIntroduction{
    if (anotherIntroduction) {
        anotherIntroduction();
    }
    NSLog(@"Done with block");
};



#pragma mark KPIStudentDelegate
-(void) writeMessage:(KPIStudent *) student{
    NSLog(@"I'm %@, and I'm delegate of %@!", self.name, student.name);
}

@end
