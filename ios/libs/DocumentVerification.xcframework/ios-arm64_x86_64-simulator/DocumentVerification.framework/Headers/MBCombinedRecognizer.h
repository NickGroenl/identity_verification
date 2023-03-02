//
//  MBCombinedRecognizer.h
//  MicroblinkDev
//
//  Created by DoDo on 17/05/2018.
//

#ifndef MBCombinedRecognizer_h
#define MBCombinedRecognizer_h

@protocol MDVCombinedRecognizerResult;
@class MDVRecognizerResult;

@protocol MDVCombinedRecognizer

@required

/**
 * Combined result which is associated with this combined recognizer.
 */
@property (nonatomic, readonly) MDVRecognizerResult<MDVCombinedRecognizerResult>* combinedResult;

@end

#endif /* MBCombinedRecognizer_h */
