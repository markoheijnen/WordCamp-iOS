//
//  WordCampSponsorsViewController.m
//  WordCamp
//
//  Created by Marko Heijnen on 17-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import "WordCampSponsorsViewController.h"

@interface WordCampSponsorsViewController ()

@end

@implementation WordCampSponsorsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = NSLocalizedString(@"Sponsors", @"");
        [self.view setBackgroundColor:[UIColor whiteColor]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
