//
//  CampType.h
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/22/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CampTypeDelegate
-(void) listOfCamps:(int)campType;
@end
@interface CampTypeView : UIView
@property (nonatomic, assign) int campType;
@property (nonatomic, assign) id <CampTypeDelegate> delegate;
@end
