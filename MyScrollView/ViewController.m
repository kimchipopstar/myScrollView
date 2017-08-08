//
//  ViewController.m
//  MyScrollView
//
//  Created by Jaewon Kim on 2017-08-07.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"


@interface ViewController ()

@property (nonatomic,strong) MyScrollView *myScrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myScrollView = [[MyScrollView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.myScrollView];
    self.myScrollView.contentSize = CGSizeMake(500, 1000);
    
    UIView *firstView = [[UIView alloc]initWithFrame:self.myScrollView.bounds];
     [self.myScrollView addSubview:firstView];
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(20, 20, 100, 100)];
    [firstView addSubview:redView];
    redView.backgroundColor = [UIColor redColor];
    
    UIView *greenView = [[UIView alloc]initWithFrame:CGRectMake(150, 150, 150, 150)];
    [firstView addSubview:greenView];
    greenView.backgroundColor = [UIColor greenColor];
    
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(40, 400, 200, 150)];
    [firstView addSubview:blueView];
    blueView.backgroundColor = [UIColor blueColor];
    
    UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(100, 600, 180, 150)];
    [firstView addSubview:yellowView];
    yellowView.backgroundColor = [UIColor yellowColor];
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(scrollViewPanned:)];
    [self.myScrollView addGestureRecognizer:panGesture];
    
    
    
}

-(void)scrollViewPanned:(UIPanGestureRecognizer*)sender{
    
    CGPoint translate = [sender translationInView:self.myScrollView];
    
    CGRect scrollViewFrame = self.myScrollView.frame;
    
    scrollViewFrame.origin.x -= translate.x;
    scrollViewFrame.origin.y -= translate.y;
    self.myScrollView.bounds = scrollViewFrame;
    
    CGRect contentRect = CGRectZero;
    for (UIView *view in self.myScrollView.subviews) {
        contentRect = CGRectUnion(contentRect, view.frame);
    }
    self.myScrollView.contentSize = contentRect.size;
    
//    if (self.myScrollView.contentSize.height ) {
//        <#statements#>
//    }
}

-(void)viewDidAppear:(BOOL)animated{
//    self.view.frame = CGRectMake(self.view.frame.origin.x, self.view.frame.origin.y - 100, self.view.frame.size.width, self.view.frame.size.height);
    
    self.view.bounds = CGRectMake(self.view.bounds.origin.x, self.view.bounds.origin.y + 100, self.view.bounds.size.width, self.view.bounds.size.height);
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
