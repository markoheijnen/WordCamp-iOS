//
//  Sponsors.h
//  WordCamp
//
//  Created by Marko Heijnen on 15-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class WordCamps;

@interface Sponsors : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSString * level;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * post_id;
@property (nonatomic, retain) WordCamps *wordcamp;

@end
