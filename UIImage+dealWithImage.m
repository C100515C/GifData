

#import "UIImage+dealWithImage.h"
#import "ZLPhotoAssets.h"

@implementation UIImage (dealWithImage)
+(NSData *)getGifImageDataWith:(ZLPhotoAssets*)photo{
    ALAsset *asset = photo.asset;
    ALAssetRepresentation *rep = [asset defaultRepresentation];
    Byte *imageBuffer = (Byte*)malloc(rep.size);
    NSUInteger bufferSize = [rep getBytes:imageBuffer fromOffset:0.0 length:rep.size error:nil];
    NSData *imageData = [NSData dataWithBytesNoCopy:imageBuffer length:bufferSize freeWhenDone:YES];
    return imageData;
}

/*图片压缩*/
-(NSData *)compactImage
{
    UIImage *newImage=self;
    NSData * data = UIImageJPEGRepresentation(newImage, 1);
    double a=500;
    double b=data.length/1024;
    double scale=a / b;
    NSData * newData = UIImageJPEGRepresentation(newImage, scale);
    return newData;
}

/*图片压缩*/
-(UIImage *)dealWithImage
{
    UIImage *newImage=self;
    //newImage=[self imageWithImage:image scaledToSize:CGSizeMake(626, 413)];
    NSData * data = UIImageJPEGRepresentation(newImage, 1);
    double a=100;
    double b=data.length/1024;
    double scale=a / b;
    NSData * newData = UIImageJPEGRepresentation(newImage, scale);
    newImage=[UIImage imageWithData:newData];
    return newImage;
}

//对图片尺寸进行压缩--

-(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize

{
    
    // Create a graphics image context
    
    UIGraphicsBeginImageContext(newSize);
    
    
    
    // Tell the old image to draw in this new context, with the desired
    
    // new size
    
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    
    
    
    // Get the new image from the context
    
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    
    
    // End the context
    
    UIGraphicsEndImageContext();
    
    
    
    // Return the new image.
    
    return newImage;
    
}

+(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

@end
