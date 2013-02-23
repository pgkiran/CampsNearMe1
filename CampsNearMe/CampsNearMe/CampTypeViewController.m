//
//  CampTypeViewController.m
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/22/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import "CampTypeViewController.h"
#import "CampType.h"
#import "Resources.h"
@interface CampTypeViewController ()

@end

@implementation CampTypeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Browse", @"Browse");
        self.tabBarItem.image = [UIImage imageNamed:@"icn_tabbar_home_on"];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]]];
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0,0,320,31)];
    titleView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_subbar"]];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(80,0,150,31)];
    [titleLabel setText:@"CHOOSE CAMP TYPE"];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:15];
    titleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:titleView];
    [self.view addSubview:titleLabel];
    CampType *sportsCampView = [[CampType alloc] initWithFrame:CGRectMake(9.5,40,89,97)];
    [sportsCampView setCampType:SPORTS_CAMP];
    [self.view addSubview:sportsCampView];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
