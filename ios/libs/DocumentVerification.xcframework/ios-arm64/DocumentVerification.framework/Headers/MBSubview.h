//
//  MBSubview.h
//  BarcodeFramework
//
//  Created by Jura on 06/06/14.
//  Copyright (c) 2015 Microblink Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBMicroblinkDefines.h"

NS_ASSUME_NONNULL_BEGIN


@protocol MDVSubviewDelegate;

/**
 Base class for all overlay subviews
 */
MB_CLASS_AVAILABLE_IOS(11.0)
@interface MDVSubview : UIView

/** Delegate which is notified on Overlay events */
@property (nonatomic, weak, nullable) id<MDVSubviewDelegate> delegate;

@end

/**
 * Protocol which all objects interested in receiving information about overlay subviews need to implement
 */
@protocol MDVSubviewDelegate <NSObject>

/** Delegate method called when animation starts */
- (void)subviewAnimationDidStart:(MDVSubview *)subview;

/** Delegate method called when animation finishes */
- (void)subviewAnimationDidFinish:(MDVSubview *)subview;

@end

NS_ASSUME_NONNULL_END
