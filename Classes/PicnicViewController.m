#import "PicnicViewController.h"

@implementation PicnicViewController
@synthesize basketTop;
@synthesize basketBottom;
@synthesize napkinTop;
@synthesize napkinBottom;
@synthesize bug;

- (void)viewTapped:(UITapGestureRecognizer *)sender {
    NSLog(@"View tapped!");
}

- (void)moveToLeft:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    if (tappedNewYearLogo) return;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:2.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(faceRight:finished:context:)];
    bug.center = CGPointMake(75, 200);
    [UIView commitAnimations];
    
}

- (void)faceRight:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    if (tappedNewYearLogo) return;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(moveToRight:finished:context:)];
    bug.transform = CGAffineTransformMakeRotation(M_PI);
    [UIView commitAnimations];
    
}

- (void)moveToRight:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    if (tappedNewYearLogo) return;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:2.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDidStopSelector:@selector(faceLeft:finished:context:)];
    bug.center = CGPointMake(230, 250);
    [UIView commitAnimations];
    
}

- (void)faceLeft:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context {
    
    if (tappedNewYearLogo) return;
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    [UIView setAnimationDelay:0.0];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDidStopSelector:@selector(moveToLeft:finished:context:)];
    bug.transform = CGAffineTransformMakeRotation(0);
    [UIView commitAnimations];
    
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint touchLocation = [touch locationInView:self.view];
    
    //CGRect bugRect = [bug frame];
    CGRect bugRect = [[[bug layer] presentationLayer] frame];
    if (CGRectContainsPoint(bugRect, touchLocation)) {
        NSLog(@"Logo tapped!");
    } else {
        NSLog(@"Logo not tapped.");
        return;
    }
    tappedNewYearLogo = true;
    [UIView animateWithDuration:0.7
                          delay:0.0
                        options:UIViewAnimationCurveEaseOut
                     animations:^{
                         bug.transform = CGAffineTransformMakeScale(1.25, 0.75);
                     }
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:2.0
                                               delay:2.0
                                             options:0
                                          animations:^{
                                              bug.alpha = 0.0;
                                          } completion:^(BOOL finished) {
                                              [bug removeFromSuperview];
                                              bug = nil;
                                          }];
                     }];
    
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //UITapGestureRecognizer *tapRecognizer = [[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)] autorelease];
    //[bug addGestureRecognizer:tapRecognizer];
    
    CGRect basketTopFrame = basketTop.frame;
    basketTopFrame.origin.y = -basketTopFrame.size.height;
    
    CGRect basketBottomFrame = basketBottom.frame;
    basketBottomFrame.origin.y = self.view.bounds.size.height;
    
    // iOS4+
    [UIView animateWithDuration:0.5
                          delay:1.0
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         basketTop.frame = basketTopFrame;
                         basketBottom.frame = basketBottomFrame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
    
    CGRect napkinTopFrame = napkinTop.frame;
    napkinTopFrame.origin.y = -napkinTopFrame.size.height;
    CGRect napkinBottomFrame = napkinBottom.frame;
    napkinBottomFrame.origin.y = self.view.bounds.size.height;
    
    [UIView animateWithDuration:0.7
                          delay:1.2
                        options: UIViewAnimationCurveEaseOut
                     animations:^{
                         napkinTop.frame = napkinTopFrame;
                         napkinBottom.frame = napkinBottomFrame;
                     }
                     completion:^(BOOL finished){
                         NSLog(@"Done!");
                     }];
    
    
    [self moveToLeft:nil finished:nil context:nil];
    
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end