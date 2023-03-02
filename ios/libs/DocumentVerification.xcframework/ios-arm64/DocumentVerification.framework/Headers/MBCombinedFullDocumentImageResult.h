//
//  MBCombinedFullDocumentImageResult.h
//  MicroblinkDev
//
//  Created by DoDo on 17/05/2018.
//

#ifndef MBCombinedFullDocumentImageResult_h
#define MBCombinedFullDocumentImageResult_h

#import "MBImage.h"

@protocol MDVCombinedFullDocumentImageResult

@required

/**
 * front side image of the document if enabled with `MDVFullDocumentImage returnFullDocumentImage` property.
 */
@property (nonatomic, readonly, nullable) MDVImage* fullDocumentFrontImage;

/**
 * back side image of the document if enabled with `MDVFullDocumentImage returnFullDocumentImage` property.
 */
@property (nonatomic, readonly, nullable) MDVImage* fullDocumentBackImage;

@end

#endif /* MBCombinedFullDocumentImageResult_h */
