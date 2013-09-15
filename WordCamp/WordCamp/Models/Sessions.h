//
//  Sessions.h
//  WordCamp
//
//  Created by Marko Heijnen on 15-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Speakers, WordCamps;

@interface Sessions : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSDate * datetime;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSNumber * post_id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSSet *speakers;
@property (nonatomic, retain) NSManagedObject *track;
@property (nonatomic, retain) WordCamps *wordcamp;
@end

@interface Sessions (CoreDataGeneratedAccessors)

- (void)addSpeakersObject:(Speakers *)value;
- (void)removeSpeakersObject:(Speakers *)value;
- (void)addSpeakers:(NSSet *)values;
- (void)removeSpeakers:(NSSet *)values;

@end
