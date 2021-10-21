//
//  LMYViewController.m
//  LMYPersonPeferenceKit
//
//  Created by coderMyron on 10/21/2021.
//  Copyright (c) 2021 coderMyron. All rights reserved.
//

#import "LMYViewController.h"
#import <CTMediator+LMYPersonPreference.h>


@interface LMYViewController ()

@property(nonatomic, weak) UIButton *actionButton;

@end

@implementation LMYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self setup];
}

-(void)setup{
    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *personLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 50)];
    [self.view addSubview:personLabel];
    personLabel.text = @"张三今年18岁，帅气";
    personLabel.textColor = [UIColor blackColor];
    personLabel.font = [UIFont systemFontOfSize:18];
    
    
    UIButton *actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:actionButton];
    self.actionButton = actionButton;
    actionButton.backgroundColor = [UIColor yellowColor];
    [actionButton setTitle:@"打分" forState:UIControlStateNormal];
    [actionButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    actionButton.frame = CGRectMake((self.view.frame.size.width - 150) * 0.5, 200, 150, 50);
    [actionButton addTarget:self action:@selector(preferenceClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *lockImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 300, 25, 25)];
    [self.view addSubview:lockImageView];
    lockImageView.image = [UIImage imageNamed:@"touch_lock"];
    
}

-(void)preferenceClick{
    UIViewController *preferenceVC = [[CTMediator sharedInstance] personPreferenceWithRemind:@"喜欢吗" resultBlock:^(BOOL islike) {
        if (islike) {
            [self.actionButton setTitle:@"对方喜欢你" forState:UIControlStateNormal];
        }else{
            [self.actionButton setTitle:@"对方不喜欢你" forState:UIControlStateNormal];
        }
    }];

    [self.navigationController pushViewController:preferenceVC animated:YES];
}


@end
