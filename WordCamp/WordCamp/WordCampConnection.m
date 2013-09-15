//
//  WordCampConnection.m
//  WordCamp
//
//  Created by Marko Heijnen on 14-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import "WordCampConnection.h"

#import "WordCampAppDelegate.h"
#import "WordCamps.h"


@interface WordCampConnection (Private)
    +(void)loadData;
    +(void)save;
@end

@implementation WordCampConnection

+(void)sync {
    int time = [[NSUserDefaults standardUserDefaults] integerForKey:@"syncTime"];
	//if( time == 0 || lround([[NSDate date] timeIntervalSince1970]) > time + 43200 ) {
		[self loadData];
	//}
}

+(void)loadData {
    [self loadWordCamps];
}


//NSJSONSerialization
+(void)loadWordCamps {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        //code executed in the background
        //2
        NSData* kivaData = [NSData dataWithContentsOfURL:
                            [NSURL URLWithString:@"http://vps7751.xlshosting.net/wp-json.php/wordcamps"]
                            ];
        //3
        NSDictionary* json = nil;
        if (kivaData) {
            json = [NSJSONSerialization
                    JSONObjectWithData:kivaData
                    options:kNilOptions
                    error:nil];

            for (NSDictionary *wordcamp in json ) {
                WordCamps *tempWordCamp = [self getSingleObject:@"WordCamps" withUid:[[wordcamp objectForKey:@"site_id"] intValue]];

                if ( ! tempWordCamp) {
                    NSLog(@"create");
                    tempWordCamp = [NSEntityDescription insertNewObjectForEntityForName:@"WordCamps" inManagedObjectContext: [(WordCampAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]];
                }

                tempWordCamp.site_id = [NSNumber numberWithInt:[[wordcamp objectForKey:@"id"] intValue]];
                tempWordCamp.title   = [wordcamp objectForKey:@"title"];
                tempWordCamp.url     = [wordcamp objectForKey:@"link"];
            }
        }

        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [self save];
        });
        
    });
}

+(void)save {
    NSError *error = nil;
    if (![[(WordCampAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext] save:&error]) {
		NSLog(@"Failed to save to data store: %@", [error localizedDescription]);
        
		NSArray* detailedErrors = [[error userInfo] objectForKey:NSDetailedErrorsKey];
		if(detailedErrors != nil && [detailedErrors count] > 0) {
			for(NSError* detailedError in detailedErrors) {
				NSLog(@"  DetailedError: %@", [detailedError userInfo]);
			}
		}
		else {
			NSLog(@"  %@", [error userInfo]);
		}
	}
	else {
		NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		[defaults setInteger:lround([[NSDate date] timeIntervalSince1970]) forKey:@"syncTime"];
	}
}





#pragma mark Helper Request Object
// Functie om een single object uit de database te halen
+ (id)getSingleObject:(NSString*)model withUid:(int)uid;
{
	NSFetchRequest *request = [[NSFetchRequest alloc] init];
	NSEntityDescription *entity = [NSEntityDescription entityForName:model inManagedObjectContext:[(WordCampAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]];
	[request setEntity:entity];
    
	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"site_id == %@", [NSNumber numberWithInt:uid]];
	[request setPredicate:predicate];
    
	NSError *error;
	NSArray *results = [[(WordCampAppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext] executeFetchRequest:request error:&error];
    
	if([results count] > 0) {
		return [results objectAtIndex:0];
	}
    
	return nil;
}

@end
