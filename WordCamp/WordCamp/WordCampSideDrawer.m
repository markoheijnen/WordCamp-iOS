//
//  WordCampSideDrawer.m
//  WordCamp
//
//  Created by Marko Heijnen on 15-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import "WordCampSideDrawer.h"

#import "WordCampAppDelegate.h"
#import "WordCamps.h"

#import "UIViewController+MMDrawerController.h"

@interface WordCampSideDrawer ()
    -(void)loadData:(NSNotification *)note;
@end

@implementation WordCampSideDrawer

@synthesize wordcamps;


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSManagedObjectContext * managedObjectContext = [(WordCampAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadData:) name:NSManagedObjectContextObjectsDidChangeNotification object:managedObjectContext];
    
    [self loadData:nil];
}

-(void)loadData:(NSNotification *)note {
    NSManagedObjectContext * managedObjectContext = [(WordCampAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext];
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"WordCamps" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    NSError *error;
    self.wordcamps = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if(note) {
        [self.tableView reloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [wordcamps count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }

    WordCamps *info = [wordcamps objectAtIndex:indexPath.row];
    cell.textLabel.text = info.title;
    cell.detailTextLabel.text = info.date;
    
    return cell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    WordCamps *info = [wordcamps objectAtIndex:indexPath.row];

    [[NSUserDefaults standardUserDefaults] setInteger:[info.site_id intValue] forKey:@"wordcamp"];
    
    [self.mm_drawerController setMaximumLeftDrawerWidth:280.0];
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

@end
