//
//  CollectionViewDataSource.h
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 11/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CollectionViewDataSource : NSObject
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                 componentMappingBlock:(id (^)(id model))block;
- (CGSize)sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
- (void)announceWillAppearForItemInCell:(UICollectionViewCell *)cell;
- (void)announceDidDisappearForItemInCell:(UICollectionViewCell *)cell;
- (void)displayObjects:(NSArray *)objects;
- (id)modelForItemAtIndexPath:(NSIndexPath *)indexPath;
@end
