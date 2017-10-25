#import <React/RCTUtils.h>
#import "React/RCTLog.h"
#import "ReactNativeDynamicIcon.h"

// Original
#define kDefaultName  @"Default"
// First alternate
#define kWindmillName @"Windmill"
#define kWindmillKey  @"icon_type_windmill"

@implementation ReactNativeDynamicIcon

- (dispatch_queue_t)methodQueue {
  return dispatch_get_main_queue();
}

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(setIconName:(NSString *)iconName)
{
  // Not supported
  if ([[UIApplication sharedApplication] supportsAlternateIcons] == NO) {
    RCTLog(@"Alternate icons are not supported");
    return;
  }
  // Original icon
  if ([iconName isEqualToString:kDefaultName]) {
      [[UIApplication sharedApplication] setAlternateIconName:nil completionHandler:^(NSError * _Nullable error) {
          RCTLog(@"%@", [error description]);
      }];
  }
  // First alternate
  else if ([iconName isEqualToString:kWindmillName]) {
      [[UIApplication sharedApplication] setAlternateIconName:kWindmillKey completionHandler:^(NSError * _Nullable error) {
          RCTLog(@"%@", [error description]);
      }];
  }
  // No match
  else {
    RCTLog(@"No icon with name %@ was found", iconName);
  }
}

@end
