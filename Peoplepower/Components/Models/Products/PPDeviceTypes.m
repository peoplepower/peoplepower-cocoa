//
//  PPDeviceTypes.m
//  Peoplepower
//
//  Created by Destry Teeter on 3/13/18.
//  Copyright © 2020 People Power Company. All rights reserved.
//
// The IoT Software Suite allows developers to create and manage new products. Each product defines a category to help organize UI's and groups of devices.
// On the developer platform, only the creator of a product may see its existence. When the product is ready to move to a production the IoT Software Suite instance for commercial deployment, we migrate the product and parameter definitions to the production server.
// 

#import "PPDeviceTypes.h"
#import "PPCloudEngine.h"

@implementation PPDeviceTypes

#pragma mark - Session Management

#pragma mark Device types

/**
 * Shared deviceTypes across the entire application
 */
+ (NSArray *)sharedDeviceTypesForUser:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s", __PRETTY_FUNCTION__);
#endif
#endif
    RLMResults<PPDeviceType *> *sharedDeviceTypes = [PPDeviceType allObjects];
    
    NSMutableArray *sharedDeviceTypesArray = [[NSMutableArray alloc] initWithCapacity:[sharedDeviceTypes count]];
    NSMutableArray *deviceTypesArrayDebug = [[NSMutableArray alloc] initWithCapacity:0];
    for(PPDeviceType *deviceType in sharedDeviceTypes) {
        [sharedDeviceTypesArray addObject:deviceType];
        
        [deviceTypesArrayDebug addObject:@{@"typeId": @(deviceType.typeId)}];
    }
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s sharedDeviceTypes=%@", __PRETTY_FUNCTION__, deviceTypesArrayDebug);
#endif
#endif
    return sharedDeviceTypesArray;
}

/**
 * Add deviceTypes.
 * Add deviceTypes to local reference.
 *
 * @param deviceTypes NSArray Array of deviceTypes to add.
 * @param userId Required PPUserId User Id to associate these device type attributes with
 **/
+ (void)addDeviceTypes:(NSArray *)deviceTypes userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypes=%@", __PRETTY_FUNCTION__, deviceTypes);
#endif
#endif
    [[PPRealm defaultRealm] beginWriteTransaction];
    for(PPDeviceType *deviceType in deviceTypes) {
        [PPDeviceType createOrUpdateInDefaultRealmWithValue:deviceType];
    }
    [[PPRealm defaultRealm] commitWriteTransaction];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

/**
 * Remove deviceTypes.
 * Remove deviceTypes from local reference.
 *
 * @param deviceTypes NSArray Array of deviceTypes to remove.
 * @param userId Required PPUserId User Id to associate these device type attributes with
 **/
+ (void)removeDeviceTypes:(NSArray *)deviceTypes userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypes=%@", __PRETTY_FUNCTION__, deviceTypes);
#endif
#endif
    [[PPRealm defaultRealm] transactionWithBlock:^{
        for(PPDeviceType *deviceType in deviceTypes) {
            [[PPRealm defaultRealm] deleteObject:[PPDeviceType objectForPrimaryKey:@(deviceType.typeId)]];
        }
    }];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

#pragma mark Device type Attributes

/**
 * Shared device type attribtues across the entire application
 * @param userId Required PPUserId User Id to associate these device type attributes with
 */
+ (NSArray *)sharedDeviceTypeAttributesForUser:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s", __PRETTY_FUNCTION__);
#endif
#endif
    
    RLMResults<PPDeviceTypeAttribute *> *sharedDeviceTypeAttributes = [PPDeviceTypeAttribute allObjects];
    
    NSMutableArray *sharedDeviceTypeAttributesArray = [[NSMutableArray alloc] initWithCapacity:[sharedDeviceTypeAttributes count]];
    NSMutableArray *deviceTypeAttributesArrayDebug = [[NSMutableArray alloc] initWithCapacity:0];
    for(PPDeviceTypeAttribute *deviceTypeAttribute in sharedDeviceTypeAttributes) {
        [sharedDeviceTypeAttributesArray addObject:deviceTypeAttribute];
        
        [deviceTypeAttributesArrayDebug addObject:@{@"name": deviceTypeAttribute.name}];
    }

#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"%s sharedDeviceTypeAttributes=%@", __PRETTY_FUNCTION__, deviceTypeAttributesArrayDebug);
#endif
#endif
    return sharedDeviceTypeAttributesArray;
}

/**
 * Add deviceTypeAttributes.
 * Add deviceTypeAttributes to local reference.
 *
 * @param deviceTypeAttributes NSArray Array of deviceTypeAttributes to add.
 * @param userId Required PPUserId User Id to associate these device type attributes with
 **/
+ (void)addDeviceTypeAttributes:(NSArray *)deviceTypeAttributes userId:(PPUserId)userId {
    NSLog(@"> %s deviceTypeAttributes=%@", __PRETTY_FUNCTION__, deviceTypeAttributes);
    [[PPRealm defaultRealm] beginWriteTransaction];
    for(PPDeviceTypeAttribute *attribute in deviceTypeAttributes) {
        [[PPRealm defaultRealm] addObject:attribute];
    }
    [[PPRealm defaultRealm] commitWriteTransaction];
    NSLog(@"< %s", __PRETTY_FUNCTION__);
}

/**
 * Remove deviceTypeAttributes.
 * Remove deviceTypeAttributes from local reference.
 *
 * @param deviceTypeAttributes NSArray Array of deviceTypeAttributes to remove.
 * @param userId Required PPUserId User Id to associate these device type attributes with
 **/
+ (void)removeDeviceTypeAttributes:(NSArray *)deviceTypeAttributes userId:(PPUserId)userId {
    NSLog(@"> %s deviceTypeAttributes=%@", __PRETTY_FUNCTION__, deviceTypeAttributes);
    [[PPRealm defaultRealm] transactionWithBlock:^{
        [[PPRealm defaultRealm] deleteObjects:deviceTypeAttributes];
    }];
    NSLog(@"< %s", __PRETTY_FUNCTION__);
}

#pragma mark Device type Parameters

/**
 * Shared deviceTypeParameters across the entire application
 * @param userId Required PPUserId User Id to associate these device type attributes with
 */
+ (NSArray *)sharedDeviceTypeParametersForUser:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s", __PRETTY_FUNCTION__);
#endif
#endif
    RLMResults<PPDeviceTypeParameter *> *sharedDeviceTypeParameters = [PPDeviceTypeParameter allObjects];
    
    NSMutableArray *sharedDeviceTypeParametersArray = [[NSMutableArray alloc] initWithCapacity:[sharedDeviceTypeParameters count]];
    NSMutableArray *deviceTypeParametersArrayDebug = [[NSMutableArray alloc] initWithCapacity:0];
    for(PPDeviceTypeParameter *deviceTypeParameter in sharedDeviceTypeParameters) {
        [sharedDeviceTypeParametersArray addObject:deviceTypeParameter];
        
        [deviceTypeParametersArrayDebug addObject:@{@"name": deviceTypeParameter.name}];
    }
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s sharedDeviceTypeParameters=%@", __PRETTY_FUNCTION__, deviceTypeParametersArrayDebug);
#endif
#endif
    return sharedDeviceTypeParametersArray;
}
/**
 * Add deviceTypeParameters.
 * Add deviceTypeParameters to local reference.
 *
 * @param deviceTypeParameters NSArray Array of deviceTypeParameters to add.
 * @param userId Required PPUserId User Id to associate these device type attributes with
 **/
+ (void)addDeviceTypeParameters:(NSArray *)deviceTypeParameters userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeParameters=%@", __PRETTY_FUNCTION__, deviceTypeParameters);
#endif
#endif
    [[PPRealm defaultRealm] beginWriteTransaction];
    for(PPDeviceTypeParameter *deviceTypeParameter in deviceTypeParameters) {
        [PPDeviceTypeParameter createOrUpdateInDefaultRealmWithValue:deviceTypeParameter];
    }
    [[PPRealm defaultRealm] commitWriteTransaction];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}


/**
 * Remove deviceTypeParameters.
 * Remove deviceTypeParameters from local reference.
 *
 * @param deviceTypeParameters NSArray Array of deviceTypeParameters to remove.
 * @param userId Required PPUserId User Id to associate these device type attributes with
 **/
+ (void)removeDeviceTypeParameters:(NSArray *)deviceTypeParameters userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeParameters=%@", __PRETTY_FUNCTION__, deviceTypeParameters);
#endif
#endif
    [[PPRealm defaultRealm] transactionWithBlock:^{
        for(PPDeviceTypeParameter *deviceTypeParameter in deviceTypeParameters) {
            [[PPRealm defaultRealm] deleteObject:[PPDeviceTypeParameter objectForPrimaryKey:deviceTypeParameter.name]];
        }
    }];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

#pragma mark Device type Rule Component Templates

/**
 * Shared deviceTypeRuleComponentTemplates across the entire application
 */
+ (NSArray *)sharedDeviceTypeRuleComponentTemplatesForUser:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s", __PRETTY_FUNCTION__);
#endif
#endif
    
    RLMResults<PPDeviceTypeRuleComponentTemplate *> *sharedDeviceTypeRuleComponentTemplates = [PPDeviceTypeRuleComponentTemplate allObjects];
    
    NSMutableArray *sharedDeviceTypeRuleComponentTemplatesArray = [[NSMutableArray alloc] initWithCapacity:[sharedDeviceTypeRuleComponentTemplates count]];
    NSMutableArray *deviceTypeRuleComponentTemplatesArrayDebug = [[NSMutableArray alloc] initWithCapacity:0];
    for(PPDeviceTypeRuleComponentTemplate *deviceTypeRuleComponentTemplate in sharedDeviceTypeRuleComponentTemplates) {
        [sharedDeviceTypeRuleComponentTemplatesArray addObject:deviceTypeRuleComponentTemplate];
        
        [deviceTypeRuleComponentTemplatesArrayDebug addObject:@{@"componentTemplateId": @(deviceTypeRuleComponentTemplate.templateId)}];
    }
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s sharedDeviceTypeRuleComponentTemplates=%@", __PRETTY_FUNCTION__, deviceTypeRuleComponentTemplatesArrayDebug);
#endif
#endif
    return sharedDeviceTypeRuleComponentTemplatesArray;
}

/**
 * Add deviceTypeRuleComponentTemplates.
 * Add deviceTypeRuleComponentTemplates to local reference.
 *
 * @param deviceTypeRuleComponentTemplates NSArray Array of deviceTypeRuleComponentTemplates to add.
 * @param userId Required PPUserId User Id to associate these device typeGoals with
 **/
+ (void)addDeviceTypeRuleComponentTemplates:(NSArray *)deviceTypeRuleComponentTemplates userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeRuleComponentTemplates=%@", __PRETTY_FUNCTION__, deviceTypeRuleComponentTemplates);
    [[PPRealm defaultRealm] beginWriteTransaction];
    for(PPDeviceTypeRuleComponentTemplate *deviceTypeRuleComponentTemplate in deviceTypeRuleComponentTemplates) {
        [PPDeviceTypeRuleComponentTemplate createOrUpdateInDefaultRealmWithValue:deviceTypeRuleComponentTemplate];
    }
    [[PPRealm defaultRealm] commitWriteTransaction];
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

/**
 * Remove deviceTypeRuleComponentTemplates.
 * Remove deviceTypeRuleComponentTemplates from local reference.
 *
 * @param deviceTypeRuleComponentTemplates NSArray Array of deviceTypeRuleComponentTemplates to remove.
 * @param userId Required PPUserId User Id to associate these device typeGoals with
 **/
+ (void)removeDeviceTypeRuleComponentTemplates:(NSArray *)deviceTypeRuleComponentTemplates userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeRuleComponentTemplates=%@", __PRETTY_FUNCTION__, deviceTypeRuleComponentTemplates);
    [[PPRealm defaultRealm] transactionWithBlock:^{
        for(PPDeviceTypeRuleComponentTemplate *deviceTypeRuleComponentTemplate in deviceTypeRuleComponentTemplates) {
            [[PPRealm defaultRealm] deleteObject:[PPDeviceTypeRuleComponentTemplate objectForPrimaryKey:@(deviceTypeRuleComponentTemplate.templateId)]];
        }
    }];
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

#pragma mark Device type Goals

/**
 * Shared deviceTypeGoals across the entire application
 */
+ (RLMResults *)sharedDeviceTypeGoalsForUser:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s", __PRETTY_FUNCTION__);
#endif
#endif
    RLMResults<PPDeviceTypeGoal *> *sharedDeviceTypeGoals = [PPDeviceTypeGoal allObjects];
    
    NSMutableArray *sharedDeviceTypeGoalsArray = [[NSMutableArray alloc] initWithCapacity:[sharedDeviceTypeGoals count]];
    NSMutableArray *deviceTypeGoalsArrayDebug = [[NSMutableArray alloc] initWithCapacity:0];
    for(PPDeviceTypeGoal *deviceTypeGoal in sharedDeviceTypeGoals) {
        [sharedDeviceTypeGoalsArray addObject:deviceTypeGoal];
        
        [deviceTypeGoalsArrayDebug addObject:@{@"goalId": @(deviceTypeGoal.goalId)}];
    }
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
    return sharedDeviceTypeGoals;
}

/**
 * Add deviceTypeGoals.
 * Add deviceTypeGoals to local reference.
 *
 * @param deviceTypeGoals NSArray Array of deviceTypeGoals to add.
 * @param userId Required PPUserId User Id to associate these device typeGoals with
 **/
+ (void)addDeviceTypeGoals:(NSArray *)deviceTypeGoals userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeGoals=%@", __PRETTY_FUNCTION__, deviceTypeGoals);
#endif
#endif
    [[PPRealm defaultRealm] beginWriteTransaction];
    for(PPDeviceTypeGoal *deviceTypeGoal in deviceTypeGoals) {
        [PPDeviceTypeGoal createOrUpdateInDefaultRealmWithValue:deviceTypeGoal];
    }
    [[PPRealm defaultRealm] commitWriteTransaction];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

/**
 * Remove deviceTypeGoals.
 * Remove deviceTypeGoals from local reference.
 *
 * @param deviceTypeGoals NSArray Array of deviceTypeGoals to remove.
 * @param userId Required PPUserId User Id to associate these device typeGoals with
 **/
+ (void)removeDeviceTypeGoals:(NSArray *)deviceTypeGoals userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeGoals=%@", __PRETTY_FUNCTION__, deviceTypeGoals);
#endif
#endif
    [[PPRealm defaultRealm] transactionWithBlock:^{
        for(PPDeviceTypeGoal *deviceTypeGoal in deviceTypeGoals) {
            [[PPRealm defaultRealm] deleteObject:[PPDeviceTypeGoal objectForPrimaryKey:@(deviceTypeGoal.goalId)]];
        }
    }];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

#pragma mark Device type installation instructions

/**
 * Shared deviceTypeInstallationInstructions across the entire application
 */
+ (NSArray *)sharedDeviceTypeInstallationInstructionsForUser:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s", __PRETTY_FUNCTION__);
#endif
#endif
    
    RLMResults<PPDeviceTypeInstallationInstructions *> *sharedDeviceTypeInstallationInstructions = [PPDeviceTypeInstallationInstructions allObjects];
    
    NSMutableArray *sharedDeviceTypeInstallationInstructionsArray = [[NSMutableArray alloc] initWithCapacity:[sharedDeviceTypeInstallationInstructions count]];
    NSMutableArray *deviceTypeInstallationInstructionsArrayDebug = [[NSMutableArray alloc] initWithCapacity:0];
    for(PPDeviceTypeInstallationInstructions *deviceTypeInstallationInstruction in sharedDeviceTypeInstallationInstructions) {
        [sharedDeviceTypeInstallationInstructionsArray addObject:deviceTypeInstallationInstruction];
        
        [deviceTypeInstallationInstructionsArrayDebug addObject:@{@"goalId": @(deviceTypeInstallationInstruction.goalId)}];
    }
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s sharedDeviceTypeInstallationInstructions=%@", __PRETTY_FUNCTION__, deviceTypeInstallationInstructionsArrayDebug);
#endif
#endif
    return sharedDeviceTypeInstallationInstructionsArray;
}

/**
 * Add deviceTypeInstallationInstructions.
 * Add deviceTypeInstallationInstructions to local reference.
 *
 * @param deviceTypeInstallationInstructions NSArray Array of deviceTypeInstallationInstructions to add.
 * @param userId Required PPUserId User Id to associate these deviceTypeInstallationInstructions with
 **/
+ (void)addDeviceTypeInstallationInstructions:(NSArray *)deviceTypeInstallationInstructions userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeInstallationInstructions=%@", __PRETTY_FUNCTION__, deviceTypeInstallationInstructions);
    [[PPRealm defaultRealm] beginWriteTransaction];
    for(PPDeviceTypeInstallationInstructions *deviceTypeInstallationInstruction in deviceTypeInstallationInstructions) {
        [PPDeviceTypeInstallationInstructions createOrUpdateInDefaultRealmWithValue:deviceTypeInstallationInstruction];
    }
    [[PPRealm defaultRealm] commitWriteTransaction];
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

/**
 * Remove deviceTypeInstallationInstructions.
 * Remove deviceTypeInstallationInstructions from local reference.
 *
 * @param deviceTypeInstallationInstructions NSArray Array of deviceTypeInstallationInstructions to remove.
 * @param userId Required PPUserId User Id to associate these deviceTypeInstallationInstructions with
 **/
+ (void)removeDeviceTypeInstallationInstructions:(NSArray *)deviceTypeInstallationInstructions userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeInstallationInstructions=%@", __PRETTY_FUNCTION__, deviceTypeInstallationInstructions);
    [[PPRealm defaultRealm] transactionWithBlock:^{
        for(PPDeviceTypeInstallationInstructions *deviceTypeInstallationInstruction in deviceTypeInstallationInstructions) {
            [[PPRealm defaultRealm] deleteObject:[PPDeviceTypeInstallationInstructions objectForPrimaryKey:@(deviceTypeInstallationInstruction.goalId)]];
        }
    }];
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

#pragma mark Device type Media

/**
 * Shared device type media across the entire application
 */
+ (NSArray *)sharedDeviceTypeMediaForUser:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s", __PRETTY_FUNCTION__);
#endif
#endif
    RLMResults<PPDeviceTypeMedia *> *sharedDeviceTypeMedias = [PPDeviceTypeMedia allObjects];
    
    NSMutableArray *sharedDeviceTypeMediasArray = [[NSMutableArray alloc] initWithCapacity:[sharedDeviceTypeMedias count]];
    NSMutableArray *deviceTypeMediasArrayDebug = [[NSMutableArray alloc] initWithCapacity:0];
    for(PPDeviceTypeMedia *deviceTypeMedia in sharedDeviceTypeMedias) {
        [sharedDeviceTypeMediasArray addObject:deviceTypeMedia];
        
        [deviceTypeMediasArrayDebug addObject:@{@"appId": deviceTypeMedia.mediaId}];
    }
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s sharedDeviceTypeMedia=%@", __PRETTY_FUNCTION__, deviceTypeMediasArrayDebug);
#endif
#endif
    return sharedDeviceTypeMediasArray;
}

/**
 * Add device type media.
 * Add device type media to local reference.
 *
 * @param deviceTypeMedia NSArray Array of deviceTypeMedia to add.
 * @param userId Required PPUserId User Id to associate these device typeGoals with
 **/
+ (void)addDeviceTypeMedia:(NSArray *)deviceTypeMedia userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeMedia=%@", __PRETTY_FUNCTION__, deviceTypeMedia);
#endif
#endif
    [[PPRealm defaultRealm] beginWriteTransaction];
    for(PPDeviceTypeMedia *media in deviceTypeMedia) {
        [PPDeviceTypeMedia createOrUpdateInDefaultRealmWithValue:media];
    }
    [[PPRealm defaultRealm] commitWriteTransaction];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

/**
 * Remove device type media.
 * Remove device type media from local reference.
 *
 * @param deviceTypeMedia NSArray Array of deviceTypeMedia to remove.
 * @param userId Required PPUserId User Id to associate these device typeGoals with
 **/
+ (void)removeDeviceTypeMedia:(NSArray *)deviceTypeMedia userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeMedia=%@", __PRETTY_FUNCTION__, deviceTypeMedia);
#endif
#endif
    [[PPRealm defaultRealm] transactionWithBlock:^{
        for(PPDeviceTypeMedia *media in deviceTypeMedia) {
            [[PPRealm defaultRealm] deleteObject:[PPDeviceTypeMedia objectForPrimaryKey:media.mediaId]];
        }
    }];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

#pragma mark Device type model categories

/**
 * Shared device type model categories across the entire application
 */
+ (NSArray *)sharedDeviceTypeModelCategoriesForUser:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s", __PRETTY_FUNCTION__);
#endif
#endif
    RLMResults<PPDeviceTypeDeviceModelCategory *> *sharedDeviceTypeModelCategories = [PPDeviceTypeDeviceModelCategory allObjects];
    
    NSMutableArray *sharedDeviceTypeModelCategoriesArray = [[NSMutableArray alloc] initWithCapacity:[sharedDeviceTypeModelCategories count]];
    NSMutableArray *deviceTypeModelCategoriesArrayDebug = [[NSMutableArray alloc] initWithCapacity:0];
    for(PPDeviceTypeDeviceModelCategory *deviceTypeModelCategory in sharedDeviceTypeModelCategories) {
        [sharedDeviceTypeModelCategoriesArray addObject:deviceTypeModelCategory];
        
        [deviceTypeModelCategoriesArrayDebug addObject:@{@"categoryId": deviceTypeModelCategory.categoryId}];
    }
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s sharedDeviceTypeModelCategories=%@", __PRETTY_FUNCTION__, deviceTypeModelCategoriesArrayDebug);
#endif
#endif
    return sharedDeviceTypeModelCategoriesArray;
}

/**
 * Add device type model categories.
 * Add device type model categories to local reference.
 *
 * @param deviceTypeModelCategories NSArray Array of deviceTypeModelCategories to add.
 * @param userId Required PPUserId User Id to associate these deviceTypeModelCategories with.
 **/
+ (void)addDeviceTypeModelCategories:(NSArray *)deviceTypeModelCategories userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeModelCategories=%@", __PRETTY_FUNCTION__, deviceTypeModelCategories);
#endif
#endif
    [[PPRealm defaultRealm] beginWriteTransaction];
    for(PPDeviceTypeDeviceModelCategory *deviceTypeModelCategory in deviceTypeModelCategories) {
        [PPDeviceTypeDeviceModelCategory createOrUpdateInDefaultRealmWithValue:deviceTypeModelCategory];
    }
    [[PPRealm defaultRealm] commitWriteTransaction];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

/**
 * Remove device type model categories.
 * Remove device type model categories from local reference.
 *
 * @param deviceTypeModelCategories NSArray Array of deviceTypeModelCategories to remove.
 * @param userId Required PPUserId User Id to associate these deviceTypeModelCategories with.
 **/
+ (void)removeDeviceTypeModelCategories:(NSArray *)deviceTypeModelCategories userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeModelCategories=%@", __PRETTY_FUNCTION__, deviceTypeModelCategories);
#endif
#endif
    [[PPRealm defaultRealm] transactionWithBlock:^{
        for(PPDeviceTypeDeviceModelCategory *deviceTypeModelCategory in deviceTypeModelCategories) {
            [[PPRealm defaultRealm] deleteObject:[PPDeviceTypeDeviceModelCategory objectForPrimaryKey:deviceTypeModelCategory.categoryId]];
        }
    }];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

#pragma mark Device type Stories

/**
 * Shared deviceTypeStories across the entire application
 */
+ (NSArray *)sharedDeviceTypeStoriesForUser:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s", __PRETTY_FUNCTION__);
#endif
#endif
    RLMResults<PPDeviceTypeStory *> *sharedDeviceTypeStorys = [PPDeviceTypeStory allObjects];
    
    NSMutableArray *sharedDeviceTypeStorysArray = [[NSMutableArray alloc] initWithCapacity:[sharedDeviceTypeStorys count]];
    NSMutableArray *deviceTypeStoriesArrayDebug = [[NSMutableArray alloc] initWithCapacity:0];
    for(PPDeviceTypeStory *deviceTypeStory in sharedDeviceTypeStorys) {
        [sharedDeviceTypeStorysArray addObject:deviceTypeStory];
        
        [deviceTypeStoriesArrayDebug addObject:@{@"storyId": deviceTypeStory.storyId}];
    }
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s sharedDeviceTypeStories=%@", __PRETTY_FUNCTION__, deviceTypeStoriesArrayDebug);
#endif
#endif
    return sharedDeviceTypeStorysArray;
}

/**
 * Add deviceType Stories.
 * Add deviceType Stories to local reference.
 *
 * @param deviceTypeStories NSArray Array of deviceTypeStories to add.
 * @param userId Required PPUserId User Id to associate these deviceTypeStories with.
 **/
+ (void)addDeviceTypeStories:(NSArray *)deviceTypeStories userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeStories=%@", __PRETTY_FUNCTION__, deviceTypeStories);
#endif
#endif
    [[PPRealm defaultRealm] beginWriteTransaction];
    for(PPDeviceTypeStory *deviceTypeStory in deviceTypeStories) {
        [PPDeviceTypeStory createOrUpdateInDefaultRealmWithValue:deviceTypeStory];
    }
    [[PPRealm defaultRealm] commitWriteTransaction];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

/**
 * Remove deviceType Stories.
 * Remove deviceType Stories from local reference.
 *
 * @param deviceTypeStories NSArray Array of deviceTypeStories to remove.
 * @param userId Required PPUserId User Id to associate these deviceTypeStories with.
 **/
+ (void)removeDeviceTypeStories:(NSArray *)deviceTypeStories userId:(PPUserId)userId {
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"> %s deviceTypeStories=%@", __PRETTY_FUNCTION__, deviceTypeStories);
#endif
#endif
    [[PPRealm defaultRealm] transactionWithBlock:^{
        for(PPDeviceTypeStory *deviceTypeStory in deviceTypeStories) {
            [[PPRealm defaultRealm] deleteObject:[PPDeviceTypeStory objectForPrimaryKey:deviceTypeStory.storyId]];
        }
    }];
#ifdef DEBUG
#ifdef DEBUG_MODELS
    NSLog(@"< %s", __PRETTY_FUNCTION__);
#endif
#endif
}

#pragma mark - Supported Products

/**
 * Get supported products.
 * Product attributes are documented in the Supported Product Attributes API call.
 *
 * @param deviceTypeId PPDeviceTypeId Specific device type to look up details on
 * @param attrName NSString Return device types, which have an attribute with this name
 * @param attrValue NSString Also filter the response by the attribute value
 * @param own Boolean PPDeviceTypesOwn only products created by this user
 * @param simple Simple Return only product fields without user and attributes information
 * @param organizationId PPOrganizationId Return only device types related to the specific organization
 * @param callback PPDeviceTypesBlock Device types callback block
 **/
+ (void)getSupportedProducts:(PPDeviceTypeId)deviceTypeId attrName:(NSString *)attrName attrValue:(NSString *)attrValue own:(PPDeviceTypesOwn)own simple:(PPDeviceTypesSimple)simple organizationId:(PPOrganizationId)organizationId callback:(PPDeviceTypesBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"deviceTypes?"];


    if(deviceTypeId != PPDeviceTypeIdNone) {
        [requestString appendFormat:@"deviceTypeId=%li&", (long)deviceTypeId];
    }
    if(attrName) {
        [requestString appendFormat:@"attrName=%@&", attrName];
    }
    if(attrValue) {
        [requestString appendFormat:@"attrValue=%@&", attrValue];
    }
    if(own != PPDeviceTypesOwnNone) {
        [requestString appendFormat:@"own=%@&", (own) ? @"true" : @"false"];
    }
    if(simple != PPDeviceTypesSimpleNone) {
        [requestString appendFormat:@"simple=%@&", (simple) ? @"true" : @"false"];
    }
    if(organizationId != PPOrganizationIdNone) {
        [requestString appendFormat:@"organizationId=%li&", (long)organizationId];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getSupportedProducts()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            NSMutableArray *deviceTypes;
            
            if(!error) {
                deviceTypes = [[NSMutableArray alloc] initWithCapacity:0];
                for(NSDictionary *deviceTypeDict in [root objectForKey:@"deviceTypes"]) {
                    PPDeviceType *deviceType = [PPDeviceType initWithDictionary:deviceTypeDict];
                    [deviceTypes addObject:deviceType];
                }
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(deviceTypes, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Supported Product Attribtues

/**
 * Get supported product attributes.
 * Each product can have a set of attributes associated with it, to optimize its performance on the IoT Software Suite. This API will provide access to every supported attribute and attribute values.
 *
 * @param callback PPDeviceTypeAttributesBlock Attributes callback block
 **/
+ (void)getSupportedProductAttributes:(PPDeviceTypeAttributesBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"deviceTypeAttrs?"];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getSupportedProductAttribrutes()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            NSMutableArray *deviceTypeAttributes;
            
            if(!error) {
                deviceTypeAttributes = [[NSMutableArray alloc] initWithCapacity:0];
                for(NSDictionary *deviceTypeAttributeDict in [root objectForKey:@"deviceTypeAttributes"]) {
                    PPDeviceTypeAttribute *deviceTypeAttribute = [PPDeviceTypeAttribute initWithDictionary:deviceTypeAttributeDict];
                    [deviceTypeAttributes addObject:deviceTypeAttribute];
                }
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(deviceTypeAttributes, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Create a Product

/**
 * Creat a Product.
 * Each product / "device type" is created with a default name and a set of attributes to define the behavior of the product. See the Product Attributes API for more details on available attributes. For attributes, use the number '1' to indicate true, '0' to indicate false.
 *
 * @param deviceType required PPDeviceType Device type to create
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)createProduct:(PPDeviceType *)deviceType callback:(PPErrorBlock)callback {
    NSAssert1(deviceType != nil, @"%s missing deviceType", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"deviceType?"];

    NSMutableString *JSONString = [[NSMutableString alloc] init];
    [JSONString appendString:@"{"];
    [JSONString appendFormat:@"\"deviceType\": %@", [PPDeviceType stringify:deviceType]];
    [JSONString appendString:@"}"];

    NSError *error;
    NSMutableURLRequest *request = [[[PPCloudEngine sharedAppEngine] getRequestSerializer] requestWithMethod:@"POST" URLString:[NSURL URLWithString:requestString relativeToURL:[[PPCloudEngine sharedAppEngine] getBaseURL]].absoluteString parameters:nil error:&error];
    [request setHTTPBody:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.createProduct()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] operationWithRequest:request success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Update a Product

/**
 * Update a Product.
 * You must be the owner of the product in order to update it. For attributes, use the number '1' to indicate true, '0' to indicate false.
 *
 * @param deviceTypeId required PPDeviceTypeId The product ID / device type ID to update
 * @param deviceType required PPDeviceType Device type to update
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)updateProduct:(PPDeviceTypeId)deviceTypeId deviceType:(PPDeviceType *)deviceType callback:(PPErrorBlock)callback {
    NSAssert1(deviceTypeId != PPDeviceTypeIdNone, @"%s missing deviceTypeId", __FUNCTION__);
    NSAssert1(deviceType != nil, @"%s missing deviceType", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"deviceType/%li?", (long)deviceTypeId];

    NSMutableString *JSONString = [[NSMutableString alloc] init];
    [JSONString appendString:@"{"];
    [JSONString appendFormat:@"\"deviceType\": %@", [PPDeviceType stringify:deviceType]];
    [JSONString appendString:@"}"];

    NSError *error;
    NSMutableURLRequest *request = [[[PPCloudEngine sharedAppEngine] getRequestSerializer] requestWithMethod:@"PUT" URLString:[NSURL URLWithString:requestString relativeToURL:[[PPCloudEngine sharedAppEngine] getBaseURL]].absoluteString parameters:nil error:&error];
    [request setHTTPBody:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.updateProduct()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] operationWithRequest:request success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Manage Parameters

/**
 * Get Parameters.
 *
 * @param name NSString Get a specific parameter name (no spaces)
 * @param callback PPDeviceTypeDeviceParamsBlock Device params callback block
 **/
+ (void)getParameters:(NSString *)name callback:(PPDeviceTypeDeviceParamsBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"deviceParameters?"];
    if(name) {
        [requestString appendFormat:@"name=%@&", name];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getParameters()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            NSMutableArray *deviceTypeParameters;
            
            if(!error) {
                deviceTypeParameters = [[NSMutableArray alloc] initWithCapacity:0];
                for(NSDictionary *deviceTypeParameterDict in [root objectForKey:@"deviceParams"]) {
                    PPDeviceTypeParameter *deviceTypeParameter = [PPDeviceTypeParameter initWithDictionary:deviceTypeParameterDict];
                    [deviceTypeParameters addObject:deviceTypeParameter];
                }
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(deviceTypeParameters, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Create and Update a Parameter.
 * A normal developer can update only their own parameters. A system administrator can edit any parameter.
 *
 * @param deviceTypeParameter required PPDeviceTypeParameter Parameter to create or update
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)createAndUpdateParameter:(PPDeviceTypeParameter *)deviceTypeParameter callback:(PPErrorBlock)callback {
    NSAssert1(deviceTypeParameter != nil, @"%s missing deviceTypeParameter", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"deviceParameters?"];

    NSMutableString *JSONString = [[NSMutableString alloc] init];
    [JSONString appendString:@"{"];
    [JSONString appendFormat:@"\"deviceParam\": %@", [PPDeviceTypeParameter stringify:deviceTypeParameter]];
    [JSONString appendString:@"}"];

    NSError *error;
    NSMutableURLRequest *request = [[[PPCloudEngine sharedAppEngine] getRequestSerializer] requestWithMethod:@"POST" URLString:[NSURL URLWithString:requestString relativeToURL:[[PPCloudEngine sharedAppEngine] getBaseURL]].absoluteString parameters:nil error:&error];
    [request setHTTPBody:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.createAndUpdateParameter()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] operationWithRequest:request success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Delete a Parameter

/**
 * Delete a parameter.
 * A normal developer can delete only their own parameters. A system administrator can delete any parameter.
 *
 * @param parameterName required NSString Name of your parameter to delete
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)deleteParameter:(NSString *)parameterName callback:(PPErrorBlock)callback {
    NSAssert1(parameterName != nil, @"%s missing parameterName", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"deviceParameters/%@", parameterName];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.deleteParameter()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] DELETE:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Manage Rule Phrases

/**
 * Get existing rule phrases
 *
 * @param callback PPDeviceTypeRulePhrasesBlock Rule phrases callback block
 **/
+ (void)getExistingRulePhrases:(PPDeviceTypeRulePhrasesBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"ruleTemplates?"];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getExistingRulePhrases()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            NSMutableArray *ruleTemplates;
            
            if(!error) {
                ruleTemplates = [[NSMutableArray alloc] initWithCapacity:0];
                for(NSDictionary *ruleTemplateDict in [root objectForKey:@"ruleTemplates"]) {
                    PPDeviceTypeRuleComponentTemplate *ruleTemplate = [PPDeviceTypeRuleComponentTemplate initWithDictionary:ruleTemplateDict];
                    [ruleTemplates addObject:ruleTemplate];
                }
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(ruleTemplates, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Create a Rule Phrase.
 *
 * @param rulePhrase required PPDeviceTypeRuleComponentTemplate Template to create
 * @param callback PPDeviceTypeRulePhraseBlock Rule phrase block
 **/
+ (void)createRulePhrase:(PPDeviceTypeRuleComponentTemplate *)rulePhrase callback:(PPDeviceTypeRulePhraseBlock)callback {
    NSAssert1(rulePhrase != nil, @"%s missing rulePhrase", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"ruleTemplates?"];

    NSMutableString *JSONString = [[NSMutableString alloc] init];
    [JSONString appendString:@"{"];
    [JSONString appendFormat:@"\"ruleTemplate\": %@", [PPDeviceTypeRuleComponentTemplate stringify:rulePhrase]];
    [JSONString appendString:@"}"];

    NSError *error;
    NSMutableURLRequest *request = [[[PPCloudEngine sharedAppEngine] getRequestSerializer] requestWithMethod:@"POST" URLString:[NSURL URLWithString:requestString relativeToURL:[[PPCloudEngine sharedAppEngine] getBaseURL]].absoluteString parameters:nil error:&error];
    [request setHTTPBody:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.createRulePhrase()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] operationWithRequest:request success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPDeviceTypeRuleComponentTemplate *template;
            
            if(!error) {
                template = [PPDeviceTypeRuleComponentTemplate initWithDictionary:[root objectForKey:@"ruleTemplate"]];
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(template, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Rule Phrase

/**
 * Get the rule phrase by ID.
 *
 * @param templateId required PPDeviceTypeRuleComponentTemplateId The rule phrase template ID
 * @param callback PPDeviceTypeRulePhraseBlock Rule phrase block
 **/
+ (void)getRulePhraseById:(PPDeviceTypeRuleComponentTemplateId)templateId callback:(PPDeviceTypeRulePhraseBlock)callback {
    NSAssert1(templateId != PPDeviceTypeRuleComponentTemplateIdNone, @"%s missing templateId", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"ruleTemplates/%li", (long)templateId];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getRulePhraseById()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPDeviceTypeRuleComponentTemplate *ruleTemplate;
            
            if(!error) {
                ruleTemplate = [PPDeviceTypeRuleComponentTemplate initWithDictionary:[root objectForKey:@"ruleTemplate"]];
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(ruleTemplate, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Update Rule Phrase.
 *
 * @param templateId required PPDeviceTypeRuleComponentTemplateId The rule phrase template ID to update
 * @param rulePhrase required PPDeviceTypeRuleComponentTemplate Template to update
 * @param callback PPDeviceTypeRulePhraseBlock Rule phrase block
 **/
+ (void)updateRulePhrase:(PPDeviceTypeRuleComponentTemplateId)templateId rulePhrase:(PPDeviceTypeRuleComponentTemplate *)rulePhrase callback:(PPDeviceTypeRulePhraseBlock)callback {
    NSAssert1(templateId != PPDeviceTypeRuleComponentTemplateIdNone, @"%s missing templateId", __FUNCTION__);
    NSAssert1(rulePhrase != nil, @"%s missing rulePhrase", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"ruleTemplates/%li?", (long)templateId];

    NSMutableString *JSONString = [[NSMutableString alloc] init];
    [JSONString appendString:@"{"];
    [JSONString appendFormat:@"\"ruleTemplate\": %@", [PPDeviceTypeRuleComponentTemplate stringify:rulePhrase]];
    [JSONString appendString:@"}"];

    NSError *error;
    NSMutableURLRequest *request = [[[PPCloudEngine sharedAppEngine] getRequestSerializer] requestWithMethod:@"PUT" URLString:[NSURL URLWithString:requestString relativeToURL:[[PPCloudEngine sharedAppEngine] getBaseURL]].absoluteString parameters:nil error:&error];
    [request setHTTPBody:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.updateRulePhrase()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] operationWithRequest:request success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPDeviceTypeRuleComponentTemplate *template;
            
            if(!error) {
                template = [PPDeviceTypeRuleComponentTemplate initWithDictionary:[root objectForKey:@"ruleTemplate"]];
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(template, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Delete Rule Phrase.
 *
 * @param templateId Required PPDeviceTypeRuleComponentTemplateId The rule phrase template ID to update
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)deleteRulePhrase:(PPDeviceTypeRuleComponentTemplateId)templateId callback:(PPErrorBlock)callback {
    NSAssert1(templateId != PPDeviceTypeRuleComponentTemplateIdNone, @"%s missing templateId", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"ruleTemplates/%li", (long)templateId];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.deleteRulePhrase()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] DELETE:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Default Rules

/**
 * Get product default rules.
 * This API will allow you to get default rules by device type ID. You must be the owner of the product in order to retrieve them.
 *
 * @param deviceTypeId Required PPDeviceTypeId The product / device type ID
 * @param details PPDeviceTypesDetails True - Return details for these rules, including all the triggers, states, and actions that compose the rule. False - Only return the high level information about the rule, including the id, description text, on/off status, whether the rule is a default rule, and whether the rule is hidden and not editable, default
 * @param callback PPDeviceTypeDefaultRulesBlock Default rules callback block
 **/
+ (void)getProductDefaultRules:(PPDeviceTypeId)deviceTypeId details:(PPDeviceTypesDetails)details callback:(PPDeviceTypeDefaultRulesBlock)callback {
    NSAssert1(deviceTypeId != PPDeviceTypeIdNone, @"%s missing deviceTypeId", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"deviceType/%li/rules?", (long)deviceTypeId];
    if(details != PPDeviceTypesDetailsNone) {
        [requestString appendFormat:@"details=%@&", (details) ? @"true" : @"false"];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getProductDefaultRules()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            NSMutableArray *rules;
            
            if(!error) {
                rules = [[NSMutableArray alloc] initWithCapacity:0];
                for(NSDictionary *ruleDict in [root objectForKey:@"rules"]) {
                    PPRule *rule = [PPRule initWithDictionary:ruleDict];
                    [rules addObject:rule];
                }
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(rules, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Manage default rules

/**
 * Add default rule.
 * Assign a rule as default for a specific product. When a user register a new device of this type, the system will automatically create a new rule based on this default rule.
 * You must be the owner of the product and the rule. The rule cannot be deleted after that.
 *
 * @param deviceTypeId Required PPDeviceTypeId The product / device type ID
 * @param ruleId Required PPRuleId The rule ID
 * @param hidden PPRuleHidden Hidden status for default rule
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)addDefaultRule:(PPDeviceTypeId)deviceTypeId ruleId:(PPRuleId)ruleId hidden:(PPRuleHidden)hidden callback:(PPErrorBlock)callback {
    NSAssert1(ruleId != PPRuleIdNone, @"%s missing ruleId", __FUNCTION__);
    NSAssert1(deviceTypeId != PPDeviceTypeIdNone, @"%s missing deviceTypeId", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"deviceType/%li/rules/%li?", (long)deviceTypeId, (long)ruleId];
    if(hidden != PPRuleHiddenNone) {
        [requestString appendFormat:@"hidden=%@&", (hidden) ? @"true" : @"false"];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.addDefaultRule()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] POST:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Delete default rule.
 * Delete an association of the default rule and the specific product. You must be the owner of the product and the rule.
 *
 * @param deviceTypeId Required PPDeviceTypeId The product / device type ID
 * @param ruleId Required PPRuleId The rule ID
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)deleteDefaultRule:(PPDeviceTypeId)deviceTypeId ruleId:(PPRuleId)ruleId callback:(PPErrorBlock)callback {
    NSAssert1(ruleId != PPRuleIdNone, @"%s missing ruleId", __FUNCTION__);
    NSAssert1(deviceTypeId != PPDeviceTypeIdNone, @"%s missing deviceTypeId", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"deviceType/%li/rules/%li?", (long)deviceTypeId, (long)ruleId];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.deleteDefaultRule()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] DELETE:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Device goals

/**
 * Get device goals by type.
 * Retrieve device goals by device type.
 *
 * @param deviceTypeId Required PPDeviceTypeId The device type ID
 * @param appName NSString Specific app name
 * @param callback PPDeviceTypeGoalsBlock Goals callback block
 **/
+ (void)getDeviceGoalsByType:(PPDeviceTypeId)deviceTypeId appName:(NSString *)appName callback:(PPDeviceTypeGoalsBlock)callback {
    NSAssert1(deviceTypeId != PPDeviceTypeIdNone, @"%s missing deviceTypeId", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"deviceType/%li/goals?", (long)deviceTypeId];
    if(appName) {
        [requestString appendFormat:@"appName=%@&", appName.lowercaseString];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getDeviceGoalsByType()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            NSMutableArray *goals;
            
            if(!error) {
                goals = [[NSMutableArray alloc] initWithCapacity:0];
                for(NSDictionary *goalDict in [root objectForKey:@"goals"]) {
                    PPDeviceTypeGoal *goal = [PPDeviceTypeGoal initWithDictionary:goalDict];
                    [goals addObject:goal];
                }
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(goals, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Device goal installation instructions

/**
 * Get installation instructions.
 * Device installation instructions by goal ID.
 *
 * @param goalId Required PPDeviceTypeGoalId The device goal ID
 * @param callback PPDeviceTypeInstallationInstructionsBlock Installation instructions callback block
 **/
+ (void)getInstallationInstructions:(PPDeviceTypeGoalId)goalId callback:(PPDeviceTypeInstallationInstructionsBlock)callback {
    NSAssert1(goalId != PPDeviceTypeGoalIdNone, @"%s missing goalId", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithFormat:@"goals/%li/installation?", (long)goalId];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getInstallationInstructions()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPDeviceTypeInstallationInstructions *installation;
            if(!error) {
                installation = [[PPDeviceTypeInstallationInstructions alloc] initWithGoalId:goalId installation:[root objectForKey:@"installation"]];
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(installation, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Media

/**
 * Get media.
 * Get available medias.
 *
 * @param mediaId NSString Search by ID
 * @param callback PPDeviceTypeMediaBlock Media callback block
 **/
+ (void)getMedia:(NSString *)mediaId callback:(PPDeviceTypeMediaBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"media?"];
    if(mediaId) {
        [requestString appendFormat:@"mediaId=%@&", mediaId];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getMedia()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            NSMutableArray *medias;
            
            if(!error) {
                medias = [[NSMutableArray alloc] initWithCapacity:0];
                for(NSDictionary *mediaDict in [root objectForKey:@"media"]) {
                    PPDeviceTypeMedia *media = [PPDeviceTypeMedia initWithDictionary:mediaDict];
                    [medias addObject:media];
                }
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(medias, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Put media.
 * Put multiple medias.
 *
 * @param medias Required NSArray Media objects to be uploaded
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)putMedias:(NSArray *)medias callback:(PPErrorBlock)callback {
    NSAssert1(medias != nil && [medias count] > 0, @"%s missing medias", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"media?"];

    NSMutableString *JSONString = [[NSMutableString alloc] init];
    [JSONString appendString:@"{"];

    [JSONString appendString:@"\"media\": ["];
    BOOL appendComma = NO;
    for(PPDeviceTypeMedia *media in medias) {
        if(appendComma) {
            [JSONString appendString:@","];
        }
        [JSONString appendString:[PPDeviceTypeMedia stringify:media]];
        appendComma = YES;
    }
    [JSONString appendString:@"]"];
    [JSONString appendString:@"}"];

    NSError *error;
    NSMutableURLRequest *request = [[[PPCloudEngine sharedAppEngine] getRequestSerializer] requestWithMethod:@"PUT" URLString:[NSURL URLWithString:requestString relativeToURL:[[PPCloudEngine sharedAppEngine] getBaseURL]].absoluteString parameters:nil error:&error];
    [request setHTTPBody:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.putMedia()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] operationWithRequest:request success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Delete media.
 * Delete media. A media record can be deleted only, if it is not used in any device model description or story.
 *
 * @param medias NSArray Media to delete
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)deleteMedias:(NSArray *)medias callback:(PPErrorBlock)callback {
    NSAssert1(medias != nil && [medias count] > 0, @"%s missing medias", __FUNCTION__);
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"media?"];
    if(medias) {
        for(PPDeviceTypeMedia *media in medias) {
            [requestString appendFormat:@"mediaId=%@&", media.mediaId];
        }
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.deleteMedias()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] DELETE:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Device models

/**
 * Get device models.
 * The API returns device categories and models for specific brand.
 *
 * @param brand NSString Get text data for specific brand, otherwise data for default brand returned.
 * @param lang NSString Get text data for specific languages (support for multiple values), otherwise data for all languages returned.
 * @param hidden PPDeviceTypeDeviceModelHidden Request hidden categories and brand, which are not returned by default.
 * @param searchBy NSString Search criterion
 * @param includePairingType PPDeviceTypeDeviceModelPairingType Filter models by pairing type bitmask.
 * @param excludePairingType PPDeviceTypeDeviceModelPairingType Exclude models by pairing type bitmask.
 * @param modelId NSString Return single model
 * @param callback PPDeviceTypeDeviceModelsBlock Device Models callback block
 **/
+ (void)getDeviceModels:(NSString *)brand lang:(NSString *)lang hidden:(PPDeviceTypeDeviceModelHidden)hidden searchBy:(NSString *)searchBy includingPairingType:(PPDeviceTypeDeviceModelPairingType)includePairingType excludePairingType:(PPDeviceTypeDeviceModelPairingType)excludePairingType modelId:(NSString *)modelId callback:(PPDeviceTypeDeviceModelsBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"devicemodels?"];
    if(brand) {
        [requestString appendFormat:@"brand=%@&", brand];
    }
    if(lang) {
        [requestString appendFormat:@"lang=%@&", lang];
    }
    if(hidden != PPDeviceTypeDeviceModelHiddenNone) {
        [requestString appendFormat:@"hidden=%@&", (hidden) ? @"true" : @"false"];
    }
    if(searchBy) {
        [requestString appendFormat:@"searchBy=%@&", [PPNSString stringByAddingURIPercentEscapesUsingEncoding:NSUTF8StringEncoding toString:searchBy]];
    }
    if(includePairingType != PPDeviceTypeDeviceModelPairingTypeNone) {
        [requestString appendFormat:@"includePairingType=%li&", (long)includePairingType];
    }
    if(excludePairingType != PPDeviceTypeDeviceModelPairingTypeNone) {
        [requestString appendFormat:@"excludePairingType=%li&", (long)excludePairingType];
    }
    if(modelId) {
        [requestString appendFormat:@"modelId=%@&", [PPNSString stringByAddingURIPercentEscapesUsingEncoding:NSUTF8StringEncoding toString:modelId]];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getDeviceModels()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            NSMutableArray *categories;
            
            if(!error) {
                categories = [[NSMutableArray alloc] initWithCapacity:0];
                for(NSDictionary *categoryDict in [root objectForKey:@"categories"]) {
                    PPDeviceTypeDeviceModelCategory *category = [PPDeviceTypeDeviceModelCategory initWithDictionary:categoryDict];
                    [categories addObject:category];
                }
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(categories, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}
+ (void)getDeviceModels:(NSString *)brand lang:(NSString *)lang hidden:(PPDeviceTypeDeviceModelHidden)hidden searchBy:(NSString *)searchBy callback:(PPDeviceTypeDeviceModelsBlock)callback {
    NSLog(@"%s deprecated. Use +getDeviceModels:lang:hidden:searchBy:includingPairingType:excludingPairingType:modelId:callback:", __FUNCTION__);
    [PPDeviceTypes getDeviceModels:brand lang:lang hidden:hidden searchBy:searchBy includingPairingType:PPDeviceTypeDeviceModelPairingTypeNone excludePairingType:PPDeviceTypeDeviceModelPairingTypeNone modelId:nil callback:callback];
}

/**
 * Upload device models.
 * Upload a catalog of device models and categories.
 * Data can be updated only for specific brand(s), while other brands data will not be affected.
 *
 * @param categories NSArray Categories to upload
 * @param models NSArray Models to upload
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)uploadDeviceModels:(NSArray *)categories models:(NSArray *)models callback:(PPErrorBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"devicemodels?"];

    NSMutableString *JSONString;
    if([models count] > 0 || [categories count] > 0) {
        JSONString = [[NSMutableString alloc] init];
        [JSONString appendString:@"{"];

        BOOL appendComma = NO;

        if([models count] > 0) {

            [JSONString appendString:@"\"models\": ["];

            BOOL appendModelComma = NO;
            for(PPDeviceTypeDeviceModel *model in models) {
                if(appendModelComma) {
                    [JSONString appendString:@","];
                }
                [JSONString appendString:[PPDeviceTypeDeviceModel stringify:model]];
                appendModelComma = YES;
            }
            [JSONString appendString:@"]"];

            appendComma = YES;
        }
        if(appendComma) {
            [JSONString appendString:@","];
        }

        if([categories count] > 0) {

            [JSONString appendString:@"\"categories\": ["];

            BOOL appendModelComma = NO;
            for(PPDeviceTypeDeviceModelCategory *category in categories) {
                if(appendModelComma) {
                    [JSONString appendString:@","];
                }
                [JSONString appendString:[PPDeviceTypeDeviceModelCategory stringify:category]];
                appendModelComma = YES;
            }
            [JSONString appendString:@"]"];

            appendComma = YES;
        }

        [JSONString appendString:@"}"];

    }

    NSError *error;
    NSMutableURLRequest *request = [[[PPCloudEngine sharedAppEngine] getRequestSerializer] requestWithMethod:@"PUT" URLString:[NSURL URLWithString:requestString relativeToURL:[[PPCloudEngine sharedAppEngine] getBaseURL]].absoluteString parameters:nil error:&error];
    if(JSONString) {
        [request setHTTPBody:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.uploadDeviceModels()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] operationWithRequest:request success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Delete device models
 * Delete data for specific device model, category and brand.
 * Either modelId or categoryId parameters are mandatory.
 *
 * @param modelId NSString Remove data for specific device model
 * @param categoryId NSString Remove data for specific cateogry
 * @param brand NSString Remove model or category only to this brand
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)deleteDeviceModels:(NSString *)modelId categoryId:(NSString *)categoryId brand:(NSString *)brand callback:(PPErrorBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"devicemodels?"];

    if(modelId) {
        [requestString appendFormat:@"modelId=%@&", [PPNSString stringByAddingURIPercentEscapesUsingEncoding:NSUTF8StringEncoding toString:modelId]];
    }
    if(categoryId) {
        [requestString appendFormat:@"categoryId=%@&", [PPNSString stringByAddingURIPercentEscapesUsingEncoding:NSUTF8StringEncoding toString:categoryId]];
    }
    if(brand) {
        [requestString appendFormat:@"brand=%@&", brand];
    }

    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.deleteDeviceModels()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] DELETE:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

#pragma mark - Stories

/**
 * Put stories
 * Insert new stories or update existing stories.
 *
 * @param stories NSArray Story objects to update or create
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)putStories:(NSArray *)stories callback:(PPErrorBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"stories?"];

    NSMutableString *JSONString;
    if([stories count] > 0) {
        JSONString = [[NSMutableString alloc] init];
        [JSONString appendString:@"{"];

        [JSONString appendString:@"\"stories\": ["];

        BOOL appendModelComma = NO;
        for(PPDeviceTypeStory *story in stories) {
            if(appendModelComma) {
                [JSONString appendString:@","];
            }
            [JSONString appendString:[PPDeviceTypeStory stringify:story]];
            appendModelComma = YES;
        }
        [JSONString appendString:@"]"];

        [JSONString appendString:@"}"];
    }

    NSError *error;
    NSMutableURLRequest *request = [[[PPCloudEngine sharedAppEngine] getRequestSerializer] requestWithMethod:@"PUT" URLString:[NSURL URLWithString:requestString relativeToURL:[[PPCloudEngine sharedAppEngine] getBaseURL]].absoluteString parameters:nil error:&error];
    if(JSONString) {
        [request setHTTPBody:[JSONString dataUsingEncoding:NSUTF8StringEncoding]];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.putStories()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] operationWithRequest:request success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Get stories.
 *
 * @param storyId NSString Get specific story by ID
 * @param modelId NSString Filter stories by device model
 * @param brand NSString Filter stories by brand
 * @param storyType PPDeviceTypeStoryType Filter stories by type
 * @param searchBy NSString Search criterion
 * @param hidden PPDeviceTypeStoryPageHidden Request hidden pages, which are not returned by default.
 * @param lang NSString Get stories for specific language, otherwise stories for all languages returned.
 * @param callback PPDeviceTypeStoriesBlock Stories callback block
 **/
+ (void)getStories:(NSString *)storyId modelId:(NSString *)modelId brand:(NSString *)brand storyType:(PPDeviceTypeStoryType)storyType searchBy:(NSString *)searchBy hidden:(PPDeviceTypeStoryPageHidden)hidden lang:(NSString *)lang callback:(PPDeviceTypeStoriesBlock)callback {
    NSMutableString *requestString = [[NSMutableString alloc] initWithString:@"stories?"];
    if(storyId) {
        [requestString appendFormat:@"storyId=%@&", [PPNSString stringByAddingURIPercentEscapesUsingEncoding:NSUTF8StringEncoding toString:storyId]];
    }
    if(modelId) {
        [requestString appendFormat:@"modelId=%@&", [PPNSString stringByAddingURIPercentEscapesUsingEncoding:NSUTF8StringEncoding toString:modelId]];
    }
    if(brand) {
        [requestString appendFormat:@"brand=%@&", brand];
    }
    if(storyType != PPDeviceTypeDeviceModelHiddenNone) {
        [requestString appendFormat:@"storyType=%li&", (long)storyType];
    }
    if(searchBy) {
        [requestString appendFormat:@"searchBy=%@&", searchBy];
    }
    if(hidden != PPDeviceTypeDeviceModelHiddenNone) {
        [requestString appendFormat:@"hidden=%@&", (hidden) ? @"true" : @"false"];
    }
    if(lang) {
        [requestString appendFormat:@"lang=%@&", lang];
    }
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.getStories()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] GET:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            NSDictionary *root = [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            NSMutableArray *stories;
            
            if(!error) {
                stories = [[NSMutableArray alloc] initWithCapacity:0];
                for(NSDictionary *storyDict in [root objectForKey:@"stories"]) {
                    PPDeviceTypeStory *story = [PPDeviceTypeStory initWithDictionary:storyDict];
                    [stories addObject:story];
                }
            }
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(stories, error);
            });
        });
    } failure:^(NSError *error) {
        
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(nil, [PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

/**
 * Delete story
 * Delete an existing story.
 *
 * @param storyId NSString Story ID to delete
 * @param callback PPErrorBlock Error callback block
 **/
+ (void)deleteStory:(NSString *)storyId callback:(PPErrorBlock)callback {
    NSString *requestString = [NSString stringWithFormat:@"stories?storyId=%@", [PPNSString stringByAddingURIPercentEscapesUsingEncoding:NSUTF8StringEncoding toString:storyId]];
    dispatch_queue_t queue = dispatch_queue_create("com.peoplepowerco.ioscore.products.deleteStory()", DISPATCH_QUEUE_SERIAL);
    
    PPLogAPI(@"> %s", dispatch_queue_get_label(queue));
    [[PPCloudEngine sharedAppEngine] DELETE:requestString success:^(NSData *responseData) {
        
        dispatch_async(queue, ^{
            
            NSError *error;
            [PPBaseModel processJSONResponse:responseData originatingClass:NSStringFromClass([self class]) error:&error];
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback(error);
            });
        });
    } failure:^(NSError *error) {
        dispatch_async(queue, ^{
            
            PPLogAPI(@"< %s", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
            
            dispatch_async(dispatch_get_main_queue(), ^{
                callback([PPBaseModel resultCodeToNSError:10003 originatingClass:NSStringFromClass([self class]) argument:[NSString stringWithFormat:@"Error domain:%@, code:%ld, userInfo:%@", error.domain, (long)error.code, error.userInfo]]);
            });
        });
    }];
}

@end


