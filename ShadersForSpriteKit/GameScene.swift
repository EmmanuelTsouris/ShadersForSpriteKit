//
//  GameScene.swift
//  ShadersForSpriteKit
//
//  Created by Emmanuel Tsouris on 12/29/15.
//
//  The MIT License (MIT)
//
//  Copyright © 2015 Emmanuel Tsouris. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import SpriteKit

class GameScene: SKScene {
    
    var rippleShader: SKShader!
    var mainSprite: SKSpriteNode!
    
    override func didMoveToView(view: SKView) {

        // Make a Label
        let shaderLabel = SKLabelNode()
        shaderLabel.text = "Shaders for SpriteKit";
        shaderLabel.fontSize = 45;
        shaderLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:(self.frame.height - (shaderLabel.frame.height * 2)));
        self.addChild(shaderLabel)
        
        // Make a Shader
        rippleShader = SKShader(fileNamed: "Twirl.fsh")
        
        // Make a Sprite
        mainSprite = SKSpriteNode(imageNamed:"Spaceship")
        mainSprite.position = CGPoint(x:CGRectGetMidX(self.frame),y:CGRectGetMidY(self.frame))
        mainSprite.shader = rippleShader
        self.addChild(mainSprite)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
