//
//  MBStringProcessingRecognizerRunnerDelegate.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 18/06/2018.
//

@class MDVRecognizerRunner;

@protocol MDVStringProcessingRecognizerRunnerDelegate <NSObject>
@required

/**
 * Called when MDVRecognizerRunner finishes processing given string.
 * NOTE: This method is called on background processing thread. Make sure that you dispatch all your UI API calls to main thread.
 */
- (void)recognizerRunner:(nonnull MDVRecognizerRunner *)recognizerRunner didFinishProcessingString:(nonnull NSString *)string;

@end
