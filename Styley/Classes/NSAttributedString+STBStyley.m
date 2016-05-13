//
//  NSMutableAttributedString+STBStyley.m
//  Pods
//
//  Created by Pim Coumans on 13/05/16.
//
//

#import "NSAttributedString+STBStyley.h"

@interface STBStyledString : NSObject

- (nonnull instancetype)initWithRanges:(nonnull NSDictionary<NSValue *, NSNumber *> *)styleRanges string:(nonnull NSString *)string;
@property (nonatomic, copy, readonly) NSDictionary<NSValue *, NSNumber *> * styleRanges;
@property (nonatomic, copy, readonly) NSString *string;

@end

@implementation STBStyledString

- (nonnull instancetype)initWithRanges:(nonnull NSDictionary<NSValue *, NSNumber *> *)styleRanges string:(nonnull NSString *)string
{
	self = [super init];
	if (self) {
		_styleRanges = styleRanges;
		_string = string;
	}
	return self;
}

@end

@implementation NSAttributedString (STBStyley)

- (nonnull instancetype)initWithString:(nonnull NSString *)string styles:(nonnull NSDictionary<NSNumber *, NSDictionary<NSString *, id> *> *)styles
{
	STBStyledString *styledString = [self styledStringFromString:string];
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:styledString.string];
	
	[styledString.styleRanges enumerateKeysAndObjectsUsingBlock:^(NSValue * _Nonnull rangeValue, NSNumber * _Nonnull styleNumber, BOOL * _Nonnull stop) {
		if ([[styles allKeys] containsObject:styleNumber]) {
			[attributedString setAttributes:styles[styleNumber] range:rangeValue.rangeValue];
		}
	}];
	
	return [self initWithAttributedString:attributedString];
}

- (STBStyledString *)styledStringFromString:(NSString *)string
{
	NSMutableDictionary <NSValue *, NSNumber *> *styleRanges = [NSMutableDictionary dictionary];
	
	NSNumber *nextStyle = nil;
	NSRange nextRange = NSMakeRange(0,0);
	NSString *nextString = string;
	
	while ([self getNextStyle:&nextStyle range:&nextRange string:&nextString fromString:nextString])
	{
		[styleRanges setObject:nextStyle forKey:[NSValue valueWithRange:nextRange]];
	}
	
	
	STBStyledString *styledString = [[STBStyledString alloc] initWithRanges:styleRanges string:nextString];
	return styledString;
}

- (BOOL)getNextStyle:(NSNumber **)style range:(NSRange *)range string:(NSString **)string fromString:(NSString *)sourceString
{
	NSMutableString *outString = [NSMutableString string];
	NSRange outRange = NSMakeRange(0, 0);
	NSString *scannedString = nil;
	NSScanner *scanner = [NSScanner scannerWithString:sourceString];
	
	if (![scanner scanUpToString:@"[" intoString:&scannedString])
	{
		return NO;
	}
	[outString appendString:scannedString];
	outRange.location = scanner.scanLocation;
	
	if ([scanner isAtEnd])
	{
		return NO;
	}
	
	scanner.scanLocation += 1;
	
	NSInteger integer = NSIntegerMax;
	
	if (![scanner scanInteger:&integer])
	{
		return NO;
	}
	
	scanner.scanLocation -= 1;
	if (![scanner scanUpToString:@"](" intoString:&scannedString])
	{
		return NO;
	}
	scanner.scanLocation += 2;
	
	if (![scanner scanUpToString:@")" intoString:&scannedString])
	{
		return NO;
	}
	outRange.length = scannedString.length;
	[outString appendString:scannedString];
	
	scanner.scanLocation += 1;
	[outString appendString:[sourceString substringFromIndex:scanner.scanLocation]];
	
	*style = @(integer);
	*range = outRange;
	*string = outString;
	
	return YES;
}

@end

