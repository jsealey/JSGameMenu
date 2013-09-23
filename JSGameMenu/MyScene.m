//
//  MyScene.m
//  JSGameMenu
//
//  Created by Jared Sealey on 9/22/13.
//  Copyright (c) 2013 Jared Sealey. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        
        [self stuffYouDoNotNeedToCopy];
        
        /* alloc/init the menu and add it to the current scene */
        _menu = [[JSGameMenu alloc] initWithSize:size withColorTheme:[UIColor whiteColor]
                withReplayHandler:^{
                    MyScene *ms = [MyScene sceneWithSize:self.size];
                    SKTransition *transition = [SKTransition fadeWithDuration:0.5];
                    [self.scene.view presentScene:ms transition:transition];
                }
                withExitHandler:^{
                    MyScene *ms = [MyScene sceneWithSize:self.size];
                    SKTransition *transition = [SKTransition doorsCloseHorizontalWithDuration:0.5];
                    [self.scene.view presentScene:ms transition:transition];
                }];
        
        _menu = [[JSGameMenu alloc] initWithSize:size withReplayHandler:^{NSLog(@"Replay Callback");} withExitHandler:^{NSLog(@"Exit Callback");}];
        
        [self addChild:_menu];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* pass the touch event to the menu */
    [_menu handleTouch:touches withEvent:event];
}

-(void) stuffYouDoNotNeedToCopy {
    
    SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
    sprite.position = CGPointMake(self.frame.size.width/2,self.frame.size.height/2);
    
    SKAction *action = [SKAction rotateByAngle:M_PI duration:1];
    [sprite runAction:[SKAction repeatActionForever:action]];
    
    [self addChild:sprite];
}

@end
