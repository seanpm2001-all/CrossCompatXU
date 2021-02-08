#import "Forwarder.h"
@implementation Forwarder
- (retval_t)forward:(SEL)sel args:(arglist_t)args {
/*
* Check whether the recipient actually responds to the message.
* This may or may not be desirable, for example, if a recipient
* in turn does not respond to the message, it might do forwarding
* itself.
*/
if ([recipient respondsToSelector:sel]) {
return [recipient performv:sel args:args];
} else {
return [self error:"Recipient does not respond"];
}
}
- (id)setRecipient:(id)_recipient {
[recipient autorelease];
recipient = [_recipient retain];
return self;
}
- (id)recipient {
return recipient;
}
@end
