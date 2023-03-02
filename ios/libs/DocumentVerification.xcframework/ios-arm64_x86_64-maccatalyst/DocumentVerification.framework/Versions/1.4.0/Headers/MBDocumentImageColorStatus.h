//
//  MBDocumentImageColorStatus.h
//  MicroblinkDev
//
//  Created by Jura Skrlec on 21/04/2020.
//

#ifndef MBDocumentImageColorStatus_h
#define MBDocumentImageColorStatus_h

/**
* DocumentImageColorStatus enum defines possible color statuses determined from scanned image.
*/
typedef NS_ENUM(NSInteger, MDVDocumentImageColorStatus) {

    // Determining image color status was not performed
    MDVDocumentImageColorStatusNotAvailable = 0,

    // Black-and-white image scanned
    MDVDocumentImageColorStatusBlackAndWhite,

    // Color image scanned
    MDVDocumentImageColorStatusColor
};

#endif /* MBDocumentImageColorStatus_h */
