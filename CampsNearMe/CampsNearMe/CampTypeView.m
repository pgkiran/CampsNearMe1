//
//  CampType.m
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/22/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import "CampTypeView.h"
#import "Resources.h"
@implementation CampTypeView
@synthesize campType=_campType;
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"btn_camptype_off"]];        
    }
    return self;
}

-(void) setCampType:(int)campType
{
    _campType=campType;
    NSString *imgName;
    NSString *campTypeName;
    if(campType==SPORTS_CAMP)
    {
        imgName = @"icn_camptype_sports";
        campTypeName=@"Sports";
    }
    else if(campType==MUSIC_CAMP)
    {
        imgName = @"icn_camptype_music";
        campTypeName=@"Music";
    }
    else if(campType==ARTS_CAMP)
    {
        imgName = @"icn_camptype_art";
        campTypeName=@"Arts";
    }
    else if(campType==EDUCATION_CAMP)
    {
        imgName = @"icn_camptype_education";
        campTypeName=@"Education";
    }
    else if(campType==ADVENTURE_CAMP)
    {
        imgName = @"icn_camptype_adventure";
        campTypeName=@"Adventure";
    }
    else if(campType==SPECIAL_CAMP)
    {
        imgName = @"icn_camptype_specialNeeds";
        campTypeName=@"Special Needs";
    }
    else if(campType==TECHNOLOGY_CAMP)
    {
        imgName = @"icn_camptype_technology";
        campTypeName=@"Technology";
    }
    else if(campType==OVERNIGHT_CAMP)
    {
        imgName = @"icn_camptype_overnight";
        campTypeName=@"Overnight";
    }
    else if(campType==OTHER_CAMP)
    {
        imgName = @"icn_camptype_other";
        campTypeName=@"Other";
    }
    
    UIImageView *campTypeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imgName]];
    [campTypeImageView setFrame:CGRectMake(16,10,62,62)];
    [self addSubview:campTypeImageView];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,65,89,30)];
    [titleLabel setText:campTypeName];
    titleLabel.textAlignment=1;
    UIFont *aniversFont = [UIFont fontWithName:@"Anivers-Regular" size:12.0f];
    if (!aniversFont) {
        aniversFont = [UIFont systemFontOfSize:12.0f];
    }
    [titleLabel setFont:aniversFont];
    titleLabel.backgroundColor = [UIColor clearColor];
    
    [titleLabel setTextColor:[UIColor colorWithRed:255 green:216 blue:105 alpha:0.6]];
    [self addSubview:titleLabel];
    
    
}
-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.delegate listOfCamps:self.campType];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
