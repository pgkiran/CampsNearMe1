//
//  CampFavoritesViewController.m
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/22/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import "CampFavoritesViewController.h"

@interface CampFavoritesViewController ()

@end

@implementation CampFavoritesViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Favorites", @"Favorites");
        self.tabBarItem.image = [UIImage imageNamed:@"icn_tabbar_favorites_on"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]]];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
