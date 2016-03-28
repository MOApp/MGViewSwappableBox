//
//  MGViewSwappableBox.h
//  MGWindowExample
//
//  Created by Michael on 3/26/16.
//  Copyleft © 2016 MOApp Software Manufactory. No rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MGViewSwappableBox : NSBox

@property (strong) NSView *oldView;

-(void)swapView:(NSView *)view;

@end
