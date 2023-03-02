//
//  MBFullDocumentImageExtensionFactors.h
//  MicroblinkDev
//
//  Created by Dino on 19/06/2018.
//

#import "MBImageExtensionFactors.h"

@protocol MDVFullDocumentImageExtensionFactors

@required

/**
 * Image extension factors for full document image.
 *
 * @see MDVImageExtensionFactors
 * Default: {0.0f, 0.0f, 0.0f, 0.0f}
 */
@property (nonatomic, assign) MDVImageExtensionFactors fullDocumentImageExtensionFactors;

@end
