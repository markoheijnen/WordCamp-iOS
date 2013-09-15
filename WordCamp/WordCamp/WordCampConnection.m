//
//  WordCampConnection.m
//  WordCamp
//
//  Created by Marko Heijnen on 14-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import "WordCampConnection.h"

@implementation WordCampConnection

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
        }
        
        //4
        dispatch_async(dispatch_get_main_queue(), ^{
            //code executed on the main queue
            //5
            [self saveWordCamps: json];
        });
        
    });
}

+(void)saveWordCamps:(NSDictionary *)json {
    NSLog(@"%@", json );
}


@end
