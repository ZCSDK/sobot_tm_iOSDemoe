//
//  SobotSSKeychain.h
//  SobotSSKeychain
//
//  Created by Sam Soffes on 5/19/10.
//  Copyright (c) 2010-2014 Sam Soffes. All rights reserved.
//

#import "SobotSSKeychainQuery.h"

/**
 Error code specific to SobotSSKeychain that can be returned in NSError objects.
 For codes returned by the operating system, refer to SecBase.h for your
 platform.
 */
typedef NS_ENUM(OSStatus, SobotSSKeychainErrorCode) {
	/** Some of the arguments were invalid. */
	SobotSSKeychainErrorBadArguments = -1001,
};

/** SobotSSKeychain error domain */
extern NSString *const kSobotSSKeychainErrorDomain;

/** Account name. */
extern NSString *const kSobotSSKeychainAccountKey;

/**
 Time the item was created.

 The value will be a string.
 */
extern NSString *const kSobotSSKeychainCreatedAtKey;

/** Item class. */
extern NSString *const kSobotSSKeychainClassKey;

/** Item description. */
extern NSString *const kSobotSSKeychainDescriptionKey;

/** Item label. */
extern NSString *const kSobotSSKeychainLabelKey;

/** Time the item was last modified.

 The value will be a string.
 */
extern NSString *const kSobotSSKeychainLastModifiedKey;

/** Where the item was created. */
extern NSString *const kSobotSSKeychainWhereKey;

/**
 Simple wrapper for accessing accounts, getting passwords, setting passwords, and deleting passwords using the system
 Keychain on Mac OS X and iOS.

 This was originally inspired by EMKeychain and SDKeychain (both of which are now gone). Thanks to the authors.
 SobotSSKeychain has since switched to a simpler implementation that was abstracted from [SSToolkit](http://sstoolk.it).
 */
@interface SobotSSKeychain : NSObject

#pragma mark - Classic methods

/**
 Returns a string containing the password for a given account and service, or `nil` if the Keychain doesn't have a
 password for the given parameters.

 @param serviceName The service for which to return the corresponding password.

 @param account The account for which to return the corresponding password.

 @return Returns a string containing the password for a given account and service, or `nil` if the Keychain doesn't
 have a password for the given parameters.
 */
+ (NSString *)passwordForService:(NSString *)serviceName account:(NSString *)account;
+ (NSString *)passwordForService:(NSString *)serviceName account:(NSString *)account error:(NSError **)error;

/**
 Returns a nsdata containing the password for a given account and service, or `nil` if the Keychain doesn't have a
 password for the given parameters.

 @param serviceName The service for which to return the corresponding password.

 @param account The account for which to return the corresponding password.

 @return Returns a nsdata containing the password for a given account and service, or `nil` if the Keychain doesn't
 have a password for the given parameters.
 */
+ (NSData *)passwordDataForService:(NSString *)serviceName account:(NSString *)account;
+ (NSData *)passwordDataForService:(NSString *)serviceName account:(NSString *)account error:(NSError **)error;


/**
 Deletes a password from the Keychain.

 @param serviceName The service for which to delete the corresponding password.

 @param account The account for which to delete the corresponding password.

 @return Returns `YES` on success, or `NO` on failure.
 */
+ (BOOL)deletePasswordForService:(NSString *)serviceName account:(NSString *)account;
+ (BOOL)deletePasswordForService:(NSString *)serviceName account:(NSString *)account error:(NSError **)error;


/**
 Sets a password in the Keychain.

 @param password The password to store in the Keychain.

 @param serviceName The service for which to set the corresponding password.

 @param account The account for which to set the corresponding password.

 @return Returns `YES` on success, or `NO` on failure.
 */
+ (BOOL)setPassword:(NSString *)password forService:(NSString *)serviceName account:(NSString *)account;
+ (BOOL)setPassword:(NSString *)password forService:(NSString *)serviceName account:(NSString *)account error:(NSError **)error;

/**
 Sets a password in the Keychain.

 @param password The password to store in the Keychain.

 @param serviceName The service for which to set the corresponding password.

 @param account The account for which to set the corresponding password.

 @return Returns `YES` on success, or `NO` on failure.
 */
+ (BOOL)setPasswordData:(NSData *)password forService:(NSString *)serviceName account:(NSString *)account;
+ (BOOL)setPasswordData:(NSData *)password forService:(NSString *)serviceName account:(NSString *)account error:(NSError **)error;

/**
 Returns an array containing the Keychain's accounts, or `nil` if the Keychain has no accounts.

 See the `NSString` constants declared in SobotSSKeychain.h for a list of keys that can be used when accessing the
 dictionaries returned by this method.

 @return An array of dictionaries containing the Keychain's accounts, or `nil` if the Keychain doesn't have any
 accounts. The order of the objects in the array isn't defined.
 */
+ (NSArray *)allAccounts;
+ (NSArray *)allAccounts:(NSError *__autoreleasing *)error;


/**
 Returns an array containing the Keychain's accounts for a given service, or `nil` if the Keychain doesn't have any
 accounts for the given service.

 See the `NSString` constants declared in SobotSSKeychain.h for a list of keys that can be used when accessing the
 dictionaries returned by this method.

 @param serviceName The service for which to return the corresponding accounts.

 @return An array of dictionaries containing the Keychain's accounts for a given `serviceName`, or `nil` if the Keychain
 doesn't have any accounts for the given `serviceName`. The order of the objects in the array isn't defined.
 */
+ (NSArray *)accountsForService:(NSString *)serviceName;
+ (NSArray *)accountsForService:(NSString *)serviceName error:(NSError *__autoreleasing *)error;


#pragma mark - Configuration

#if __IPHONE_4_0 && TARGET_OS_IPHONE
/**
 Returns the accessibility type for all future passwords saved to the Keychain.

 @return Returns the accessibility type.

 The return value will be `NULL` or one of the "Keychain Item Accessibility
 Constants" used for determining when a keychain item should be readable.

 @see setAccessibilityType
 */
+ (CFTypeRef)accessibilityType;

/**
 Sets the accessibility type for all future passwords saved to the Keychain.

 @param accessibilityType One of the "Keychain Item Accessibility Constants"
 used for determining when a keychain item should be readable.

 If the value is `NULL` (the default), the Keychain default will be used.

 @see accessibilityType
 */
+ (void)setAccessibilityType:(CFTypeRef)accessibilityType;
#endif

@end
