//
//  ViewController.h
//  FloraFetch
//
//  Created by David Kapp on 1/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *colorPicker;
@property (weak, nonatomic) IBOutlet UIWebView *flowerView;
@property (weak, nonatomic) IBOutlet UIWebView *flowerDetailsView;

- (IBAction)getNewFlower:(id)sender;
- (IBAction)toggleFlowerDetail:(id)sender;

@end
