//
//  MBOcrRecognizerRunnerViewDelegate.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 18/12/2017.
//

#import <Foundation/Foundation.h>

@class MDVOcrLayout;
@protocol MDVRecognizerRunnerViewController;

/**
 * Protocol for obtaining ocr results
 */
@protocol MDVOcrRecognizerRunnerViewControllerDelegate <NSObject>
@required

/**
 * Called when scanning library has MDVOcrLayout ready to be displayed on UI.
 * NOTE: This method is called on background processing thread. Make sure that you dispatch all your UI API calls to main thread.
 */
- (void)recognizerRunnerViewController:(nonnull UIViewController<MDVRecognizerRunnerViewController> *)recognizerRunnerViewController
                    didObtainOcrResult:(nonnull MDVOcrLayout *)ocrResult
                        withResultName:(nonnull NSString *)resultName;

@end
