//
//  WordCamps.h
//  WordCamp
//
//  Created by Marko Heijnen on 15-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface WordCamps : NSManagedObject

@property (nonatomic, retain) NSNumber * site_id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * url;
@property (nonatomic, retain) NSSet *sponsors;
@property (nonatomic, retain) NSSet *sessions;
@end

@interface WordCamps (CoreDataGeneratedAccessors)

- (void)addSponsorsObject:(NSManagedObject *)value;
- (void)removeSponsorsObject:(NSManagedObject *)value;
- (void)addSponsors:(NSSet *)values;
- (void)removeSponsors:(NSSet *)values;

- (void)addSessionsObject:(NSManagedObject *)value;
- (void)removeSessionsObject:(NSManagedObject *)value;
- (void)addSessions:(NSSet *)values;
- (void)removeSessions:(NSSet *)values;

@end
