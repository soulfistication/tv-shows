//
//  IDMovies.h
//  tmdb-ios
//
//  Created by Ivan Almada on 10/12/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface IDTVShow : NSObject

@property (nonatomic, assign) BOOL adult;
@property (nonatomic, strong) NSString *backdropPath;
@property (nonatomic, strong) NSString *firstAirDate;
@property (nonatomic, strong) NSArray<NSNumber *> *genreIds;
@property (nonatomic, assign) NSInteger identifier;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *originCountry;
@property (nonatomic, strong) NSString *originalLanguage;
@property (nonatomic, strong) NSString *originalName;
@property (nonatomic, strong) NSString *overview;
@property (nonatomic, assign) double popularity;
@property (nonatomic, strong) NSString *posterPath;
@property (nonatomic, assign) double voteAverage;
@property (nonatomic, assign) NSInteger voteCount;

#pragma mark - Inits
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
