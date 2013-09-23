JSGameMenu
==========

Simple non-intrusive pause menu for SpriteKit games in IOS7

Demo project included.

![ScreenShot](https://raw.github.com/jsealey/JSGameMenu/master/demo.gif)

## Install
- copy the **JSGameMenu** class into your project
- copy **pause**, **play**, **replay**, and **exit** images into your project
- import `JSGameMenu.h` in your class
- add `@property (nonatomic, strong) JSGameMenu *menu;` to your class header
- initialize the menu in your init method

<pre>
    _menu = [[JSGameMenu alloc] initWithSize:size 
                           withReplayHandler:^{NSLog(@"Replay Callback");}
                             withExitHandler:^{NSLog(@"Exit Callback");}];
    [self addChild:_menu];
</pre>

- pass touch events along to the pause menu in the touchesBegan method

<pre>
    -(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
        [_menu handleTouch:touches withEvent:event];
    }
</pre>

## TO-DO
- support orientation changes
- make better icons
