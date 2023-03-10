//
//  MBFullDocumentImageDpi.h
//  MicroblinkDev
//
//  Created by DoDo on 16/04/2018.
//

@protocol MDVFullDocumentImageDpi

@required

/**
 * Property for setting DPI for full document images
 * Valid ranges are [100,400]. Setting DPI out of valid ranges throws an exception
 *
 * Default: 250
 */
@property (nonatomic, assign) NSInteger fullDocumentImageDpi;

@end
