//
//  IDNetworkClient.m
//  tmdb-ios
//
//  Created by Ivan Almada on 10/12/24.
//

#import "IDNetworkClient.h"
#import "IDConstants.h"
#import "IDTVShow.h"

static NSString *const kAPIKey = IDAPIKey;
static NSString *const kAccessToken = IDAPIKeyAccessToken;
static NSString *const kBaseURL = @"https://api.themoviedb.org/3/";

@implementation IDNetworkClient

+ (instancetype)sharedInstance {
    static IDNetworkClient *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[IDNetworkClient alloc] init];
    });
    return sharedInstance;
}

- (void)fetchPopularTVShowsWithCompletion:(PopularTVShowsCompletion)completion {

    NSString *popularTVURL = [kBaseURL stringByAppendingString:@"tv/popular?language=en-US&page=1"];

    NSString *auth = [NSString stringWithFormat:@"Bearer %@", kAccessToken];

    NSDictionary *headers = @{ @"accept": @"application/json",
                               @"Authorization":  auth};

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:popularTVURL]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];

    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];

    NSURLComponents *components = [NSURLComponents componentsWithString:popularTVURL];
    NSURLQueryItem *apiKeyItem = [NSURLQueryItem queryItemWithName:@"api_key" value:kAPIKey];

    components.queryItems = @[apiKeyItem];
    NSURL *url = components.URL;

    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            completion(nil, error);
            return;
        }

        NSError *jsonError = nil;
        NSDictionary *jsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];

        if (jsonError) {
            completion(nil, jsonError);
            return;
        }

        NSArray *tvShowsDict = jsonResponse[@"results"];

        NSMutableArray *tvShows = @[].mutableCopy;

        for (NSDictionary *dict in tvShowsDict) {
            IDTVShow *tvShow = [[IDTVShow alloc] initWithDictionary:dict];
            [tvShows addObject:tvShow];
        }

        completion(tvShows, nil);
    }];
    
    [task resume];
}

@end
