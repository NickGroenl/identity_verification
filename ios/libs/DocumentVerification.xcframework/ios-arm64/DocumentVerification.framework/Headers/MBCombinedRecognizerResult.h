//
//  MBCombinedRecognizerResult.h
//  MicroblinkDev
//
//  Created by DoDo on 17/05/2018.
//

#ifndef MBCombinedRecognizerResult_h
#define MBCombinedRecognizerResult_h

/**
* Result of the data matching algorithm for scanned parts/sides of the document.
**/
typedef NS_ENUM(NSInteger, MDVDataMatchResult) {
    /** Data matching has not been performed. */
    MDVDataMatchResultNotPerformed = 0,
    /** Data does not match. */
    MDVDataMatchResultFailed,
    /** Data match. */
    MDVDataMatchResultSuccess
};

@protocol MDVCombinedRecognizerResult

@required

/**
 * Returns YES if recognizer has finished scanning first side and is now scanning back side,
 * NO if it's still scanning first side.
 */
@property (nonatomic, readonly, assign) BOOL scanningFirstSideDone;

@optional
/**
 * Returns MDVDataMatchResultSuccess if data from scanned parts/sides of the document match,
 * MDVDataMatchResultFailed otherwise. For example if date of expiry is scanned from the front and back side
 * of the document and values do not match, this method will return MDVDataMatchResultFailed. Result will
 * be MDVDataMatchResultSuccess only if scanned values for all fields that are compared are the same.
 */
@property (nonatomic, readonly, assign) MDVDataMatchResult documentDataMatch;

@end

#endif /* MBCombinedRecognizerResult_h */
