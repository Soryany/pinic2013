//  PicnicViewController.h


#import <UIKit/UIKit.h>

@interface PicnicViewController : UIViewController {
    bool bugDead;
}

@property (assign) IBOutlet UIImageView *basketTop;
@property (assign) IBOutlet UIImageView *basketBottom;
@property (assign) IBOutlet UIImageView *napkinTop;
@property (assign) IBOutlet UIImageView *napkinBottom;
@property (assign) IBOutlet UIImageView *bug;

@end

