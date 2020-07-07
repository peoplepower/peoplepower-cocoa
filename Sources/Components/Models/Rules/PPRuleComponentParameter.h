//
//  PPRuleComponentParameter.h
//  Peoplepower
//
//  Created by Destry Teeter on 3/12/18.
//  Copyright © 2020 People Power Company. All rights reserved.
//

#import "PPBaseModel.h"
#import "PPRuleComponentParameterValue.h"

typedef NS_OPTIONS(NSInteger, PPRuleComponentParameterCategory) {
    PPRuleComponentParameterCategoryNone = -1,
    PPRuleComponentParameterCategoryUserInputRequired = 1, // This parameter in a rule phrase requires some user input to define
    PPRuleComponentParameterCategoryCronExpression = 2, // This parameter will fire periodically, based on a cron job
    PPRuleComponentParameterCategoryLocationID = 4, // This parameter requires the user to specify a location
    PPRuleComponentParameterCategoryDeviceID = 5, // This parameter requires a device
    PPRuleComponentParameterCategoryIndex = 6, // This parameter requires the user to specify a part of a device (i.e. Socket 0, Socket 1, Socket 2, etc.)
    PPRuleComponentParameterCategoryTime = 7, // This parameter fires at a specific time
    PPRuleComponentParameterCategoryDayOfWeek = 8, // This parameter fires on certain days
    PPRuleComponentParameterCategoryLocationEvent = 9, // Location event, such as 'HOME', 'AWAY', etc.
    PPRuleComponentParameterCategoryNotificationText = 10, // This parameter requires the notification text to send to the user, which is generated by the UI with optional help from the individual rule phrases.
    PPRuleComponentParameterCategoryParameterName = 11, // Specify a parameter name from the device
    PPRuleComponentParameterCategoryPropertyName = 12, // Specify a property name from the device
    PPRuleComponentParameterCategoryEnumeration = 13, // A list of id/name pairs
    PPRuleComponentParameterCategoryAppName = 14, // Application name
    PPRuleComponentParameterCategorySelectingEnumeration = 15, // A list of id/name pairs selecting by other parameter value
};

typedef NS_OPTIONS(NSInteger, PPRuleComponentParameterInputType) {
    PPRuleComponentParameterInputTypeNone = -1,
    PPRuleComponentParameterInputTypeInteger = 1, // Present the user input as an integer
    PPRuleComponentParameterInputTypeFloat = 2, // Present the user input as a float
};

typedef NS_OPTIONS(NSInteger, PPRuleComponentParameterOptional) {
    PPRuleComponentParameterOptionalNone = -1,
    PPRuleComponentParameterOptionalFalse = 0,
    PPRuleComponentParameterOptionalTrue = 1,
};

typedef NS_OPTIONS(NSInteger, PPRuleComponentParameterMinValue) {
    PPRuleComponentParameterMinValueNone = -1,
};

typedef NS_OPTIONS(NSInteger, PPRuleComponentParameterMaxValue) {
    PPRuleComponentParameterMaxValueNone = -1,
};

@interface PPRuleComponentParameter : PPBaseModel <NSCopying>

/* A descriptive name of the parameter, from the developer. Usually not displayed to the user. */
@property (nonatomic, strong) NSString *name;

/* See the parameter categories table above, for the type of input that is required. */
@property (nonatomic) PPRuleComponentParameterCategory category;

/* When 'true', this parameter is optional to fill out. */
@property (nonatomic) PPRuleComponentParameterOptional optional;

/* A short user friendly question or brief instructions to display to the user that gets the user to correctly fill out the parameter. */
@property (nonatomic, strong) NSString *desc;

/* An object containing the possible values for the parameter, for example a list of devices and their nicknames that this rule phrase would apply to. */
@property (nonatomic, strong) RLMArray<PPRuleComponentParameterValue *><PPRuleComponentParameterValue> *values;

/* A name of other parameter used as a selector in id/name enumeration list. */
@property (nonatomic, strong) NSString *selectorName;

/* A default value for this parameter. */
@property (nonatomic, strong) PPRuleComponentParameterValue *value;

/* The minimum acceptable numeric value for this parameter, for UI sliders. */
@property (nonatomic) PPRuleComponentParameterMinValue minValue;

/* The maximum acceptable numeric value for this parameter, for UI sliders. */
@property (nonatomic) PPRuleComponentParameterMaxValue maxValue;

/* If specified, this value is integer (1) or float (2). */
@property (nonatomic) PPRuleComponentParameterInputType valueType;

/* Optional measure parameter unit (e.g. 'minute', 'hour', 'degrees C'). */
@property (nonatomic, strong) NSString *unit;

- (id)initWithName:(NSString *)name category:(PPRuleComponentParameterCategory)category optional:(PPRuleComponentParameterOptional)optional desc:(NSString *)desc values:(RLMArray *)values selectorName:(NSString *)selectorName value:(PPRuleComponentParameterValue *)value minValue:(PPRuleComponentParameterMinValue)minValue maxValue:(PPRuleComponentParameterMaxValue)maxValue valueType:(PPRuleComponentParameterInputType)valueType unit:(NSString *)unit;

+ (PPRuleComponentParameter *)initWithDictionary:(NSDictionary *)parameterDict;

+ (NSString *)stringify:(PPRuleComponentParameter *)parameter;
+ (NSDictionary *)data:(PPRuleComponentParameter *)parameter;

#pragma marker - Helper Methods

- (BOOL)isEqualToParameter:(PPRuleComponentParameter *)parameter;

- (void)sync:(PPRuleComponentParameter *)parameter;

@end
