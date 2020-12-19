//
//  Constents.swift
//  keynav
//
//  Created by h2ero on 6/4/16.
//  Copyright © 2016 h2ero. All rights reserved.
//

import Foundation
import Carbon

class Constents {
    // mode: simple, hit_chars, orc
    static let simpleMode = "simpleMode";
    static let nineBlockMode = "nineBlockMode";
    static var mode = Constents.nineBlockMode
    static let animation = false
    static let debug = false
    
    static let hintChars : [[String]] = [
        ["A","K","F"],
        ["H","S","L"],
        ["D","J",";"]
    ]
    
    static let hintCharsKeyCodeMap : [Int:String] = [
        // move cursor
        // kVK_ANSI_H          : "H", // move left
        kVK_ANSI_J          : "J", // move down
        kVK_ANSI_K          : "K", // move up
        kVK_ANSI_L          : "L", // move right

        // kVK_ANSI_A          : "A",
        // kVK_ANSI_F          : "F",
        // kVK_ANSI_S          : "S",
        // kVK_ANSI_D          : "D",

        // move up
        kVK_ANSI_I          : "I",
        
        kVK_ANSI_Semicolon  : ";"

    ]
    
    static let hitCharBaseFontSize:CGFloat = 40;
    static let hitCharMinFontSize:CGFloat = 12;
    
    static let  moveKeyCode :[String:Int] = [
        "UP"              : kVK_ANSI_I,
        "LEFT"            : kVK_ANSI_H,
        "RIGHT"           : kVK_ANSI_N,
        "DOWN"            : kVK_ANSI_T
    ]
    
}
