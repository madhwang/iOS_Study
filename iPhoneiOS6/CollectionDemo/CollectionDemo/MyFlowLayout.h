//
//  MyFlowLayout.h
//  CollectionDemo
//
//  Created by Neil Smyth on 9/26/12.
//  Copyright (c) 2012 Neil Smyth. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyFlowLayout : UICollectionViewFlowLayout
@property (strong, nonatomic) NSIndexPath *currentCellPath;
@property (nonatomic) CGPoint currentCellCenter;
@property (nonatomic) CGFloat currentCellScale;

@end
