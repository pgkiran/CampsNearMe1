//
//  CampType.m
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/22/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import "CampType.h"
#import "Resources.h"
@implementation CampType
@synthesize campType=_campType;
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
    if(campType==SPORTS_CAMP)
    {
        UIImageView *campTypeImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icn_camptype_sports"]];
        [campTypeImageView setFrame:CGRectMake(16,10,62,62)];
        [self addSubview:campTypeImageView];
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(27,60,62,30)];
        [titleLabel setText:@"Sports"];
        UIFont *aniversFont = [UIFont fontWithName:@"Anivers-Regular" size:12.0f];
        if (!aniversFont) {
            aniversFont = [UIFont systemFontOfSize:12.0f];
        }
        [titleLabel setFont:aniversFont];
        titleLabel.backgroundColor = [UIColor clearColor];

        [titleLabel setTextColor:[UIColor colorWithRed:255 green:216 blue:105 alpha:0.6]];
        [self addSubview:titleLabel];
    }
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
