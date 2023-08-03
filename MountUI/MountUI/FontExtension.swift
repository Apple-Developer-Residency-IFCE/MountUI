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
        case headline = 17
        case body = 18
        case callout = 16
        case subheadline = 15
        case footnote = 13
        case caption1 = 12
        case caption2 = 11
    }
    
}

public extension Text {
    
    func iosiFont(size: Font.IosiFontTable) -> Self {
        return size == .headline ?
        self.font(.custom("SF pro", size: size.rawValue)).bold()
        :
        self.font(.custom("SF pro", size: size.rawValue))
    }

}
