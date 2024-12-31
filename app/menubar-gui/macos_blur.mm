#include <QWindow>
#include <Cocoa/Cocoa.h>

void addBlurEffectToWindow(QWindow *window) {
    if (!window) return;

    // Get the NSView from QWindow and retrieve its NSWindow
    NSView *nsView = (__bridge NSView *)window->winId();
    if (![nsView isKindOfClass:[NSView class]]) return;

    NSWindow *nsWindow = [nsView window];
    if (!nsWindow) return;

    // Create the NSVisualEffectView for blur
    NSVisualEffectView *blurView = [[NSVisualEffectView alloc] initWithFrame:[nsWindow.contentView bounds]];
    [blurView setMaterial:NSVisualEffectMaterialMenu];
    [blurView setBlendingMode:NSVisualEffectBlendingModeBehindWindow];
    [blurView setState:NSVisualEffectStateActive];

    // Enable layer backing and set corner radius
    [blurView setWantsLayer:YES];
    blurView.layer.cornerRadius = 30.0; // Set your desired corner radius
    blurView.layer.masksToBounds = YES; // Ensures the corners are clipped

    [nsWindow.contentView.superview addSubview:blurView positioned:NSWindowBelow relativeTo:nsWindow.contentView];

}
