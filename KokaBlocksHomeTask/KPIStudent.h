//
//  KPIStudent.h
//  KokaBlocksHomeTask
//
//  Created by paul on 4/12/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^TaskBlock)(void);

@protocol KPIStudentDelegate;


@interface KPIStudent : NSObject <KPIStudentDelegate>
@property(strong, nonatomic) NSString* name;
@property(weak, nonatomic) id <KPIStudentDelegate> delegae;

-(void) introduction;

-(void)introductionWithBlock:(TaskBlock) anotherIntroduction;

@end

@protocol KPIStudentDelegate

- (void) writeMessage:(KPIStudent *) student;

@end


