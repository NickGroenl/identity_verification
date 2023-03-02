//
//  MBFrameRecognitionRecognizerRunnerViewControllerDelegate.h
//  BlinkShowcaseDev
//
//  Created by Jura Skrlec on 02/12/2020.
//

#ifndef MBFrameRecognitionRecognizerRunnerViewControllerDelegate_h
#define MBFrameRecognitionRecognizerRunnerViewControllerDelegate_h

#import "MBRecognizerResult.h"

@protocol MDVRecognizerRunnerViewController;

/**
 * Protocol for obtaining frame recognition
 */
@protocol MDVFrameRecognitionRecognizerRunnerViewControllerDelegate <NSObject>
@required
/**
 * Scanning library did output frame with state
 *
 *  @param recognizerRunnerViewController scanningViewController Scanning view controller responsible for scanning
 *  @param state                  state of scanning
 */
- (void)recognizerRunnerViewControllerDidFinishFrameRecognition:(nonnull UIViewController<MDVRecognizerRunnerViewController> *)recognizerRunnerViewController state:(MDVRecognizerResultState)state;

@end

#endif /* MBFrameRecognitionRecognizerRunnerViewControllerDelegate_h */
