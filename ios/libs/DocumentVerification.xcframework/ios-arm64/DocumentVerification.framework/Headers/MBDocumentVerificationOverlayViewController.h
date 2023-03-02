// Created by Jura Skrlec on 02.07.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#import "MBBaseOverlayViewController.h"
#import "MBDocumentVerificationOverlaySettings.h"
#import "MBDocumentVerificationRecognizer.h"

@protocol MDVDocumentVerificationOverlayViewControllerDelegate;

NS_ASSUME_NONNULL_BEGIN

MB_CLASS_AVAILABLE_IOS(11.0) MB_FINAL
@interface MDVDocumentVerificationOverlayViewController : MDVBaseOverlayViewController

/**
 * Settings
 */
@property (nonatomic, strong, readonly) MDVDocumentVerificationOverlaySettings *settings;

/**
 * Delegate
 */
@property (nonatomic, weak, readonly) id<MDVDocumentVerificationOverlayViewControllerDelegate> delegate;

/**
 * Designated intializer.
 *
 *  @param settings MDVDocumentVerificationOverlaySettings object
 *
 *  @param verificationRecognizer MDVDocumentVerificationRecognizer object
 *
 *  @return Initialized overlayViewController
 */
- (instancetype)initWithSettings:(MDVDocumentVerificationOverlaySettings *)settings
                      recognizer:(MDVDocumentVerificationRecognizer *)verificationRecognizer
                        delegate:(nonnull id<MDVDocumentVerificationOverlayViewControllerDelegate>)delegate NS_SWIFT_NAME(init(settings:recognizer:delegate:));

@end

/**
 * Protocol for obtaining scanning results
 */
@protocol MDVDocumentVerificationOverlayViewControllerDelegate <NSObject>
/**
 * Scanning library did output scanning results
 *
 * Depending on how you want to treat the result, you might want to
 * dismiss the scanningViewController here.
 *
 * This method is the default way for getting access to results of scanning.
 *
 *  @param documentVerificationOverlayViewController  Scanning view controller responsible for scanning
 *  @param state                  state of scanning
 *
 *
 */
- (void)documentVerificationOverlayViewControllerDidFinishScanning:(nonnull MDVDocumentVerificationOverlayViewController *)documentVerificationOverlayViewController state:(MDVRecognizerResultState)state;

/**
 * Scanning library was closed, usually by the user pressing close button and cancelling the scan
 *
 *  @param documentVerificationOverlayViewController Scanning view controller responsible for scanning
 */
- (void)documentVerificationOverlayViewControllerDidTapClose:(nonnull MDVDocumentVerificationOverlayViewController *)documentVerificationOverlayViewController;

@end

NS_ASSUME_NONNULL_END
