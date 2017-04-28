

#import <UIKit/UIKit.h>
@class ZLPhotoAssets;
@interface UIImage (dealWithImage)
/*图片压缩*/
-(NSData *)compactImage;
-(UIImage *)dealWithImage;
+(UIImage*) createImageWithColor:(UIColor*) color;


/**
 活动gif  imagedata

 @param photo photo description
 @return return value description
 */
+(NSData *)getGifImageDataWith:(ZLPhotoAssets*)photo;

@end
