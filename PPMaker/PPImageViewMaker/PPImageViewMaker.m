//
//  PPImageViewMaker.m
//  PPDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/5/7.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPImageViewMaker.h"
#import "PPMaker.h"

@interface PPImageViewMaker ()
/** 要创建的imageView */
@property(nonatomic,strong) UIImageView *creatingImageView;
@end

@implementation PPImageViewMaker
-(instancetype)init
{
    self = [super init];
    if (self) {
        PPMakerWeakSelf(self)
        //父视图
        _intoView = ^PPImageViewMaker *(UIView *superV){
            PPMakerStrongSelf(self)
            if (superV) {
                [superV addSubview:self.creatingImageView];
            }
            return self;
        };
        
        //frame
        _frame = ^PPImageViewMaker *(CGRect frame){
            PPMakerStrongSelf(self)
            self.creatingImageView.frame = frame;
            return self;
        };
        
        //imageName
        _imageName = ^PPImageViewMaker *(NSString *imageName){
            PPMakerStrongSelf(self)
            if (imageName && imageName.length > 0) {
                self.creatingImageView.image = [UIImage imageNamed:imageName];
            }
            return self;
        };
    }
    return self;
}
+(UIImageView *)pp_imageViewMake:(void (^)(PPImageViewMaker *))make
{
    PPImageViewMaker *imgViewMaker = [[PPImageViewMaker alloc]init];
    if (make) {
        make(imgViewMaker);
    }
    return imgViewMaker.creatingImageView;
}
-(UIImageView *)creatingImageView
{
    if (!_creatingImageView) {
        _creatingImageView = [[UIImageView alloc]init];
        _creatingImageView.contentMode = UIViewContentModeScaleToFill;
    }
    return _creatingImageView;
}
@end
