//
//  IDMovies.m
//  tmdb-ios
//
//  Created by Ivan Almada on 10/12/24.
//

#import "IDTVShow.h"

@implementation IDTVShow

#pragma mark - Inits

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];

    if (self) {
        NSNumber *adult = dict[@"adult"];
        _adult = adult.boolValue;
        _firstAirDate = dict[@"first_air_date"];
        _backdropPath = dict[@"backdrop_path"];
        _genreIds = dict[@"genre_ids"];
        NSNumber *identifier = dict[@"id"];
        _identifier = identifier.integerValue;
        _name = dict[@"name"];
        _originCountry = dict[@"origin_country"];
        _originalLanguage = dict[@"original_language"];
        _originalName = dict[@"original_name"];
        _overview = dict[@"overview"];
        NSNumber *popularity = dict[@"popularity"];
        _popularity = popularity.doubleValue;
        _posterPath = dict[@"poster_path"];
        NSNumber *voteAverage = dict[@"vote_average"];
        _voteAverage = voteAverage.doubleValue;
        NSNumber *voteCount = dict[@"vote_count"];
        _voteCount = voteCount.integerValue;
    }

    return self;
}

- (NSString *)description {
    return [@"Show title: " stringByAppendingString: self.originalName];
}

@end
