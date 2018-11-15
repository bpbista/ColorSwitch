//
//  Settings.swift
//  ColorSwitch
//
//  Created by BP Bista on 11/14/18.
//  Copyright © 2018 bpb.com.np. All rights reserved.
//

import SpriteKit

enum PhyicsCategories {
    static let none:UInt32 = 0
    static let ballCategory:UInt32 =  0x1 //01
    static let switchCategory:UInt32 =  0x1 << 1 //10
}
enum ZPositions {
    static let label:CGFloat = 0
    static let ball:CGFloat = 1
    static let colorSwitch:CGFloat = 2
}
