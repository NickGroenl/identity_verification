//
//  MBRecognizerRunnerViewControllerDelegate.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 18/12/2017.
//

#import <Foundation/Foundation.h>

@protocol MDVRecognizerRunnerViewController;

NS_ASSUME_NONNULL_BEGIN

/**
 * Protocol for MDVRecognizerRunnerViewController actions
 */
@protocol MDVRecognizerRunnerViewControllerDelegate <NSObject>
@required
/**
 * Scanning library requested authorization for Camera access from the user, but the user declined it.
 * This case means scanning cannot be performed, because accessing camera images is now allowed.
 *
 * In this callback you have the chance to handle this case and present some kind of a message to the user on top
 * of scanningViewController.
 *
 *  @param recognizerRunnerViewController Scanning view controller which was responsible for scanning
 */
- (void)recognizerRunnerViewControllerUnauthorizedCamera:(nonnull UIViewController<MDVRecognizerRunnerViewController> *)recognizerRunnerViewController;

/**
 * Scanning library found an error. The error object is returned and contains
 * description of the error, in a specified language. Do your error handling here.
 *
 * Currently, only one situation can result with this callback being called:
 * - Using camera session resulted with AVCaptureSessionRuntimeErrorNotification notification
 *
 * The best way to handle this is to Log the error (GA, Crashlytics, Flurry) and let the user continue
 * using the app.
 *
 *  @param recognizerRunnerViewController Scanning view controller which was responsible for scanning
 *  @param error                  Error object describing the error
 */
- (void)recognizerRunnerViewController:(nonnull UIViewController<MDVRecognizerRunnerViewController> *)recognizerRunnerViewController didFindError:(NSError *)error;

/**
 * Scanning library was closed, usually by the user pressing close button and cancelling the scan
 *
 *  @param recognizerRunnerViewController Scanning view controller responsible for scanning
 */
- (void)recognizerRunnerViewControllerDidClose:(nonnull UIViewController<MDVRecognizerRunnerViewController> *)recognizerRunnerViewController;

/**
 * Called when Scanning library will display help. This can happen when the user presses
 * help button on scanning UI, or on first run of the application
 *
 *  @param recognizerRunnerViewController recognizerRunnerViewController Recognizer runner view controller responsible for scanning
 */
- (void)recognizerRunnerViewControllerWillPresentHelp:(nonnull UIViewController<MDVRecognizerRunnerViewController> *)recognizerRunnerViewController;

/**
 * Called when Scanning library is resuming scanning.
 *
 *  @param recognizerRunnerViewController recognizerRunnerViewController Recognizer runner view controller responsible for scanning
 */
- (void)recognizerRunnerViewControllerDidResumeScanning:(nonnull UIViewController<MDVRecognizerRunnerViewController> *)recognizerRunnerViewController;

/**
 * Called when Scanning library is stopped scanning.
 *
 *  @param recognizerRunnerViewController recognizerRunnerViewController Recognizer runner view controller responsible for scanning
 */
- (void)recognizerRunnerViewControllerDidStopScanning:(nonnull UIViewController<MDVRecognizerRunnerViewController> *)recognizerRunnerViewController;

@optional
/**
 * Called  when Scanning library will turn on/off torch.
 *
 *  @param recognizerRunnerViewController recognizerRunnerViewController Recognizer runner view controller responsible for scanning
 *  @param isTorchOn isTorchOn Returns YES if torch mode was set successfully, otherwise NO.
 */
- (void)recognizerRunnerViewController:(nonnull UIViewController<MDVRecognizerRunnerViewController> *)recognizerRunnerViewController willSetTorch:(BOOL)isTorchOn;

@end

NS_ASSUME_NONNULL_END
