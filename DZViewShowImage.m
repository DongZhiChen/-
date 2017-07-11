//
//  DZViewShowImage.m
//  test
//
//  Created by 陈东芝 on 17/3/6.
//  Copyright © 2017年 陈东芝. All rights reserved.
//

#import "DZViewShowImage.h"

static NSString *cellID = @"DZCellShowImage";

@implementation DZViewShowImage

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
    
        [self addSubview:self.CV_ShowImage];
        
    }
    
    return self;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return self.arrayPictures.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    DZCellShowImage *cell=[collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
    DZCellShowImage *cellShowImage = (DZCellShowImage *)cell;
    
    [cellShowImage.imageView sd_setImageWithURL:self.arrayPictures[indexPath.row] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        [cellShowImage setZoomConfigure];
        
    }];
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

//设置cell Size
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return  self.bounds.size;
    
}



- (UICollectionView *)CV_ShowImage{

    if (_CV_ShowImage == nil) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _CV_ShowImage = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _CV_ShowImage.delegate=self;
        _CV_ShowImage.dataSource=self;
        [_CV_ShowImage registerClass:[DZCellShowImage class] forCellWithReuseIdentifier:cellID];
        
    }

    return _CV_ShowImage;
    
}

- (void)setArrayPictures:(NSArray *)arrayPictures {

    _arrayPictures = arrayPictures;
    [_CV_ShowImage reloadData];
    
}
@end
