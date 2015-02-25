//
//  NSString+HexConversion.m
//  NSString+HexConversion
//
//  Created by Aldrich Wingsiong on 2015-02-25.
//
//

#import "NSString+HexConversion.h"
#import <objc/runtime.h>

@implementation NSString_HexConversion

- (NSData*)dataFromHex{
    
    const char *chars = [self UTF8String];
    NSUInteger i = 0, len = self.length;
    
    NSMutableData *data = [NSMutableData dataWithCapacity:len/2];
    char byteChars [3] =  {'\0','\0','\0'};
    unsigned long byte;
    
    while (i<len){
        byteChars[0] = chars[i++];
        byteChars[1] = chars[i++];
        byte = strtoul(byteChars, NULL, 16);
        [data appendBytes:&byte length:1];
    }
    return data;
}

@end
