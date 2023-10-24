//
//  SegmentedController.swift
//  MountUI
//
//  Created by Ian Pacini on 04/08/23.
//

import SwiftUI

struct Segment: View {
    
    let label: String
    let width: CGFloat
    let letterWeight: Font.fontWeight
    let index: Int
    
    let color: Color
    let bottomRectangleHeight: CGFloat
    
    @Binding var selectBinding: Int
    
    init(label: String, width: CGFloat, index: Int, selectBinding: Binding<Int>) {
        self.label = label
        self.width = width
        self.index = index
        self._selectBinding = selectBinding
        
        if selectBinding.wrappedValue == index {
            color = Color.IosiColors.iosiPrimary70
            bottomRectangleHeight = 2
            letterWeight = .bold
        } else {
            color = Color.IosiColors.iosiNeutral60
            bottomRectangleHeight = 0.5
            letterWeight = .regular
        }
        
    }
    
    var body: some View {
        Button {
            selectBinding = index
        } label: {
            ZStack(alignment: .center) {
                VStack(spacing: 0) {
                    Rectangle()
                        .frame(width: width, height: 54 - bottomRectangleHeight)
                        .foregroundColor(.clear)
                    
                    Rectangle()
                        .frame(width: width, height: bottomRectangleHeight)
                        .foregroundColor(color)
                }
                
                Text(label)
                    .iosiFont(size: .callout, weight: letterWeight)
                    .foregroundColor(color)
            }
        }
    }
}

public struct SegmentedController: View {
    
    var titles: [String]
    var segmentSize: CGFloat
    
    @Binding var selectedScreen: Int
    
    public init(titles: [String], selectedScreen: Binding<Int>) {
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

private struct content3: View {
    @State var screen: Int = 0
    
    var body: some View {
        ZStack {
            SegmentedController(titles: ["First", "Second", "Third", "Forth"], selectedScreen: $screen)
        }
    }
}

struct SegmentedControlPOC_Previews: PreviewProvider {
    static var previews: some View {
        content3()
    }
}

