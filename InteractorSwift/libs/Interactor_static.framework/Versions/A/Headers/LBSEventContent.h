#import <Foundation/Foundation.h>

typedef enum LBSEventContentType{
    TEXT, IMAGE, URL, LBSEventContentTypeUnknown
} LBSEventContentType;

@interface LBSEventContent : NSObject

@property(nonatomic) NSString * key;
@property(nonatomic) NSString * value;
@property(nonatomic) LBSEventContentType type;


@end
