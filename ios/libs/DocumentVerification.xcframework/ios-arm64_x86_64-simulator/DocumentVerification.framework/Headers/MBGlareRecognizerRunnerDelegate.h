//
//  MBGlareRecognizerRunnerDelegate.h
//  MicroblinkDev
//
//  Created by DoDo on 24/04/2018.
//

#ifndef MBGlareRecognizerRunnerDelegate_h
#define MBGlareRecognizerRunnerDelegate_h

@class MDVRecognizerRunner;

@protocol MDVGlareRecognizerRunnerDelegate <NSObject>
@required

/**
 * Called when scanning library finishes glare detection.
 * NOTE: This method is called on background processing thread. Make sure that you dispatch all your UI API calls to main thread.
 */
- (void) recognizerRunner:(nonnull MDVRecognizerRunner *)recognizerRunner didFinishGlareDetectionWithResult:(BOOL)glareFound;
@end


#endif /* MBGlareRecognizerRunnerDelegate_h */
