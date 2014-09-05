//
//  ASViewController.m
//  AnimalSounds
//
//  Created by Tim Novikoff on 9/21/13.
//  Copyright (c) 2013 Tim Novikoff. All rights reserved.
//

#import "ASViewController.h"
#import "ASItemsTableViewController.h"

@interface ASViewController ()
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (strong, nonatomic) IBOutlet UITextField *animalTextField;
@property (strong, nonatomic) IBOutlet UITextField *soundTextField;

@property (strong, nonatomic) NSMutableArray *known;
@property (strong, nonatomic) NSMutableArray *unknown;

@property (strong, nonatomic) UINavigationController *navController;
@end

@implementation ASViewController

#define kAnimal @"animal"
#define kSound @"sound"
#define kKnown @"known"
#define kUnknown @"unknown"

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.known = [[NSUserDefaults standardUserDefaults] objectForKey:kKnown];
    self.unknown = [[NSUserDefaults standardUserDefaults] objectForKey:kUnknown];
    
    if (self.known == nil) {
        self.known = [[NSMutableArray alloc] init];
    }
    
    if (self.unknown == nil) {
        self.unknown = [[NSMutableArray alloc] init];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segmentedControlValueChanged:(id)sender {
    if (self.segmentedControl.selectedSegmentIndex == 1) {
        self.soundTextField.hidden = YES;
        self.soundTextField.text = @"";
    }
    else{
        self.soundTextField.hidden = NO;
    }
}
- (IBAction)showButonPressed:(id)sender {
    
    ASItemsTableViewController *itemsTableViewController  = [[ASItemsTableViewController alloc] initWithStyle:UITableViewStyleGrouped];
    
    itemsTableViewController.items = @[self.known, self.unknown];
    
    self.navController = [[UINavigationController alloc] initWithRootViewController:itemsTableViewController];
    [self presentViewController:self.navController animated:YES completion:^{
        NSLog(@"it has been presented");
    }];
    
}
- (IBAction)addButtonPressed:(id)sender {
    NSString *animal = self.animalTextField.text;
    NSString *sound = self.soundTextField.text;
    
    NSDictionary *dictionary = @{kAnimal: animal,
                                 kSound: sound
                                 };
    
    NSLog(@"dictionary: %@", dictionary);
    
    if (self.segmentedControl.selectedSegmentIndex == 0) {
        [self.known addObject:dictionary];
        [[NSUserDefaults standardUserDefaults] setObject:self.known forKey:kKnown];
    }
    else{
        [self.unknown addObject:dictionary];
        [[NSUserDefaults standardUserDefaults] setObject:self.unknown forKey:kUnknown];
    }
    
}

@end
