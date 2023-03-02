// Created by Jura Skrlec on 01.07.2021..
// Copyright (c) 2021 Microblink Ltd. All rights reserved.

// ANY UNAUTHORIZED USE OR SALE, DUPLICATION, OR DISTRIBUTION
// OF THIS PROGRAM OR ANY OF ITS PARTS, IN SOURCE OR BINARY FORMS,
// WITH OR WITHOUT MODIFICATION, WITH THE PURPOSE OF ACQUIRING
// UNLAWFUL MATERIAL OR ANY OTHER BENEFIT IS PROHIBITED!
// THIS PROGRAM IS PROTECTED BY COPYRIGHT LAWS AND YOU MAY NOT
// REVERSE ENGINEER, DECOMPILE, OR DISASSEMBLE IT.

#ifndef MBVerificationStep_h
#define MBVerificationStep_h

typedef NS_ENUM(NSInteger, MDVVerificationStep) {
    MDVVerificationStepFrontExtraction,
    MDVVerificationStepTiltNeutral,
    MDVVerificationStepTiltLeft,
    MDVVerificationStepTiltRight,
    MDVVerificationStepTiltUp,
    MDVVerificationStepTiltDown,
    MDVVerificationStepBackExtraction,
    MDVVerificationStepLivenessDeduction
};

#endif /* MBVerificationStep_h */
