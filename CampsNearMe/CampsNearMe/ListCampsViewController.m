//
//  ListCampsViewController.m
//  CampsNearMe
//
//  Created by Kiran Patchigolla on 2/23/13.
//  Copyright (c) 2013 Kiran Patchigolla. All rights reserved.
//

#import "ListCampsViewController.h"
#import "UserLocationManager.h"
#import "CampListItemCell.h"
#import <Parse/Parse.h>
@interface ListCampsViewController ()
-(NSString *)campTypeString:(int)type;
@end

@implementation ListCampsViewController
@synthesize campType = _campType;
@synthesize camps;
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        UIImage *backButtonImage = [[UIImage imageNamed:@"btn_back_navbar_active"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 6)];
        [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        UIScrollView *campTypeScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,0,320,31)];
        campTypeScrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_slidebar"]];
        self.tableView.tableHeaderView = campTypeScrollView;
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_main"]];

        
    }
    return self;
}
-(void) setCampType:(int)campType
{
    _campType= campType;
    CLLocationCoordinate2D userLoc = [UserLocationManager sharedInstance].latestLocation.coordinate;
    PFGeoPoint *userPoint = [PFGeoPoint geoPointWithLatitude:userLoc.latitude longitude:userLoc.longitude];
    PFQuery *query = [PFQuery queryWithClassName:@"camps"];
    
    [query whereKey:@"CAMP_TYPE" equalTo:[self campTypeString:self.campType]];
    [query whereKey:@"Location" nearGeoPoint:userPoint withinMiles:50];
    
    self.camps= [query findObjects];
   
}
-(NSString *)campTypeString:(int)type
{
    if(type ==1)
    {
        return @"Sports";
    }
    else if (type == 2)
    {
        return @"Music";
    }
    else if (type == 3)
    {
        return @"Arts";
    }
    else if (type == 4)
    {
        return @"Education";
    }
    else if (type == 5)
    {
        return @"Adventure";
    }
    else if (type == 6)
    {
        return @"Speical";
    }
    else if (type == 7)
    {
        return @"Technology";
    }
    else if (type == 8)
    {
        return @"Overnight";
    }
    else
    {
        return @"Other";
    }
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.camps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CampListItemCell";
    CampListItemCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[CampListItemCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.camp = [self.camps objectAtIndex:indexPath.row];
//    cell.textLabel.text = [[self.camps objectAtIndex:indexPath.row] objectForKey:@"Name"];
    // Configure the cell...
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
