//
//  CoreAnimationDemoViewController.h
//  CoreAnimationDemo
//
//  Created by Joost on 7/20/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreAnimationDemoViewController : UIViewController {
    
    UIImageView *elephant;
    UIImageView *hippo;
    UISegmentedControl *segmented;
    UITextField *xValue;
    UITextField *yValue;
    UITextField *zValue;
    UIButton *controlButton;
    UITextField *radianValue;
    UITextField *time;
    UILabel *lx;
    UILabel *ly;
    UILabel *lz;
    UILabel *lr;

    UISwitch *endSet;
}
- (IBAction)reset:(id)sender;
@property (nonatomic, retain) IBOutlet UISwitch *endSet;
@property (nonatomic, retain) IBOutlet UIImageView *elephant;
@property (nonatomic, retain) IBOutlet UIImageView *hippo;
@property (nonatomic, retain) IBOutlet UISegmentedControl *segmented;
@property (nonatomic, retain) IBOutlet UITextField *xValue;
@property (nonatomic, retain) IBOutlet UITextField *yValue;
@property (nonatomic, retain) IBOutlet UITextField *zValue;
@property (nonatomic, retain) IBOutlet UIButton *controlButton;
@property (nonatomic, retain) IBOutlet UITextField *radianValue;
@property (nonatomic, retain) IBOutlet UITextField *time;
@property (nonatomic, retain) IBOutlet UILabel *lx;
@property (nonatomic, retain) IBOutlet UILabel *ly;
@property (nonatomic, retain) IBOutlet UILabel *lz;
@property (nonatomic, retain) IBOutlet UILabel *lr;


- (IBAction)switchAnimation:(id)sender;
- (IBAction)show:(id)sender;

@end
