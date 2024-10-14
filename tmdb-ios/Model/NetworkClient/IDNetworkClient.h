//
//  IDNetworkClient.h
//  tmdb-ios
//
//  Created by Ivan Almada on 10/12/24.
//

#import <Foundation/Foundation.h>

@class IDTVShow;

NS_ASSUME_NONNULL_BEGIN

typedef void (^PopularTVShowsCompletion)(NSArray<IDTVShow *> * _Nullable shows, NSError * _Nullable error);

@interface IDNetworkClient : NSObject

+ (instancetype)sharedInstance;
- (void)fetchPopularTVShowsWithCompletion:(PopularTVShowsCompletion)completion;

@end

NS_ASSUME_NONNULL_END
