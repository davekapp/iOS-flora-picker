//
//  ViewController.m
//  FloraFetch
//
//  Created by David Kapp on 1/29/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize colorPicker;
@synthesize flowerView;
@synthesize flowerDetailsView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.flowerDetailsView.backgroundColor = [UIColor clearColor];
  [self getNewFlower:self];
}

- (void)viewDidUnload
{
    [self setColorPicker:nil];
    [self setFlowerView:nil];
    [self setFlowerDetailsView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)getNewFlower:(id)sender {
  NSURL *imageUrl;
  NSURL *detailsUrl;
  NSString *imageUrlString;
  NSString *detailsUrlString;
  NSString *color;
  int sessionId;

  color = [self.colorPicker titleForSegmentAtIndex:self.colorPicker.selectedSegmentIndex];
  sessionId = random() % 50000;
  
  NSString *baseUrl = @"http://www.floraphotographs.com";
  imageUrlString = [[NSString alloc] initWithFormat:@"%@/showrandomios.php?color=%@&session=%d", baseUrl, color, sessionId];
  detailsUrlString = [[NSString alloc] initWithFormat:@"%@/detailios.php?session=%d", baseUrl, sessionId];
  
  imageUrl = [[NSURL alloc] initWithString:imageUrlString];
  detailsUrl = [[NSURL alloc] initWithString:detailsUrlString];
  
  [self.flowerView loadRequest:[NSURLRequest requestWithURL:imageUrl]];
  [self.flowerDetailsView loadRequest:[NSURLRequest requestWithURL:detailsUrl]];
}

- (IBAction)toggleFlowerDetail:(id)sender {
  self.flowerDetailsView.hidden = ![sender isOn];
}
@end























