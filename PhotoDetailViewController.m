//
//  PhotoDetailViewController.m
//  igram
//
//  Created by xcode on 12/18/14.
//  Copyright (c) 2014 MSCline. All rights reserved.
//

#import "PhotoDetailViewController.h"
#import "Comment.h"

@interface PhotoDetailViewController () <UITableViewDataSource, UITableViewDelegate>

  @property (weak, nonatomic) IBOutlet UIImageView *imageView;
  @property (weak, nonatomic) IBOutlet UITableView *tableView;

  @property NSArray *comments;

  // for AlertView
  @property UITextField *alertViewPointerToTextView;

@end


@implementation PhotoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.imageView.image = self.photoImage;
    [self downloadComments];

}

-(void)downloadComments
{

    [Comment downloadCommentsForPhoto:self.photo completionBlock:^(NSArray *downloadedObjects, NSError *error) {

        [self downloadOfCommentTextComplete:downloadedObjects error:error];

    }];
}

-(void)downloadOfCommentTextComplete:(NSArray *)downloadedComments error:(NSError *)error
{

    if(error){ NSLog(@"%@", error); }
    
    self.comments = downloadedComments.mutableCopy;
    [self.tableView reloadData];

}

- (IBAction)onButtonAddPressed:(id)sender {


    [self showAlertViewAllowingUserToEnterComment];

}


#pragma mark AlertView

-(void)showAlertViewAllowingUserToEnterComment
{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Add New Comment"
                                                                   message:@""
                                                            preferredStyle:UIAlertControllerStyleAlert];

    // add text field in alert and save pointer to alert text field
    [alert addTextFieldWithConfigurationHandler:^(UITextField *textField) {

        self.alertViewPointerToTextView = textField;

    }];


    // add save and cancel buttons
    [alert addAction: [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault
                                                       handler:^(UIAlertAction * action) {

                                                            [self addComment:self.alertViewPointerToTextView.text];

                                                       }]];
     [alert addAction: [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil]];

    // present alert
    [self presentViewController:alert animated:YES completion:nil];

}

-(void)addComment:(NSString *)comment
{

    [Comment addCommentForPhoto:self.photo textOfComment:comment completionBlock:^{

        [self downloadComments];

    }];

}


#pragma mark TableView DataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self.comments count];

}

-(UITableViewCell *)tableView:(UITableView *)tableV cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell *cell = [tableV dequeueReusableCellWithIdentifier:@"detail" forIndexPath:indexPath];

    Comment *comment = [self.comments objectAtIndex:indexPath.row];
    
    cell.backgroundColor = [UIColor redColor];
    cell.textLabel.text = comment.commentText;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@",comment.onDate];

#warning add photo to Table View after do profile view
    // download photo image data
   // [comment.forPhoto downloadImageAndUpdateImageView:cell.imageView forIndexPath:indexPath];

    return cell;

}


@end
