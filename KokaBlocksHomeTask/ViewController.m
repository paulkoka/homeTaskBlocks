//
//  ViewController.m
//  KokaBlocksHomeTask
//
//  Created by paul on 4/12/18.
//  Copyright © 2018 Paul. All rights reserved.
//

#import "ViewController.h"
#import "KPIStudent.h"


@interface ViewController ()
#pragma mark Task one



-(void) methodWithBlockOne:(TaskBlock)beginning blockTwo:(TaskBlock)ending;
#pragma mark task 4 and 5
@property (nonatomic, copy) id task4Property;
@property(nonatomic, copy) TaskBlock task5PropertyBlock;
#pragma mark task 4 and 5
@end




@implementation ViewController
-(void) methodWithBlockOne:(TaskBlock)beginning blockTwo:(TaskBlock)ending{
    if(beginning){
        beginning();
    }
    NSLog(@"I'm method's body");
    if (ending) {
        ending();}
};

- (void)viewDidLoad {
    [super viewDidLoad];
    
    TaskBlock beginning = ^{
        NSLog(@"Beginning");
    };
    
    TaskBlock ending = ^{
        NSLog(@"Ending");
    };
    
    [self methodWithBlockOne:beginning blockTwo:ending];
#pragma mark task one end
    
#pragma mark task two
    KPIStudent *studentOneForTask2= [[KPIStudent alloc] init];
    
    studentOneForTask2.name=@"Jack";
    
    KPIStudent *delegateOfstudentOne = [[KPIStudent alloc] init];
    
    
    
    delegateOfstudentOne.name = @"Dalores";
    
    studentOneForTask2.delegae = delegateOfstudentOne;
    
    [studentOneForTask2 introduction];
#pragma mark task two end
#pragma mark task three
    
    KPIStudent *studentForTask3 = [[KPIStudent alloc] init];
    
    [studentForTask3 introductionWithBlock:^{
        NSLog(@"Iside of Block");
    }];

    
    [studentForTask3 introductionWithBlock:^{
        NSLog(@"Iside of Block");
        //[studentForTask3 introduction];
    }];
    
#pragma mark task three end
#pragma mark task four
    
    //    //weakify
    //    __weak typeof (self) weakSelf = self;
    //    self.someBlock = ^{
    //        typeof (self) strongSelf = weakSelf;
    //        [self didFinishWorking];
    //
    //    };
    
   __weak id weakTask4Property = self.task4Property;
    
    TaskBlock task4Block = ^{
        __strong id strongTask4Property = weakTask4Property;
        [strongTask4Property respondsToSelector:@selector(allKeys)];
    };
    
    #pragma mark task four end
    
       #pragma mark task five
    //__weak id weakTask5Property = self.task4Property; // cycle will be or notif make reference to weak referense
    __weak typeof (self) weekSelfTask5 = self;
    //__weak id task5Property = weekSelfTask5.task4Property;
    id task5Property = weekSelfTask5.task4Property;
    weekSelfTask5.task5PropertyBlock = ^{
        
        __strong typeof (weekSelfTask5) strongSelfTask5 = weekSelfTask5;
        [strongSelfTask5 respondsToSelector:@selector(allKeys)];
    };
#pragma mark task six
/*6 - [ ] Объявите int и присвойте ему значение. Объявите блок, внутри которого распечатайте int. После объявления блока измените int и распечатайте новое значение. Вызовите блок. Что вывелось в консоль? Объясните результат.*/
    int task6Int = 10;
    
    TaskBlock task6Block = ^{
        NSLog(@"%d", task6Int);
    };
    
    task6Int = 20;
    
    task6Block();// Output is 10, because blocks catches remember date from their surraunding at that moment,
    //when thew have been created
    
    #pragma mark task six end
    
    
#pragma mark seven
    
    TaskBlock taskBlock1 = ^{
        NSLog(@"1");
    };
    
    TaskBlock taskBlock2 = ^{
        NSLog(@"2");
    };
    TaskBlock taskBlock3 = ^{
        NSLog(@"3");
    };
    TaskBlock taskBlock4 = ^{
        NSLog(@"4");
    };
    NSArray *task7Array = [NSArray arrayWithObjects:taskBlock1, taskBlock2, taskBlock3, taskBlock4, nil];
    
    for (TaskBlock object in task7Array) {
        object();
    }
    
    NSLog(@"");
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//- (void) introductionBlock {
//    NSLog(@"");
//}

@end
