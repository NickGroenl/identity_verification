//
//  MBQuadDetectorSubview.h
//  MicroblinkDev
//
//  Created by Dino Gustin on 02/05/2018.
//

#import "MBDisplayableQuadDetection.h"

/**
 * Protocol for processing MDVDisplayableQuadDetection. Subviews implementing this protocol process and draw quad on the screen (e.g. viewfinder drawing document outlining)
 */
@protocol MDVQuadDetectorSubview <NSObject>

/**
 * This method should be called when MDVDisplayableQuadDetection is obtained and quad need to be drawn/redrawn.
 */
- (void)detectionFinishedWithDisplayableQuad:(MDVDisplayableQuadDetection *)displayableQuadDetection;

/**
 * This method should be called when MDVDisplayableQuadDetection is obtained and quad need to be drawn/redrawn with camera preview zoom enabled by setting previewZoomScale property on cameraSettings.
 */
- (void)detectionFinishedWithDisplayableQuad:(MDVDisplayableQuadDetection *)displayableQuadDetection originalRectangle:(CGRect)originalRect relativeRectangle:(CGRect)relativeRectangle;

@end
