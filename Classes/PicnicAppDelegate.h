//  PicnicAppDelegate.h


#import <UIKit/UIKit.h>

@class PicnicViewController;

@interface PicnicAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PicnicViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PicnicViewController *viewController;

@end

