//
//  DetailViewController.m
//  Created by Devin Ross on 7/7/10.
//
/*
 
 tapku.com || https://github.com/devinross/tapkulibrary
 
 Permission is hereby granted, free of charge, to any person
 obtaining a copy of this software and associated documentation
 files (the "Software"), to deal in the Software without
 restriction, including without limitation the rights to use,
 copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the
 Software is furnished to do so, subject to the following
 conditions:
 
 The above copyright notice and this permission notice shall be
 included in all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 OTHER DEALINGS IN THE SOFTWARE.
 
 */

#import "DetailViewController.h"

#pragma mark - DetailViewController
@implementation DetailViewController

- (void) viewDidLoad {
    [super viewDidLoad];

	self.view.backgroundColor = [UIColor whiteColor];
	
    self.toolbar = [[UIToolbar alloc] initWithFrame:CGRectMakeWithPoint(CGPointZero, self.view.bounds.size.width, 44)];
	self.toolbar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
	self.toolbar.items = @[];
	[self.view addSubview:self.toolbar];
}

- (void) setupWithMainController:(UIViewController*)controller{
	[self.mainController.view removeFromSuperview];
	self.mainController = controller;
	
	CGFloat h = self.toolbar.frame.size.height;
	
	CGRect r = CGRectMake(0, h, self.view.frame.size.width, self.view.frame.size.height-h);
	self.mainController.view.frame = r;
	[self.mainController viewWillAppear:NO];
	[self.view addSubview:self.mainController.view];
	[self.mainController viewDidAppear:NO];
	


	if(self.currentPopoverController!=nil){
		
		UIBarButtonItem *item = [self.toolbar items][0];
		
		
		NSMutableArray *items = [NSMutableArray array];
		[items addObject:item];

		if(self.mainController.toolbarItems!=nil){
			[items addObjectsFromArray:self.mainController.toolbarItems];
		}
		[self.toolbar setItems:items animated:YES];

		
	}else{
		[self.toolbar setItems:self.mainController.toolbarItems];
	}
	
}
- (void) splitViewController: (UISplitViewController*)svc willHideViewController:(UIViewController *)aViewController withBarButtonItem:(UIBarButtonItem*)barButtonItem forPopoverController: (UIPopoverController*)pc {
    

	barButtonItem.title = @"Demos";
    NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items insertObject:barButtonItem atIndex:0];
    [self.toolbar setItems:items animated:YES];
    self.currentPopoverController = pc;
}
- (void) splitViewController: (UISplitViewController*)svc willShowViewController:(UIViewController *)aViewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
	
	NSMutableArray *items = [[self.toolbar items] mutableCopy];
    [items removeObjectAtIndex:0];
    [self.toolbar setItems:items animated:YES];
    self.currentPopoverController = nil;

}

#pragma mark TableView Delegate & Data Source
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 0;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	/*
	 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
	 [self.navigationController pushViewController:detailViewController animated:YES];
	 [detailViewController release];
	 */
}

- (BOOL) shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    return YES;
}

@end