//
//  C.m
//  yash
//
//  Created by Harshit Kushwah on 20/08/24.
//

#import <Foundation/Foundation.h>

struct CNetworkResponse {
    int statusCode;
    char *headers;
    char *body;
    int bodyLength;
};

typedef struct CNetworkResponse CNetworkResponse;

CNetworkResponse send_request_interop(const char *body, const char *headers, const char *url,
                                      const char *method, int length);
