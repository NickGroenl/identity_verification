// Created by Jura Skrlec on 01.07.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#ifndef MBVerificationStatus_h
#define MBVerificationStatus_h

typedef NS_ENUM(NSInteger, MDVVerificationStatus) {

    /// Verification process has not been started yet
    MDVVerificationStatusNotAvailable,
    /// Document not detected
    MDVVerificationStatusNoDocument,
    // Document blurred
    MDVVerificationStatusDocumentBlurred,
    /// Hand not present
    MDVVerificationStatusHandNotPresent,
    /// Not enough hand present
    MDVVerificationStatusNotEnoughHandPresent,
    /// Detected card not in hand
    MDVVerificationStatusDocumentNotInHand,
    /// Detected document in hand
    MDVVerificationStatusDocumentInHand,
    /// Placeholder for case when hand covers document edges
    MDVVerificationStatusCoveredDocumentEdges,
    /// Moving in wrong direction
    MDVVerificationStatusWrongDirectionTilt,
    /// Tilt angle > expected angle + tolerance
    MDVVerificationStatusOvertilted,
    /// Tilt angle < expected angle - tolerance
    MDVVerificationStatusUndertilted,
    /// Correct tilt was detected in last frame, but settings dictate that more such frames must be provided
    MDVVerificationStatusTiltUnstable,
    /// Extraction recognizer did not finish successfully
    MDVVerificationStatusExtractionFailed,
    /// The previous step completed succesfully, recognizer is awaiting next frame
    MDVVerificationStatusStepCompleted
};

#endif /* MBVerificationStatus_h */
