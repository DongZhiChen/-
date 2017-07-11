//
//  DZCellShowImage.h
//  test
//
//  Created by 陈东芝 on 17/3/6.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface DZCellShowImage : UICollectionViewCell <UIScrollViewDelegate> {

    UIScrollView *SV_ImageContent;
    
}

@property (nonatomic, retain) UIImageView *imageView;

-(void)setZoomConfigure;

@end
