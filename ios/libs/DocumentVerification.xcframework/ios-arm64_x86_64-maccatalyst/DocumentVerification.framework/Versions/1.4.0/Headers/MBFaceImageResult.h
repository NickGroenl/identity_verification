//
//  MBFaceImageResult.h
//  MicroblinkDev
//
//  Created by DoDo on 16/04/2018.
//

#ifndef MBFaceImageResult_h
#define MBFaceImageResult_h

#import "MBImage.h"

@protocol MDVFaceImageResult

@required

/**
 * face image from the document if enabled with `MDVFaceImage returnFaceImage` property.
 */
@property (nonatomic, readonly, nullable) MDVImage* faceImage;

@end

#endif /* MBFaceImageResult_h */
