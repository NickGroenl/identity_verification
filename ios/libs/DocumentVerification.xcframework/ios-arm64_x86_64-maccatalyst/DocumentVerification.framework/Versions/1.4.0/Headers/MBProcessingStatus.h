//
//  MBProcessingStatus.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 10/08/2020.
//

#ifndef MBProcessingStatus_h
#define MBProcessingStatus_h

/**
* MDVProcessingStatus enum defines status of the last recognition process.
*/
typedef NS_ENUM(NSInteger, MDVProcessingStatus) {

    /** Recognition was successful. */
    MDVProcessingStatusSuccess,

    /** Detection of the document failed. */
    MDVProcessingStatusDetectionFailed,

    /** Preprocessing of the input image has failed. */
    MDVProcessingStatusImagePreprocessingFailed,

    /** Recognizer has inconsistent results. */
    MDVProcessingStatusStabilityTestFailed,

    /** Wrong side of the document has been scanned. */
    MDVProcessingStatusScanningWrongSide,

    /** Identification of the fields present on the document has failed. */
    MDVProcessingStatusFieldIdentificationFailed,

    /** Mandatory field for the specific document is missing. */
    MDVProcessingStatusMandatoryFieldMissing,

    /** Result contains invalid characters in some of the fields. */
    MDVProcessingStatusInvalidCharactersFound,

    /** Failed to return a requested image. */
    MDVProcessingStatusImageReturnFailed,

    /** Reading or parsing of the barcode has failed. */
    MDVProcessingStatusBarcodeRecognitionFailed,

    /** Parsing of the MRZ has failed. */
    MDVProcessingStatusMrzParsingFailed,

    /** Document class has been filtered out. */
    MDVProcessingStatusClassFiltered,

    /** Document currently not supported by the recognizer. */
    MDVProcessingStatusUnsupportedClass,

    /** License for the detected document is missing. */
    MDVProcessingStatusUnsupportedByLicense,
    
    /** Front side recognition has completed successfully, and recognizer is waiting for the other side to be scanned. */
    MDVProcessingStatusAwaitingOtherSide,
    
    /** Side not scanned. */
    MDVProcessingStatusNotScanned
};

#endif /* MBProcessingStatus_h */
