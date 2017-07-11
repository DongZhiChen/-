//
//  DZCellShowImage.m
//  test
//
//  Created by 陈东芝 on 17/3/6.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import "DZCellShowImage.h"

@implementation DZCellShowImage

-(id)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        SV_ImageContent = [[UIScrollView alloc] initWithFrame:self.bounds];
        SV_ImageContent.delegate = self;
        [self addSubview:SV_ImageContent];
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.bounds)-100, CGRectGetWidth(self.bounds), 200)];
        [SV_ImageContent addSubview:_imageView];
        
    }
    
    return self;
    
}


-(void)setZoomConfigure{
    
    SV_ImageContent.zoomScale = 1.0;
    CGRect frame = SV_ImageContent.frame;
    
    if (self.imageView.image) {
        
        CGSize imageSize = self.imageView.image.size;//获得图片的size
        CGRect imageFrame = CGRectMake(0, 0, imageSize.width, imageSize.height);
        
        if (frame.size.width<=frame.size.height) {
            //竖屏时候
            CGFloat ratio = frame.size.width/imageFrame.size.width;
            imageFrame.size.height = imageFrame.size.height*ratio;
            imageFrame.size.width = frame.size.width;
        }else{ //横屏的时候
            CGFloat ratio = frame.size.height/imageFrame.size.height;
            imageFrame.size.width = imageFrame.size.width*ratio;
            imageFrame.size.height = frame.size.height;
        }
        
        self.imageView.frame = imageFrame;
        
        SV_ImageContent.contentSize = self.imageView.frame.size;
        
        self.imageView.center = [self centerOfScrollViewContent:SV_ImageContent];
        
        //根据图片大小找到最大缩放等级，保证最大缩放时候，不会有黑边
        CGFloat maxScale = frame.size.height/imageFrame.size.height;
        maxScale = frame.size.width/imageFrame.size.width>maxScale?frame.size.width/imageFrame.size.width:maxScale;
        //超过了设置的最大的才算数
        maxScale = maxScale>2.0?maxScale:2.0;
        //初始化
        SV_ImageContent.minimumZoomScale = 0.6;
        SV_ImageContent.maximumZoomScale = maxScale;
        SV_ImageContent.zoomScale = 1.0f;
    }

}


- (CGPoint)centerOfScrollViewContent:(UIScrollView *)scrollView {
    
    CGFloat offsetX = (scrollView.bounds.size.width > scrollView.contentSize.width)?(scrollView.bounds.size.width - scrollView.contentSize.width)/2 : 0.0;

    CGFloat offsetY = (scrollView.bounds.size.height > scrollView.contentSize.height)?(scrollView.bounds.size.height - scrollView.contentSize.height)/2 : 0.0;

    CGPoint actualCenter = CGPointMake(scrollView.contentSize.width/2 + offsetX,scrollView.contentSize.height/2 + offsetY);
    
    return actualCenter;
    
}

#pragma mark - UIScrollViewDelegate -

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.imageView;
    
}

//让图偏居中
- (void)scrollViewDidZoom:(UIScrollView *)scrollView{
    
    self.imageView.center = [self centerOfScrollViewContent:scrollView];
    
    SV_ImageContent.contentSize=self.imageView.frame.size;
    
}


@end
