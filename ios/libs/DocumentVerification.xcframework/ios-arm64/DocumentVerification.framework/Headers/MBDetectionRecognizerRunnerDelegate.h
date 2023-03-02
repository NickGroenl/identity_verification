//
//  MBDetectionRecognizerRunnerDelegate.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 20/12/2017.
//

@class MDVRecognizerRunner;
@class MDVDisplayablePointsDetection;
@class MDVDisplayableQuadDetection;

NS_ASSUME_NONNULL_BEGIN

/**
 * Protocol for obtaining detection results
 */
@protocol MDVDetectionRecognizerRunnerDelegate <NSObject>
@optional
/**
 * Called when Scanning library finishes detection of objects.
 * Detection cycle happens before recognition cycle and it attempts to find the location of specific object on an image.
 * Since detection and recognition are two separate events, it is possible for detection to be successful while recognition can fail (not
 * vice versa).
 *
 * NOTE: This method is called on background processing thread. Make sure that you dispatch all your UI API calls to main thread.
 *
 * Returned MDVDisplayableQuadDetection object.
 *
 *  @param recognizerRunner recognizerRunner recognizer runner object responsible for scanning
 *  @param displayableQuad displayable quad object detection containing information of detection (i.e. location)
 */
- (void)recognizerRunner:(nonnull MDVRecognizerRunner *)recognizerRunner didFinishDetectionWithDisplayableQuad:(MDVDisplayableQuadDetection *)displayableQuad;

/**
 * Called when Scanning library finishes detection of objects.
 * Detection cycle happens before recognition cycle and it attempts to find the location of specific object on an image.
 * Since detection and recognition are two separate events, it is possible for detection to be successful while recognition can fail (not
 * vice versa).
 *
 * NOTE: This method is called on background processing thread. Make sure that you dispatch all your UI API calls to main thread.
 *
 * Returned MDVDisplayablePointsDetection object.
 *
 *  @param recognizerRunner recognizerRunner recognizer runner object responsible for scanning
 *  @param displayablePoints points object detection containing information of detection (i.e. location)
 */
- (void)recognizerRunner:(nonnull MDVRecognizerRunner *)recognizerRunner didFinishDetectionWithDisplayablePoints:(MDVDisplayablePointsDetection *)displayablePoints;

/**
 * Called when Scanning library fails to detect any object with any of the currently active recognizers.
 *
 * NOTE: This method is called on background processing thread. Make sure that you dispatch all your UI API calls to main thread.
 *
 * @param recognizerRunner Recognizer runner object responsible for scanning
 */
- (void)recognizerRunnerDidFailDetection:(nonnull MDVRecognizerRunner *)recognizerRunner;

@end

NS_ASSUME_NONNULL_END
