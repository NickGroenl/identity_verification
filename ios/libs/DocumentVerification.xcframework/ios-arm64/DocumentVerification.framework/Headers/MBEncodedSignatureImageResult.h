//
//  MBEncodedSignatureImageResult.h
//  MicroblinkDev
//
//  Created by DoDo on 17/05/2018.
//

#ifndef MBEncodedSignatureImageResult_h
#define MBEncodedSignatureImageResult_h

@protocol MDVEncodedSignatureImageResult

@required

/**
 * JPEG-encoded image of the signature from the document. Available only if enabled with `MDVEncodeSignatureImage encodeSignatureImage` property.
 */
@property (nonatomic, readonly, nullable) NSData* encodedSignatureImage;

@end

#endif /* MBEncodedSignatureImageResult_h */
