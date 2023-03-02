//
//  MBOcrRecognizerRunnerDelegate.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 20/12/2017.
//

@class MDVRecognizerRunner;
@class MDVOcrLayout;

/**
 * Protocol for obtaining ocr results
 */
@protocol MDVOcrRecognizerRunnerDelegate <NSObject>
@required

/**
 * Called when Scanning library has MDVOcrLayout available and ready to be displayed on UI.
 * NOTE: This method is called on background processing thread. Make sure that you dispatch all your UI API calls to main thread.
 */
- (void)recognizerRunner:(nonnull MDVRecognizerRunner *)recognizerRunner
      didObtainOcrResult:(nonnull MDVOcrLayout *)ocrResult
          withResultName:(nonnull NSString *)resultName;

@end
