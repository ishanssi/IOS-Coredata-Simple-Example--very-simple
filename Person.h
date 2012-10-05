//
//  Person.h
//  asdfASD
//
//  Created by ishan on 10/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject

@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * address;

@end
