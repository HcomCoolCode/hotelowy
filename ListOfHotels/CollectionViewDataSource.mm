//
//  CollectionViewDataSource.m
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 11/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import "CollectionViewDataSource.h"
#import <ComponentKit/ComponentKit.h>
#import "HotelComponent.h"
#import "ListOfHotels-Swift.h"

@interface CollectionViewDataSource (){
    BOOL didAddSectionZero;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) CKCollectionViewDataSource  *ckDataSource;
@property (nonatomic, strong) CKComponentFlexibleSizeRangeProvider *sizeRangeProvider;
@end

@implementation CollectionViewDataSource

- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                 componentMappingBlock:(id (^)(id model))block{
    self = [super init];
    if (self) {
        _collectionView = collectionView;
        _sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibleHeight];
        _ckDataSource = [[CKCollectionViewDataSource alloc] initWithCollectionView:collectionView
                                                       supplementaryViewDataSource:nil
                                                                 componentProvider:[self class]
                                                                           context:nil
                                                         cellConfigurationFunction:nil];
    }
    return self;
}

- (void)displayObjects:(NSArray *)objects{
    if (!didAddSectionZero) {
        didAddSectionZero = YES;
        
        
        CKArrayControllerSections sections;
        sections.insert(0);
        
        [_ckDataSource enqueueChangeset:{sections, {}} constrainedSize:{}];
    }
    
    __block CKArrayControllerInputItems items;
    
    [objects enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        items.insert([NSIndexPath indexPathForRow:idx inSection:0], obj);
    }];
    
    [_ckDataSource enqueueChangeset:{{}, items}
                    constrainedSize:[_sizeRangeProvider sizeRangeForBoundingSize:_collectionView.bounds.size]];
}

- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [_ckDataSource sizeForItemAtIndexPath:indexPath];
}
- (void)announceWillAppearForItemInCell:(UICollectionViewCell *)cell{
    [_ckDataSource announceWillAppearForItemInCell:cell];
}
- (void)announceDidDisappearForItemInCell:(UICollectionViewCell *)cell{
    [_ckDataSource announceDidDisappearForItemInCell:cell];
}

- (id)modelForItemAtIndexPath:(NSIndexPath *)indexPath{
    return [_ckDataSource modelForItemAtIndexPath:indexPath];
}

+ (CKComponent *)componentForModel:(id<NSObject>)model context:(id<NSObject>)context{
    NSAssert([model isKindOfClass:[Hotel class]], @"must of hotel class");
    return [HotelComponent newWithHotel:(Hotel *)model];
}
@end
