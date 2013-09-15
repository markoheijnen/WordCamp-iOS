//
//  WordCampAppDelegate.h
//  WordCamp
//
//  Created by Marko Heijnen on 14-09-13.
//  Copyright (c) 2013 CodeKitchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MMDrawerController;

@interface WordCampAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic,strong) MMDrawerController * drawerController;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end

