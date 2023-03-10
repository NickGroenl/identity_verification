// 
// MBRecognizerRunnerMetadataDelegates.h
// 
// AUTOMATICALLY GENERATED SOURCE. DO NOT EDIT!
// 
 
#import "MBDebugRecognizerRunnerDelegate.h"
#import "MBDetectionRecognizerRunnerDelegate.h"
#import "MBOcrRecognizerRunnerDelegate.h"
#import "MBGlareRecognizerRunnerDelegate.h"
#import "MBFirstSideFinishedRecognizerRunnerDelegate.h"
 
#import "MBMicroblinkDefines.h"
#import <Foundation/Foundation.h>
 
/**
 * Class containing all metadata delegates
 */
MB_CLASS_AVAILABLE_IOS(11.0) MB_FINAL
@interface MDVRecognizerRunnerMetadataDelegates : NSObject
 
@property (nonatomic, weak, nullable) id<MDVDebugRecognizerRunnerDelegate> debugRecognizerRunnerDelegate;
@property (nonatomic, weak, nullable) id<MDVDetectionRecognizerRunnerDelegate> detectionRecognizerRunnerDelegate;
@property (nonatomic, weak, nullable) id<MDVOcrRecognizerRunnerDelegate> ocrRecognizerRunnerDelegate;
@property (nonatomic, weak, nullable) id<MDVGlareRecognizerRunnerDelegate> glareRecognizerRunnerDelegate;
@property (nonatomic, weak, nullable) id<MDVFirstSideFinishedRecognizerRunnerDelegate> firstSideFinishedRecognizerRunnerDelegate;
 
@end
 