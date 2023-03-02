//
//  MBDocumentImageMoireStatus.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 29/05/2020.
//

#ifndef MBImageAnalysisDetectionStatus_h
#define MBImageAnalysisDetectionStatus_h

/**
* MDVImageAnalysisDetectionStatus  enum defines possible states of detection.
*/
typedef NS_ENUM(NSInteger, MDVImageAnalysisDetectionStatus) {

    // // Detection was not performed
    MDVImageAnalysisDetectionStatusNotAvailable = 0,

    // Not detected on input image
    MDVImageAnalysisDetectionStatusNotDetected,

    // Detected on input image
    MDVImageAnalysisDetectionStatusDetected
};

#endif /* MBDocumentImageMoireStatus_h */
