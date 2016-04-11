//
//  DataSource.m
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 08/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import "DataSource.h"
#import "CollectionViewDataSource.h"
#import "ListOfHotels-Swift.h"
@import UIKit;

@interface DataSource () <UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CollectionViewDataSource *dataSource;
@property (nonatomic, strong) HotelFetcher *hotelFetcher;
@end

@implementation DataSource
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                          hotelFetcher:(HotelFetcher *)hotelFetcher{
    self = [super init];
    if (self) {
        _collectionView = collectionView;
        _collectionView.delegate = self;
        _hotelFetcher = hotelFetcher;
        _dataSource = [[CollectionViewDataSource alloc] initWithCollectionView:_collectionView
                                                         componentMappingBlock:^id(id model) {
                                                             return nil;
                                                         }];
    }
    return self;
}

- (void)reload{
    __weak typeof(self) wself = self;
    [self.hotelFetcher fetchHotels:^(NSArray<Hotel *> * _Nullable hotels, NSError * _Nullable error) {
        [wself.dataSource displayObjects:hotels];
    }];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [_dataSource sizeForItemAtIndexPath:indexPath];
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_dataSource announceWillAppearForItemInCell:cell];
}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
    [_dataSource announceDidDisappearForItemInCell:cell];
}

@end
