//
//  DZViewShowImage.h
//  test
//
//  Created by 陈东芝 on 17/3/6.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZCellShowImage.h"


@interface DZViewShowImage : UIView <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, retain) UICollectionView *CV_ShowImage;
@property (nonatomic,strong) NSArray *arrayPictures;

@end
