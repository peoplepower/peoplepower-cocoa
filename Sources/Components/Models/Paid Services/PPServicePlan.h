//
//  PPServicePlan.h
//  Peoplepower
//
//  Created by Destry Teeter on 3/12/18.
//  Copyright © 2020 People Power Company. All rights reserved.
//

#import "PPBaseModel.h"
#import "PPServicePlanPriceAmount.h"
#import "PPServicePlanSoftwareSubscription.h"

#pragma mark - PPServicePlan

@class PPServicePlanSoftwareSubscription;
@class PPServicePlanPrice;

typedef NS_OPTIONS(NSInteger, PPServicePlanId) {
    PPServicePlanIdNone = -1,
};

typedef NS_OPTIONS(NSInteger, PPServicePlanAvailable) {
    PPServicePlanAvailableNone = -1,
    PPServicePlanAvailableFalse = 0,
    PPServicePlanAvailableTrue = 1
};

typedef NS_OPTIONS(NSInteger, PPServicePlanSubscribed) {
    PPServicePlanSubscribedNone = -1,
    PPServicePlanSubscribedFalse = 0,
    PPServicePlanSubscribedTrue = 1
};

typedef NS_OPTIONS(NSInteger, PPServicePlanStatus) {
    PPServicePlanStatusNone = -2,
    PPServicePlanStatusInitial = -1,
    PPServicePlanStatusActive = 0,
    PPServicePlanStatusExpiredOrCanceled = 1
};

@interface PPServicePlan : PPBaseModel

/* ID of a specific service plan */
@property (nonatomic) PPServicePlanId planId;

/* Name of a specific service plan */
@property (nonatomic, strong) NSString *name;

/* Description of a specific service plan */
@property (nonatomic, strong) NSString *desc;

/* Whether or not this service plan is available to purchase */
@property (nonatomic) PPServicePlanAvailable available;

/* Whether or not this service plan is subscribed to */
@property (nonatomic) PPServicePlanSubscribed subscribed;

/* List of service plan ID's, where this plan can be upgraded */
@property (nonatomic, strong) RLMArray<RLMInt> *upgradableTo;

/* Set of available prices and options to purchase this service */
@property (nonatomic, strong) RLMArray<PPServicePlanPrice *><PPServicePlanPrice> *prices;

/* Existing subscriptions owned by the user. */
@property (nonatomic, strong) RLMArray<PPServicePlanSoftwareSubscription *><PPServicePlanSoftwareSubscription> *subscriptions;

- (id)initWithId:(PPServicePlanId)planId name:(NSString *)name desc:(NSString *)desc available:(PPServicePlanAvailable)available upgradableTo:(RLMArray *)upgradableTo prices:(RLMArray *)prices subscriptions:(RLMArray *)subscriptions;

+ (PPServicePlan *)initWithDictionary:(NSDictionary *)planDict;

#pragma mark - Helper Methods

- (BOOL)isEqualToPlan:(PPServicePlan *)plan;

- (void)sync:(PPServicePlan *)plan;

@end

#pragma mark - PPServicePlanSoftwareSubscription

typedef NS_OPTIONS(NSInteger, PPServicePlanSoftwareSubscriptionUserPlanId) {
    PPServicePlanSoftwareSubscriptionUserPlanIdNone = -1
};

typedef NS_OPTIONS(NSInteger, PPServicePlanSoftwareSubscriptionType) {
    PPServicePlanSoftwareSubscriptionTypeNone = -1,
    PPServicePlanSoftwareSubscriptionTypeOneTimePurchase = 1,
    PPServicePlanSoftwareSubscriptionTypeWeeklySubscription = 2,
    PPServicePlanSoftwareSubscriptionTypeMonthlySubscription = 3,
    PPServicePlanSoftwareSubscriptionTypeAnnualSubscription = 4,
};

typedef NS_OPTIONS(NSInteger, PPServicePlanSoftwareSubscriptionPaymentType) {
    PPServicePlanSoftwareSubscriptionPaymentTypeNone = 1,
    PPServicePlanSoftwareSubscriptionPaymentTypeManual = 0,
    PPServicePlanSoftwareSubscriptionPaymentTypeAppleInAppPurchase = 1,
    PPServicePlanSoftwareSubscriptionPaymentTypePaypal = 2,
    PPServicePlanSoftwareSubscriptionPaymentTypeBraintree = 3,
};

typedef NS_OPTIONS(NSInteger, PPServicePlanSoftwareSubscriptionFree) {
    PPServicePlanSoftwareSubscriptionFreeNone = -1,
    PPServicePlanSoftwareSubscriptionFreeFalse = 0,
    PPServicePlanSoftwareSubscriptionFreeTrue = 1
};

typedef NS_OPTIONS(NSInteger, PPServicePlanSoftwareSubscriptionDuration) {
    PPServicePlanSoftwareSubscriptionDurationNone = -1,
};

typedef NS_OPTIONS(NSInteger, PPServicePlanSoftwareSubscriptionSandbox) {
    PPServicePlanSoftwareSubscriptionSandboxNone = -1,
    PPServicePlanSoftwareSubscriptionSandboxFalse = 0,
    PPServicePlanSoftwareSubscriptionSandboxTrue = 1
};

@class PPServicePlanTransaction;

@interface PPServicePlanSoftwareSubscription : PPBaseModel


/* Subscription record ID */
@property (nonatomic) PPServicePlanSoftwareSubscriptionUserPlanId userPlanId;

/* Subscription type: */
@property (nonatomic) PPServicePlanSoftwareSubscriptionType type;

/* Payment type: */
@property (nonatomic) PPServicePlanSoftwareSubscriptionPaymentType paymentType;

/* Start date of the subscription */
@property (nonatomic, strong) NSDate *startDate;

/* End date of the subscription */
@property (nonatomic, strong) NSDate *endDate;

/* Payment gateway product ID of this subscription */
@property (nonatomic, strong) NSString *gatewayId;

/* 'true' if the payment made on a sandbox gateway */
@property (nonatomic) PPServicePlanSoftwareSubscriptionSandbox sandbox;

/* Duration of the subscription in days, if this is a Non-Renewable subscription that requires the IoT Software Suite to expire the subscription. */
@property (nonatomic) PPServicePlanSoftwareSubscriptionDuration duration;

/* 'true' if it is a free trial subscription */
@property (nonatomic) PPServicePlanSoftwareSubscriptionFree free;

/* Organization purchased this subscription for the user */
@property (nonatomic) PPOrganizationId organizationId;

/* Payment gateway product ID of this subscription */
@property (nonatomic, strong) NSString *subscriptionId;

/* Payment gateway product ID of this subscription */
@property (nonatomic, strong) NSString *transactionId;

/* Service Plan */
@property (nonatomic, strong) PPServicePlan *plan;

@property (nonatomic, strong) PPServicePlanTransaction *transaction;

- (id)initWithId:(PPServicePlanSoftwareSubscriptionUserPlanId)userPlanId type:(PPServicePlanSoftwareSubscriptionType)type paymentType:(PPServicePlanSoftwareSubscriptionPaymentType)paymentType startDate:(NSDate *)startDate endDate:(NSDate *)endDate gatewayId:(NSString *)gatewayId sandbox:(PPServicePlanSoftwareSubscriptionSandbox)sandbox duration:(PPServicePlanSoftwareSubscriptionDuration)duration free:(PPServicePlanSoftwareSubscriptionFree)free organizationId:(PPOrganizationId)organizationId subscriptionId:(NSString *)subscriptionId transactionId:(NSString *)transactionId plan:(PPServicePlan *)plan;

+ (PPServicePlanSoftwareSubscription *)initWithDictionary:(NSDictionary *)subscriptionDict;

@end

#pragma mark - PPServicePlanPrice

typedef NS_OPTIONS(NSInteger, PPServicePlanPriceId) {
    PPServicePlanPriceIdNone = -1,
};

@interface PPServicePlanPrice : PPBaseModel

/* ID of a plan price */
@property (nonatomic) PPServicePlanPriceId priceId;

/* Subscription type: */
@property (nonatomic) PPServicePlanSoftwareSubscriptionType type;

/* Payment type: */
@property (nonatomic) PPServicePlanSoftwareSubscriptionPaymentType paymentType;

/* 'true' if a limited free trial option is available. */
@property (nonatomic) PPServicePlanSoftwareSubscriptionFree free;

/* Duration of the subscription in days, if this is a Non-Renewable subscription that requires the IoT Software Suite to expire the subscription. */
@property (nonatomic) PPServicePlanSoftwareSubscriptionDuration duration;

/* Unique payment gateway product ID for the service plan, e.g. Apple store product ID or PayPal or BrainTree paln ID. You must create an identical product identifier in your iTunes Connect account so Apple can facilitate the sale. */
@property (nonatomic, strong) NSString *gatewayId;

/* Unique identifier for Apple App Store. */
@property (nonatomic, strong) NSString *appleStoreId;

/* Unique payment gateway sandbox product ID */
@property (nonatomic, strong) NSString *gatewaySandboxId;

/* Price amount currency code, symbol and value */
@property (nonatomic, strong) PPServicePlanPriceAmount *amount;

- (id)initWithId:(PPServicePlanPriceId)priceId type:(PPServicePlanSoftwareSubscriptionType)type paymentType:(PPServicePlanSoftwareSubscriptionPaymentType)paymentType free:(PPServicePlanSoftwareSubscriptionFree)free duration:(PPServicePlanSoftwareSubscriptionDuration)duration gatewayId:(NSString *)gatewayId appleStoreId:(NSString *)appleStoreId gatewaySandboxId:(NSString *)gatewaySandboxId amount:(PPServicePlanPriceAmount *)amount;

+ (PPServicePlanPrice *)initWithDictionary:(NSDictionary *)priceDict;

@end
