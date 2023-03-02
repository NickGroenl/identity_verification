//
//  MBImageProcessingDelegate.h
//  Microblink
//
//  Created by DoDo on 07/05/2018.
//

@class MDVRecognizerRunner;
@class MDVImage;

@protocol MDVImageProcessingRecognizerRunnerDelegate <NSObject>
@required

/**
 * Called when MDVRecognizerRunner finishes processing given image.
 * NOTE: This method is called on background processing thread. Make sure that you dispatch all your UI API calls to main thread.
 */
- (void) recognizerRunner:(nonnull MDVRecognizerRunner *)recognizerRunner didFinishProcessingImage:(nonnull MDVImage *)image;

@end
