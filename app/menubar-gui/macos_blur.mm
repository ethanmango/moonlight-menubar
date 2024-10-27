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
    [blurView setMaterial:NSVisualEffectMaterialMenu]; // Or other materials
    [blurView setBlendingMode:NSVisualEffectBlendingModeBehindWindow];
    [blurView setState:NSVisualEffectStateActive];

    // Enable layer backing and set corner radius
    [blurView setWantsLayer:YES];
    blurView.layer.cornerRadius = 15.0; // Set your desired corner radius
    blurView.layer.masksToBounds = YES; // Ensures the corners are clipped

    // Add the blur view to the NSWindow's content view
    [nsWindow.contentView addSubview:blurView positioned:NSWindowBelow relativeTo:nil];
}
