#import <stdio.h>
#import <Foundation/NSString.h>
#import "smoke.h"

@interface CPrinter : NSObject <Printer>
-(void)print:(const char*)string;
@end;

@implementation CPrinter
-(void)print:(const char*)string {
    printf("%s\n", string);
    fflush(stdout);
}
@end;

@implementation Foo

@synthesize name;

-(instancetype)init {
    if (self = [super init]) {
        self.name = @"World";
    }
    return self;
}

-(void)helloWithPrinter:(id <Printer>)printer {
    NSString* message = [NSString stringWithFormat:@"Hello, %@!", self.name];
    [printer print:message.UTF8String];
}

-(void)dealloc {
    printf("Deallocated\n");
}

@end;

@implementation Foo (FooExtensions)

-(void)hello {
    CPrinter* printer = [[CPrinter alloc] init];
    [self helloWithPrinter:printer];
}
@end;

void replacePairElements(id <MutablePair> pair, int first, int second) {
    [pair update:0 add:(first - pair.first)];
    [pair update:1 sub:(pair.second - second)];
}
