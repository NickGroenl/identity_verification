//
//  MBFullDocumentImageResult.h
//  MicroblinkDev
//
//  Created by DoDo on 16/04/2018.
//

#ifndef MBFullDocumentImageResult_h
#define MBFullDocumentImageResult_h

#import "MBImage.h"

@protocol MDVFullDocumentImageResult

@required

/**
 * full document image if enabled with `MDVFullDocumentImage returnFullDocumentImage` property.
 */
@property (nonatomic, readonly, nullable) MDVImage* fullDocumentImage;

@end

#endif /* MBFullDocumentImageResult_h */
