//
//  WordCampMainViewController.m
//  WordCamp
//
//  Created by Marko Heijnen on 15-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import "WordCampMainViewController.h"

#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"

#import "WordCampProgramViewController.h"
#import "WordCampSessionsViewController.h"
#import "WordCampSpeakersViewController.h"
#import "WordCampNewsViewController.h"
#import "WordCampSponsorsViewController.h"

@interface WordCampMainViewController ()

@end

@implementation WordCampMainViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        WordCampProgramViewController * program = [[WordCampProgramViewController alloc] init];
        WordCampSessionsViewController * sessions = [[WordCampSessionsViewController alloc] init];
        WordCampSpeakersViewController * speakers = [[WordCampSpeakersViewController alloc] init];
        WordCampNewsViewController * news = [[WordCampNewsViewController alloc] init];
        WordCampSponsorsViewController * sponsors = [[WordCampSponsorsViewController alloc] init];
        
        NSArray *viewControllersArray = [[NSArray alloc] initWithObjects:program, sessions, speakers, news, sponsors, nil];
        
        [self setViewControllers:viewControllersArray];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
        MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
        [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)leftDrawerButtonPress:(id)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

@end
