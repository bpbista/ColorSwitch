//
//  Settings.swift
//  ColorSwitch
//
//  Created by BP Bista on 11/14/18.
//  Copyright © 2018 bpb.com.np. All rights reserved.
//

import SpriteKit

enum PhyicsCategories {
    static let none:UInt32 = 0x0
    static let ballCategory:UInt32 =  0x1 << 0//01 //no shift
    static let switchCategory:UInt32 =  0x1 << 1 //10 // shift 1 position
}
enum ZPositions {
    static let label:CGFloat = 0
    static let ball:CGFloat = 1
    static let colorSwitch:CGFloat = 2
}
enum PlayColors{
    static let colors = [
        UIColor(red: 251/255, green: 41/255, blue: 66/255, alpha: 1.0),
        UIColor(red: 60/255, green: 225/255, blue: 60/255, alpha: 1.0),
        UIColor(red: 46/255, green: 123/255, blue: 215/255, alpha: 1.0)
    ]
}

enum SwitchState:Int{
    case  red, green, blue
}
