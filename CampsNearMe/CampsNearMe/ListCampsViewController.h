//
//  ListCampsViewController.h
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/23/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListCampsViewController : UITableViewController
@property (nonatomic, assign) int campType;
@property (nonatomic, retain) NSArray *camps;
@end
