//
//  ListTableViewController.m
//  Number Generator
//
//  Created by Lance  on 1/2/13.
//
//

#import "ListTableViewController.h"

@interface NumberListTableViewController ()
{
    Generator *generator;
}

@end

@implementation NumberListTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    generator = [Generator sharedGenerator];
}

- (IBAction)numberListActionButton:(UIBarButtonItem *)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Email List",nil];
    if (IDIOM == IPAD) {
        [actionSheet showFromBarButtonItem:_actionBarButton animated:YES];
    } else {
        [actionSheet showInView:self.view];
    }
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    // Present email view
    if (buttonIndex == 0) {
        if ([MFMailComposeViewController canSendMail]) {
            NSString *numberString;
            numberString = ((NSNumber *)[generator.listOfNumbers objectAtIndex:0]).stringValue;
            for (int i = 1; i < generator.listOfNumbers.count; i++) {
                numberString = [numberString stringByAppendingString:[NSString stringWithFormat:@",%@",((NSNumber *)[generator.listOfNumbers objectAtIndex:i]).stringValue]];
                if (i > 999) {
                    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Email is limited to send only the first 1,000 numbers in the list" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
                    [alert show];
                    break;
                }
            }
            MFMailComposeViewController *mailViewController = [[MFMailComposeViewController alloc] init];
            mailViewController.mailComposeDelegate = self;
            [mailViewController setSubject:@"Random Number List"];
            [mailViewController setMessageBody:numberString isHTML:NO];
            [self presentViewController:mailViewController animated:YES completion:NULL];
        } else {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:@"Please set up email for this device to use this feature." delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
            [alert show];
            NSLog(@"Device is unable to send email in its current state.");
        }
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [controller dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return generator.listOfNumbers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    NSString *value = [[generator.listOfNumbers objectAtIndex:indexPath.row]stringValue];
    cell.textLabel.text = value;
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    // Configure the cell...
    
    return cell;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    if (IDIOM == IPAD) {
        return YES;
    } else {
        return NO;
    }
}

@end
