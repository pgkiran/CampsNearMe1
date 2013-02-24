//
//  CampListItemCell.h
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/23/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface CampListItemCell : UITableViewCell
@property (strong,nonatomic) IBOutlet UIImageView *campImage;
@property (strong,nonatomic) IBOutlet UILabel *campName;
@property (strong,nonatomic) IBOutlet UILabel *campCats;
@property (strong,nonatomic) IBOutlet UILabel *campDescription;
@property (strong,nonatomic) IBOutlet UILabel *campDistance;
@property (strong,nonatomic) PFObject *camp;
@end
