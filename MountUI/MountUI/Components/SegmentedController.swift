//
//  SegmentedController.swift
//  MountUI
//
//  Created by Ian Pacini on 04/08/23.
//

import SwiftUI

public struct Segment: View {
    
    var label: String
    var width: CGFloat
    var index: Int
    
    var color: Color
    var bottomRectangleHeight: CGFloat
    
    @Binding var selectBinding: Int
    
    public init(label: String, width: CGFloat, index: Int, selectBinding: Binding<Int>) {
        self.label = label
        self.width = width
        self.index = index
        self._selectBinding = selectBinding
        
        if selectBinding.wrappedValue == index {
            color = Color.IosiColors.iosiPrimary10
            bottomRectangleHeight = 2
        } else {
            color = Color.IosiColors.iosiNeutral60
            bottomRectangleHeight = 1
        }
        
    }
    
    public var body: some View {
        Button {
            selectBinding = index
        } label: {
            ZStack(alignment: .center) {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(width: width, height: 54 - bottomRectangleHeight)
                        .foregroundColor(Color.IosiColors.iosiNeutral100)
                    
                    Rectangle()
                        .frame(width: width, height: bottomRectangleHeight)
                        .foregroundColor(color)
                }
                
                Text(label)
                    .foregroundColor(color)
            }
        }
    }
}

public struct SegmentedController: View {
    
    var titles: [String]
    var segmentSize: CGFloat
    
    @Binding var selectedScreen: Int
    
    init(titles: [String], selectedScreen: Binding<Int>) {
        self.titles = titles
        self._selectedScreen = selectedScreen
        
        if (titles.count <= 3) {
            segmentSize = (UIScreen.main.bounds.width)/CGFloat(titles.count)
        } else {
            segmentSize = CGFloat(105)
        }
    }
    
    public var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 0) {
                ForEach(titles.indices, id: \.self) { index in
                    Segment(label: titles[index], width: segmentSize, index: index, selectBinding: $selectedScreen)
                }
            }
        }
        .frame(height: 54)
        
    }
}

struct content3: View {
    @State var screen: Int = 0
    
    var body: some View {
        SegmentedController(titles: ["First", "Second", "Third", "Forth"], selectedScreen: $screen)
    }
}

struct SegmentedControlPOC_Previews: PreviewProvider {
    static var previews: some View {
        content3()
    }
}

