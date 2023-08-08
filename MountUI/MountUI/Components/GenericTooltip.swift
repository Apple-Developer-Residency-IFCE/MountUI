//
//  GenericTooltip.swift
//  MountUI
//
//  Created by Ian Pacini on 04/08/23.
//

import SwiftUI

public enum Placement {
    case left, right
}

public enum TooltipWidth: CGFloat {
    case big = 359
    case small = 327
}

public enum TooltipHeight: CGFloat {
    case tall = 104
    case little = 72
}

public struct GenericTooltip: View {
    @Binding var isShowing: Bool
    
    @Environment(\.colorScheme) var colorScheme
    
    let iosiColor = Color.IosiColors.self
    
    let trianglePlacement: Placement
    
    let insideText: String
    let titleText: String?
    
    let rectangleWidth: CGFloat
    let rectangleHeight: CGFloat
    
    let hasTitle: Bool
    
    public init(isShowing: Binding<Bool>, trianglePlacement: Placement, insideText: String, titleText: String? = "") {
        self._isShowing = isShowing
        self.trianglePlacement = trianglePlacement
        self.insideText = insideText

        if titleText == "" {
            
            self.titleText = titleText
            self.rectangleWidth = TooltipWidth.small.rawValue
            self.rectangleHeight = TooltipHeight.little.rawValue
            self.hasTitle = false
                
            return
        }
        
        self.titleText = titleText
        self.rectangleWidth = TooltipWidth.big.rawValue
        self.rectangleHeight = TooltipHeight.tall.rawValue
        self.hasTitle = true
    }
    
    public var body: some View {
        
        VStack(spacing: -8){
            
            
            Triangle()
                .frame(width: 26, height: 18)
                .padding(trianglePlacement == .left ? .trailing : .leading, 229)
                .foregroundColor(iosiColor.getInfoColors(colorScheme: colorScheme, for: .under))
            
            
            
            ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(iosiColor.getInfoColors(colorScheme: colorScheme, for: .under))
                
                HStack{
                    if hasTitle {
                        VStack(alignment: .leading) {
                            Text(titleText ?? "No Title")
                                .iosiFont(size: .body, weight: .bold)
                                .foregroundColor(Color.IosiColors.iosiNeutral100)
                                .padding(.top, 19)
                                .padding(.bottom, 8)
                            
                            
                            Text(insideText)
                                .iosiFont(size: .footnote, weight: .regular)
                                .foregroundColor(Color.IosiColors.iosiNeutral100)
                                .padding(.bottom, 18)
                        }
                        .padding(.leading, 16)
                        
                    } else {
                        Text(insideText)
                            .iosiFont(size: .footnote, weight: .regular)
                            .foregroundColor(Color.IosiColors.iosiNeutral100)
                            .padding(.vertical, 18)
                            .padding(.leading, 16)
                    }
                    
                    Spacer()
                    
                    Button {
                        isShowing = false
                    } label: {
                        Image(systemName: IosiIcon.xmark.rawValue)
                            .foregroundColor(Color.IosiColors.iosiNeutral100)
                            .frame(width: 12, height: rectangleHeight)
                            .padding(.leading, 24)
                            .padding(.trailing, 16)
                    }
                }
            }
            .frame(width: rectangleWidth, height: rectangleHeight)
        }
    }
}

private struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()

        path.move(to: CGPoint(x: rect.midX - 3, y: rect.minY + 4))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX + 3, y: rect.minY + 4))
        path.addArc(center: CGPoint(x: rect.midX, y: rect.minY + 5.55), radius: CGFloat(3.31), startAngle: .degrees(0), endAngle: .degrees(-180), clockwise: true)
        
        return path
    }
    
}

struct content2: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State var isShowing = true
    
    var body: some View {
        GenericTooltip(isShowing: $isShowing, trianglePlacement: .left, insideText: "Tap the heart to add this session to your Favorites for easier access.", titleText: "Add to favourites")
    }
}

struct GenericTooltip_Previews: PreviewProvider {
    static var previews: some View {
        content2()
    }
}
