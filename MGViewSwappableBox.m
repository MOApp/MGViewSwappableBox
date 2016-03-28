//
//  MGViewSwappableBox.m
//  MGWindowExample
//
//  Created by Michael on 3/26/16.
//  Copyleft © 2016 MOApp Software Manufactory. No rights reserved.
//

#import "MGViewSwappableBox.h"
#import <Quartz/Quartz.h>

@implementation MGViewSwappableBox

@synthesize oldView;

-(void)swapView:(NSView *)view {
    
    view.hidden = NO;
    view.alphaValue = 0.0f;
    [view setFrame:self.contentView.frame];
    
    if (oldView) {
        
        [NSAnimationContext beginGrouping];
        [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
            
            //quick and dirty solution
            if ([[NSUserDefaults standardUserDefaults]boolForKey:@"prefs_DisableAnimation"]) {
            context.duration = 0.0f;
            }
            else {
               context.duration = 0.35f;
                context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            }
            oldView.animator.alphaValue = 0.0f;
        }
                            completionHandler:^{
                                oldView.hidden = YES;
                                oldView.alphaValue = 1.0f;
                                [oldView removeFromSuperview];
                                
                                [self setContentView:view];
                                self.oldView = view;
                                
                                [NSAnimationContext beginGrouping];
                                [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
                                    context.duration = 0.35f;
                                    context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
                                    view.animator.alphaValue = 1.0f;
                                }
                                 
                                                    completionHandler:^{
                                                        
                                                    }];
                                [NSAnimationContext endGrouping];
                                
                            }];
        [NSAnimationContext endGrouping];
    }
    else {
        
        [self setContentView:view];
        self.oldView = view;
        
        [NSAnimationContext beginGrouping];
        [NSAnimationContext runAnimationGroup:^(NSAnimationContext *context) {
            
            if ([[NSUserDefaults standardUserDefaults]boolForKey:@"prefs_DisableAnimation"]) {
                
                //quick and dirty solution
                context.duration = 0.0f;
            }
            else {
                context.duration = 0.7f;
                context.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
            }
            view.animator.alphaValue = 1.0f;
        }
         
                            completionHandler:^{
                                
                            }];
        
        [NSAnimationContext endGrouping];
    }
}

@end
