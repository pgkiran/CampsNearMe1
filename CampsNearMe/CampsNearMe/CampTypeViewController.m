//
//  CampTypeViewController.m
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/22/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import "CampTypeViewController.h"
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
    //TODO loop through and calc the position
    CampTypeView *sportsCampView = [[CampTypeView alloc] initWithFrame:CGRectMake(9.5,40,89,97)];
    sportsCampView.delegate=self;
    [sportsCampView setCampType:SPORTS_CAMP];
    [self.view addSubview:sportsCampView];

    CampTypeView *musicCampView = [[CampTypeView alloc] initWithFrame:CGRectMake(110,40,89,97)];
    musicCampView.delegate=self;
    [musicCampView setCampType:MUSIC_CAMP];
    [self.view addSubview:musicCampView];

    CampTypeView *artsCampView = [[CampTypeView alloc] initWithFrame:CGRectMake(208.5,40,89,97)];
    artsCampView.delegate=self;
    [artsCampView setCampType:ARTS_CAMP];
    [self.view addSubview:artsCampView];

    CampTypeView *educationCampView = [[CampTypeView alloc] initWithFrame:CGRectMake(9.5,150,89,97)];
    educationCampView.delegate=self;
    [educationCampView setCampType:EDUCATION_CAMP];
    [self.view addSubview:educationCampView];

    CampTypeView *adventureCampView = [[CampTypeView alloc] initWithFrame:CGRectMake(110,150,89,97)];
    adventureCampView.delegate=self;
    [adventureCampView setCampType:ADVENTURE_CAMP];
    [self.view addSubview:adventureCampView];

    CampTypeView *specialNeedsCampView = [[CampTypeView alloc] initWithFrame:CGRectMake(208.5,150,89,97)];
    specialNeedsCampView.delegate=self;
    [specialNeedsCampView setCampType:SPECIAL_CAMP];
    [self.view addSubview:specialNeedsCampView];

    CampTypeView *technologyCampView = [[CampTypeView alloc] initWithFrame:CGRectMake(9.5,260,89,97)];
    technologyCampView.delegate=self;
    [technologyCampView setCampType:TECHNOLOGY_CAMP];
    [self.view addSubview:technologyCampView];
    
    CampTypeView *overnightCampView = [[CampTypeView alloc] initWithFrame:CGRectMake(110,260,89,97)];
    overnightCampView.delegate=self;
    [overnightCampView setCampType:OVERNIGHT_CAMP];
    [self.view addSubview:overnightCampView];

    CampTypeView *otherCampView = [[CampTypeView alloc] initWithFrame:CGRectMake(208.5,260,89,97)];
    otherCampView.delegate=self;
    [otherCampView setCampType:OTHER_CAMP];
    [self.view addSubview:otherCampView];
    
    
    
    // Do any additional setup after loading the view from its nib.
}

-(void) listOfCamps:(int)campType
{
    CampListViewController *campListViewController = [[CampListViewController alloc] initWithNibName:@"CampListViewController" bundle:nil];
    [self.navigationController pushViewController:campListViewController animated:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
