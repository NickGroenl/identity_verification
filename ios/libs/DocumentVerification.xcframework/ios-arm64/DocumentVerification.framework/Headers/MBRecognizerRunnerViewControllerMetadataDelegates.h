// 
// MBRecognizerRunnerViewControllerMetadataDelegates.h
// 
// AUTOMATICALLY GENERATED SOURCE. DO NOT EDIT!
// 
 
#import "MBDebugRecognizerRunnerViewControllerDelegate.h"
#import "MBDetectionRecognizerRunnerViewControllerDelegate.h"
#import "MBOcrRecognizerRunnerViewControllerDelegate.h"
#import "MBGlareRecognizerRunnerViewControllerDelegate.h"
#import "MBFirstSideFinishedRecognizerRunnerViewControllerDelegate.h"
 
#import "MBMicroblinkDefines.h"
#import <Foundation/Foundation.h>
 
/**
 * Class containing all metadata delegates
 */
MB_CLASS_AVAILABLE_IOS(11.0) MB_FINAL
@interface MDVRecognizerRunnerViewControllerMetadataDelegates : NSObject
 
@property (nonatomic, weak, nullable) id<MDVDebugRecognizerRunnerViewControllerDelegate> debugRecognizerRunnerViewControllerDelegate;
@property (nonatomic, weak, nullable) id<MDVDetectionRecognizerRunnerViewControllerDelegate> detectionRecognizerRunnerViewControllerDelegate;
@property (nonatomic, weak, nullable) id<MDVOcrRecognizerRunnerViewControllerDelegate> ocrRecognizerRunnerViewControllerDelegate;
@property (nonatomic, weak, nullable) id<MDVGlareRecognizerRunnerViewControllerDelegate> glareRecognizerRunnerViewControllerDelegate;
@property (nonatomic, weak, nullable) id<MDVFirstSideFinishedRecognizerRunnerViewControllerDelegate> firstSideFinishedRecognizerRunnerViewControllerDelegate;
 
@end
 