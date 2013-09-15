//
//  WordCampConnection.h
//  WordCamp
//
//  Created by Marko Heijnen on 14-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordCampConnection : NSObject


+(void)loadWordCamps;
+(void)saveWordCamps:(NSDictionary *)json;

@end
