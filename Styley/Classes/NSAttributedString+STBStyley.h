//
//  NSMutableAttributedString+STBStyley.h
//  Pods
//
//  Created by Pim Coumans on 13/05/16.
//
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (STBStyley)

- (nonnull instancetype)initWithString:(nonnull NSString *)string styles:(nonnull NSDictionary<NSNumber *, NSDictionary<NSString *, id> *> *)styles;

@end
