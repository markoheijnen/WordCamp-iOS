//
//  Speakers.h
//  WordCamp
//
//  Created by Marko Heijnen on 15-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Speakers : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * post_id;
@property (nonatomic, retain) NSString * wp_username;
@property (nonatomic, retain) NSSet *sessions;
@end

@interface Speakers (CoreDataGeneratedAccessors)

- (void)addSessionsObject:(NSManagedObject *)value;
- (void)removeSessionsObject:(NSManagedObject *)value;
- (void)addSessions:(NSSet *)values;
- (void)removeSessions:(NSSet *)values;

@end
