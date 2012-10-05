//
//  Mainview.m
//  asdfASD
//
//  Created by ishan on 10/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Mainview.h"
#import "Person.h"
#import "AppDelegate.h"
#import "testclass.h"
 
@interface Mainview ()

@end

@implementation Mainview
@synthesize managedObjectContext;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    if (managedObjectContext == nil) 
        { 
            managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]; 
            NSLog(@"After managedObjectContext: %@",  managedObjectContext);
        }
           // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)btnclicked:(id)sender {


    
    [self loaddata];    
}

- (void) deleteAllObjects  {
    
    NSString   *entityDescription=@"Person";
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error;
    NSArray *items = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
 
    
    
    for (NSManagedObject *managedObject in items) {
        [managedObjectContext deleteObject:managedObject];
        NSLog(@"%@ object deleted",entityDescription);
    }
    if (![managedObjectContext save:&error]) {
        NSLog(@"Error deleting %@ - error:%@",entityDescription,error);
    }
    
}

-(void)insertvalue
{   

    if (managedObjectContext == nil) 
        { 
            managedObjectContext = [(AppDelegate *)[[UIApplication sharedApplication] delegate] managedObjectContext]; 
            NSLog(@"After managedObjectContext: %@",  managedObjectContext);
        }
    
    NSManagedObjectContext *context = [self managedObjectContext];
    Person *Cobj = [NSEntityDescription
                           insertNewObjectForEntityForName:@"Person"
                           inManagedObjectContext:context];
    
    Cobj.name =@"Janith Ilanagakkok";
//    Cobj.address=@"Colombo";
    Cobj.age=@"21";
    
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Whoops, couldn't save: %@", [error localizedDescription]);
    }
  
    
}

-(void)loaddata
{
    
        NSManagedObjectContext *context = [self managedObjectContext];
        NSError *error;
    
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person"
                                              inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
        for (Person *info in fetchedObjects) {
        NSLog(@"Name: %@", info.name);
        NSLog(@"Address: %@", info.address);
         NSLog(@"New name is %@",info.age);

        
    }
    
    Person *info2=[fetchedObjects objectAtIndex:0];
  
     NSLog(@"MY name is %@",info2.name);
 
}

-(void)updatefield
{
    NSError *saveError;
     NSManagedObjectContext *context = [self managedObjectContext];
     NSError *error;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];        

   
    Person *info2=[fetchedObjects objectAtIndex:0];
    
    NSLog(@"Old name is %@",info2.name);
    
    [info2 setAddress:@"Galle , Rathgama"];
    
     NSLog(@"New name is %@",info2.name);
    
    if (![managedObjectContext save:&saveError]) {
        NSLog(@"Saving changes to book book two failed: %@", saveError);
    } else {
        
        NSLog(@"Saved Succesfully");
            // The changes to bookTwo have been persisted.
    }

}



@end
