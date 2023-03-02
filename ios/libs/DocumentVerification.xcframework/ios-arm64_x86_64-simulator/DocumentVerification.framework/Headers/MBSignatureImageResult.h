//
//  MBSignatureImageResult.h
//  MicroblinkDev
//
//  Created by DoDo on 16/04/2018.
//

#ifndef MBSignatureImageResult_h
#define MBSignatureImageResult_h

#import "MBImage.h"

@protocol MDVSignatureImageResult

@required

/**
 * image of the signature if enabled with `MDVSignatureImage returnSignatureImage` property.
 */
@property (nonatomic, readonly, nullable) MDVImage* signatureImage;

@end

#endif /* MBSignatureImageResult_h */
