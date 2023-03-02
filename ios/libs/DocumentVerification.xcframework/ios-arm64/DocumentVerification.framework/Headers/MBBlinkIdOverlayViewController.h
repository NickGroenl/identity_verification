//
//  MBBlinkIdOverlayViewController.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 03/06/2019.
//

#import "MBBaseOverlayViewController.h"

NS_ASSUME_NONNULL_BEGIN

@protocol MDVBlinkIdOverlayViewControllerDelegate;

@class MDVBlinkIdOverlaySettings;
@class MDVRecognizerCollection;

/**
 * Default version of overlay view controller with modern design.
 */
MB_CLASS_AVAILABLE_IOS(11.0) MB_FINAL
@interface MDVBlinkIdOverlayViewController : MDVBaseOverlayViewController

/**
 * Common BlinkId UI settings
 */
@property (nonatomic, readonly) MDVBlinkIdOverlaySettings *settings;

/**
 * Delegate
 */
@property (nonatomic, weak, readonly) id<MDVBlinkIdOverlayViewControllerDelegate> delegate;

/**
 * Designated intializer.
 *
 *  @param settings MDVBlinkIdOverlaySettings object
 *
 *  @param recognizerCollection MDVRecognizerCollection object
 *
 *  @return initialized overlayViewController
 */
- (instancetype)initWithSettings:(MDVBlinkIdOverlaySettings *)settings recognizerCollection:(MDVRecognizerCollection *)recognizerCollection delegate:(nonnull id<MDVBlinkIdOverlayViewControllerDelegate>)delegate;

@end

NS_ASSUME_NONNULL_END
