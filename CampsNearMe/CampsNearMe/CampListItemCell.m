//
//  CampListItemCell.m
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/23/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import "CampListItemCell.h"
#import <QuartzCore/QuartzCore.h>
#import "UserLocationManager.h"
@implementation CampListItemCell
@synthesize campImage,campCats,campDescription,campDistance,campName;
@synthesize camp = _camp;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *nibArray = [[NSBundle mainBundle] loadNibNamed:@"CampListItemCell" owner:self options:nil];
        self = [nibArray objectAtIndex:0];

    }
    return self;
}

-(void) setCamp:(PFObject *)camp
{
    _camp = camp;
    self.campImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[camp valueForKey:@"Logo"]]]];
    self.campImage.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"ava_listsbar_default"]];
    self.campImage.layer.cornerRadius = 6.0;
    self.campImage.layer.masksToBounds = YES;
    
    self.campName.text = [camp valueForKey:@"Name"];
    self.campName.font = [UIFont fontWithName:@"Anivers-Bold" size:16];
    self.campName.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.6];
    self.campDescription.text = [camp valueForKey:@"Description"];
    self.campDescription.font = [UIFont fontWithName:@"Anivers-Regular" size:11];
    self.campDescription.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:0.9];

    
    self.campCats.text = [camp valueForKey:@"Category"];
    self.campCats.font = [UIFont fontWithName:@"Anivers-Italic" size:10];
    self.campCats.textColor = [UIColor colorWithRed:255 green:255 blue:255 alpha:1.0];
    
    CLLocationCoordinate2D userLoc = [UserLocationManager sharedInstance].latestLocation.coordinate;
    PFGeoPoint *userPoint = [PFGeoPoint geoPointWithLatitude:userLoc.latitude longitude:userLoc.longitude];
    PFGeoPoint *campPoint = [camp objectForKey:@"Location"];
    double distance = [userPoint distanceInMilesTo:campPoint];
    self.campDistance.text =  [NSString stringWithFormat:@"%.1f miles", distance];
        self.campDistance.font = [UIFont fontWithName:@"Anivers-Regular" size:11.0f];
//    self.campDistance.backgroundColor = [UIColor colorWithPatternImage:@""];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
