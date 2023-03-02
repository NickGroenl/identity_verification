//
//  MBRecognitionMode.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 11/08/2020.
//

#ifndef MBRecognitionMode_h
#define MBRecognitionMode_h

/**
* MDVRecognitionMode enum defines possible recognition modes by BlinkID(Combined)Recognizer.
*/
typedef NS_ENUM(NSInteger, MDVRecognitionMode) {

    /** No recognition performed. */
    MDVRecognitionModeNone,

    /** Recognition of mrz document (does not include visa and passport) */
    MDVRecognitionModeMrzId,

    /** Recognition of visa mrz. */
    MDVRecognitionModeMrzVisa,

    /** Recognition of passport mrz. */
    MDVRecognitionModeMrzPassport,

    /** Recognition of documents that have face photo on the front. */
    MDVRecognitionModePhotoId,

    /** Detailed document recognition. */
    MDVRecognitionModeFullRecognition,
    
    /** Recognition of barcode document. */
    MDVRecognitionModeBarcodeId
};

#endif /* MBRecognitionMode_h */
