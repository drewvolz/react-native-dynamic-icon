#import <React/RCTUtils.h>
#import "React/RCTLog.h"
#import "ReactNativeDynamicIcon.h"

#define kDefaultName  @"__default__"

@implementation ReactNativeDynamicIcon

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setIconName:(NSString *)iconName) {
  // Not supported
  if ([[UIApplication sharedApplication] supportsAlternateIcons] == NO) {
    RCTLog(@"Alternate icons are not supported");
    return;
  }
  
  if ([iconName isEqualToString:kDefaultName]) {
    // Original icon
    [[UIApplication sharedApplication] setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
      RCTLog(@"%@", [error description]);
    }];
  } else {
    // Custom icon
    [[UIApplication sharedApplication] setAlternateIconName:iconName completionHandler:^(NSError * _Nullable error) {
      RCTLog(@"%@", [error description]);
    }];
  }
}

@end
