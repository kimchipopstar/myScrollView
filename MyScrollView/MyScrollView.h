//
//  MyScrollView.h
//  MyScrollView
//
//  Created by Jaewon Kim on 2017-08-07.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIView

@property (nonatomic,assign) CGSize contentSize;
@property (nonatomic,weak) UIPanGestureRecognizer *panGesure;


@end
