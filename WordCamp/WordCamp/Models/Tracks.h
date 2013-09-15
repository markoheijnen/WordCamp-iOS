//
//  Tracks.h
//  WordCamp
//
//  Created by Marko Heijnen on 15-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Sessions;

@interface Tracks : NSManagedObject

@property (nonatomic, retain) NSString * content;
@property (nonatomic, retain) NSNumber * term_id;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSSet *sessions;
@end

@interface Tracks (CoreDataGeneratedAccessors)

- (void)addSessionsObject:(Sessions *)value;
- (void)removeSessionsObject:(Sessions *)value;
- (void)addSessions:(NSSet *)values;
- (void)removeSessions:(NSSet *)values;

@end
