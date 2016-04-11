//
//  DataSource.h
//  ListOfHotels
//
//  Created by Tomasz Kuzma on 08/04/2016.
//  Copyright © 2016 Expedia. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HotelFetcher;

NS_ASSUME_NONNULL_BEGIN
@class UICollectionView;
@interface DataSource : NSObject
- (instancetype)initWithCollectionView:(UICollectionView *)collectionView
                          hotelFetcher:(HotelFetcher *)hotelFetcher;
- (void)reload;
@end
NS_ASSUME_NONNULL_END