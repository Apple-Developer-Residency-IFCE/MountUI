//
//  FontExtension.swift
//  MountUI
//
//  Created by Ian Pacini on 02/08/23.
//

import SwiftUI


public extension Font {
    
    enum IosiFontTable: CGFloat {
        case largeTitle = 34
        case title1 = 28
        case title2 = 22
        case title3 = 20
        case headline = 18
        case body = 17
        case callout = 16
        case subheadline = 15
        case footnote = 13
        case caption1 = 12
        case caption2 = 11
    }
    
    enum fontWeight {
        case regular
        case bold
    }
}

public extension Text {
    
    func iosiFont(size: Font.IosiFontTable, weight: Font.fontWeight) -> Self {
        return weight == .bold ? self.font(.system( size: size.rawValue).bold()) : self.font(.system( size: size.rawValue))
    }

}
