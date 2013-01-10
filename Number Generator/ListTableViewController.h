//
//  ListTableViewController.h
//  Number Generator
//
//  Created by Lance Batson  on 1/2/13.
//
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>
#import "Generator.h"

@interface NumberListTableViewController : UITableViewController <MFMailComposeViewControllerDelegate,UIActionSheetDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *actionBarButton;

@end
