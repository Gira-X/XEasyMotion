//
//  self.swift
//  XEasyMotion
//
//  Created by h2ero on 6/19/16.
//  Copyright © 2016 h2ero. All rights reserved.
//

import Foundation
import Carbon

// key bindings:
//   c
//  htn
//
// u - click
// e - right click
// o - undo
// m - escape

class SimpleMode : Mode{
    
    static func load(){
        self.addActiveKeyBind()
        self.addRestoreKeyBind()
        self.addHitKeyBind()
        self.addClickBind()
        self.addMoveKeyBind()
        self.addCancelKeyBind()
    }
    
    override static func addHitKeyBind()  {
//        Log.write(errLevel: Log.INFO, catelog: "register key code", value: "start")
        for (keyCode, _) in Constents.hintCharsKeyCodeMap{
//            Log.write(Log.INFO, catelog: "register key code", value: keyCode)
            HotKeys.register(keycode: UInt32(keyCode), modifiers: UInt32(activeFlag), block:{
                (id:EventHotKeyID) in self.resizeWindow(id: Int(id.id))
                //                let (x,y) = self.getWinCenterPoint()
                //                Util.moveMouse(x, y: y)
            })
        }
//        Log.write(Log.INFO, catelog: "register key code", value: "end")
    }
    
    override static func addMoveKeyBind()  {
        // for (_, keyCode) in Constents.moveKeyCode {
//            Log.write(Log.INFO, catelog: "register key code", value: keyCode)
            // HotKeys.register(keycode: UInt32(keyCode), modifiers: UInt32(shiftKey), block:{
                // (id:EventHotKeyID) in
//                Log.write(errLevel: Log.INFO, catelog: "move", value: String(id.id) as AnyObject)
                // self.moveWindow(dirction: Int(id.id))
            // })
        // }
        
    }
    
    override static func addClickBind()  {
        HotKeys.register(keycode: UInt32(kVK_ANSI_F), modifiers: UInt32(activeFlag), block:{_ in
           
            DispatchQueue.global().async {
                let (x,y) = self.getWinCenterPoint()
                self.hideWindow()
                self.removeKeyBind();
                DispatchQueue.main.async{
                    Util.click(x: x, y: y)
                }
            }
            
        });
        
        HotKeys.register(keycode: UInt32(kVK_ANSI_D), modifiers: UInt32(activeFlag), block:{_ in
            DispatchQueue.global().async {
                let (x,y) = self.getWinCenterPoint()
                self.hideWindow()
                self.removeKeyBind();
                DispatchQueue.main.async{
                    Util.rightClick(x: x, y: y)
                }
            }
            
        });
    }
    static func removeKeyBind(){
        for (keyCode, _) in Constents.hintCharsKeyCodeMap{
            HotKeys.unregister(id: UInt32(keyCode + activeFlag))
        }
        
        
        for ( _,keyCode) in Constents.moveKeyCode {
//            Log.write(errLevel: Log.INFO, catelog: "remove move key", value: String(UInt32(keyCode + shiftKey)))
            HotKeys.unregister(id: UInt32(keyCode + shiftKey))
        }

        HotKeys.unregister(id: UInt32(kVK_ANSI_F + activeFlag))
        HotKeys.unregister(id: UInt32(kVK_ANSI_D + activeFlag))
        HotKeys.unregister(id: UInt32(kVK_ANSI_O + activeFlag))
        HotKeys.unregister(id: UInt32(kVK_ANSI_E + activeFlag))
        HotKeys.unregister(id: UInt32(kVK_ANSI_U + activeFlag))
        HotKeys.unregister(id: UInt32(kVK_ANSI_M + activeFlag))
        HotKeys.unregister(id: UInt32(kVK_ANSI_S + activeFlag))
    }
    static func draw(){
        GradView.drawHorizLine(frac: 0)
        GradView.drawHorizLine(frac: 1/2.0)
        GradView.drawHorizLine(frac: 1.0)
        GradView.drawVertLine(frac:0)
        GradView.drawVertLine(frac:1/2.0)
        GradView.drawVertLine(frac:1.0)
    }
    
    static func resizeWindow(id:Int) {
        self.addPostionStack()
        let windowFirst = Util.getWindowFirst()
        var windowFrame = windowFirst.frame
        
        

        let hitChar = Constents.hintCharsKeyCodeMap[id - activeFlag]

        let oldWidth = windowFrame.size.width
        let oldHeight = windowFrame.size.height
        var newWidth = oldWidth
        var newHeight = oldHeight
        if hitChar == "J" {
            newWidth = oldWidth  * 0.5

        } else if hitChar == "L" {
            newWidth = oldWidth  * 0.5
            windowFrame.origin.x += newWidth

        } else if hitChar == "K" {
            newHeight = oldHeight  * 0.5

        } else { // key code I
            newHeight = oldHeight  * 0.5
            windowFrame.origin.y += newHeight
        }
        windowFrame.size = NSMakeSize(newWidth, newHeight)
        windowFirst.setFrame(windowFrame,display: true,animate: Constents.animation)
        
    }
    
    
    
}
