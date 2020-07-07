//
//  PPDeviceAlert.h
//  Peoplepower
//
//  Created by Destry Teeter on 3/17/18.
//  Copyright © 2020 People Power Company. All rights reserved.
//

#import "PPBaseModel.h"

typedef NS_OPTIONS(NSInteger, PPDeviceAlertCount) {
    PPDeviceAlertCountNone = -1,
};

@interface PPDeviceAlert : RLMObject

@property (nonatomic, strong) NSString *alertType;
@property (nonatomic) PPDeviceAlertCount count;

- (id)initWithType:(NSString *)alertType count:(PPDeviceAlertCount)count;

+ (PPDeviceAlert *)initWithDictionary:(NSDictionary *)alertDict;

@end

RLM_ARRAY_TYPE(PPDeviceAlert);