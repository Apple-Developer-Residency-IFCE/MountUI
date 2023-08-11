//
//  ColorExtension.swift
//  MountUI
//
//  Created by Ian Pacini on 01/08/23.
//






import SwiftUI

public extension Color {
    
    struct IosiColors {
        
        public enum useOfColor {
        case under, onTop
        }
        
        public enum surfaceCountainerHeight {
            case lowest, low, regular, high, highest
        }
        
        
        public static let iosiPrimary90 = Color(red: 0.9098039269447327, green: 0.9490196108818054, blue: 1, opacity: 1)
        public static let iosiPrimary70 = Color(red: 0.2666666805744171, green: 0.5921568870544434, blue: 0.8392156958580017, opacity: 1)
        public static let iosiPrimary50 = Color(red: 0.16078431904315948, green: 0.3803921639919281, blue: 0.5843137502670288, opacity: 1)
        public static let iosiPrimary30 = Color(red: 0.08235294371843338, green: 0.23529411852359772, blue: 0.3490196168422699, opacity: 1)
        public static let iosiPrimary10 = Color(red: 0, green: 0.11372549086809158, blue: 0.19607843458652496, opacity: 1)
        
        public static let iosiSecondary90 = Color(red: 1, green: 0.9450980424880981, blue: 0.729411780834198, opacity: 1)
        public static let iosiSecondary70 = Color(red: 0.9803921580314636, green: 0.8901960849761963, blue: 0.4156862795352936, opacity: 1)
        public static let iosiSecondary50 = Color(red: 0.8235294222831726, green: 0.7137255072593689, blue: 0.01568627543747425, opacity: 1)
        public static let iosiSecondary30 = Color(red: 0.41960784792900085, green: 0.37254902720451355, blue: 0.10588235408067703, opacity: 1)
        public static let iosiSecondary10 = Color(red: 0.12941177189350128, green: 0.10588235408067703, blue: 0, opacity: 1)
        
        public static let iosiError90 = Color(red: 1, green: 0.8549019694328308, blue: 0.8509804010391235, opacity: 1)
        public static let iosiError70 = Color(red: 1, green: 0.7019608020782471, blue: 0.7019608020782471, opacity: 1)
        public static let iosiError50 = Color(red: 0.6705882549285889, green: 0.1764705926179886, blue: 0.14509804546833038, opacity: 1)
        public static let iosiError30 = Color(red: 0.40784314274787903, green: 0, blue: 0.08235294371843338, opacity: 1)
        public static let iosiError10 = Color(red: 0.250980406999588, green: 0, blue: 0.03529411926865578, opacity: 1)
        
        public static let iosiSuccess90 = Color(red: 0.8117647171020508, green: 1, blue: 0.658823549747467, opacity: 1)
        public static let iosiSuccess70 = Color(red: 0.6901960968971252, green: 0.9647058844566345, blue: 0.48235294222831726, opacity: 1)
        public static let iosiSuccess50 = Color(red: 0.45490196347236633, green: 0.7098039388656616, blue: 0.26274511218070984, opacity: 1)
        public static let iosiSuccess30 = Color(red: 0.16862745583057404, green: 0.3490196168422699, blue: 0.0313725508749485, opacity: 1)
        public static let iosiSuccess10 = Color(red: 0.04313725605607033, green: 0.125490203499794, blue: 0, opacity: 1)
        
        public static let iosiInfo90 = Color(red: 0.8541666865348816, green: 0.9538194537162781, blue: 1, opacity: 1)
        public static let iosiInfo70 = Color(red: 0.5254902243614197, green: 0.8470588326454163, blue: 0.9960784316062927, opacity: 1)
        public static let iosiInfo50 = Color(red: 0.21568627655506134, green: 0.6549019813537598, blue: 0.9882352948188782, opacity: 1)
        public static let iosiInfo30 = Color(red: 0.10588235408067703, green: 0.3803921639919281, blue: 0.7098039388656616, opacity: 1)
        public static let iosiInfo10 = Color(red: 0.03921568766236305, green: 0.1882352977991104, blue: 0.47058823704719543, opacity: 1)
        
        public static let iosiNeutral100 = Color(red: 1, green: 1, blue: 1, opacity: 1)
        public static let iosiNeutral95 = Color(red: 0.9490196108818054, green: 0.9490196108818054, blue: 0.9686274528503418, opacity: 1)
        public static let iosiNeutral93 = Color(red: 0.8980392217636108, green: 0.8980392217636108, blue: 0.9176470637321472, opacity: 1)
        public static let iosiNeutral90 = Color(red: 0.8196078538894653, green: 0.8196078538894653, blue: 0.8392156958580017, opacity: 1)
        public static let iosiNeutral80 = Color(red: 0.7803921699523926, green: 0.7803921699523926, blue: 0.800000011920929, opacity: 1)
        public static let iosiNeutral70 = Color(red: 0.6823529601097107, green: 0.6823529601097107, blue: 0.6980392336845398, opacity: 1)
        public static let iosiNeutral60 = Color(red: 0.5568627715110779, green: 0.5568627715110779, blue: 0.5764706134796143, opacity: 1)
        public static let iosiNeutral50 = Color(red: 0.38823530077934265, green: 0.38823530077934265, blue: 0.4000000059604645, opacity: 1)
        public static let iosiNeutral40 = Color(red: 0.2823529541492462, green: 0.2823529541492462, blue: 0.29019609093666077, opacity: 1)
        public static let iosiNeutral30 = Color(red: 0.22745098173618317, green: 0.22745098173618317, blue: 0.23529411852359772, opacity: 1)
        public static let iosiNeutral20 = Color(red: 0.1725490242242813, green: 0.1725490242242813, blue: 0.18039216101169586, opacity: 1)
        public static let iosiNeutral10 = Color(red: 0.10980392247438431, green: 0.10980392247438431, blue: 0.11764705926179886, opacity: 1)
        public static let iosiNeutral05 = Color(red: 0.07058823853731155, green: 0.07058823853731155, blue: 0.07058823853731155, opacity: 1)
        public static let iosiNeutralZero = Color(red: 0, green: 0, blue: 0, opacity: 1)
        
        public static let iosiGradientLight = LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(red: 0.9058823585510254, green: 0.9490196108818054, blue: 0.9843137264251709, opacity: 1), location: 0), Gradient.Stop(color: Color(red: 0.9960784316062927, green: 0.9882352948188782, blue: 0.9372549057006836, opacity: 1), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))
        public static let iosiGradientDark = LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(red: 0, green: 0.11372549086809158, blue: 0.19607843458652496, opacity: 1), location: 0), Gradient.Stop(color: Color(red: 0.11692707985639572, green: 0.09566760808229446, blue: 0, opacity: 1), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))
        
        private func isLightMode(_ colorScheme: ColorScheme) -> Bool {
            return colorScheme == .light ? true : false
        }
        
        public static func getPrimaryColors(colorScheme: ColorScheme, for useOfColor: useOfColor) -> Color {
            if Color.IosiColors().isLightMode(colorScheme) {
                return useOfColor == .under ? Color.IosiColors.iosiPrimary10 : Color.IosiColors.iosiNeutral100
            } else {
                return useOfColor == .under ? Color.IosiColors.iosiPrimary70 : Color.IosiColors.iosiNeutral100
            }
        }
        
        public static func getSuccesColors(colorScheme: ColorScheme, for useOfColor: useOfColor) -> Color {
            if Color.IosiColors().isLightMode(colorScheme) {
                return useOfColor == .under ? Color.IosiColors.iosiSuccess30 : Color.IosiColors.iosiNeutral100
            } else {
                return useOfColor == .under ? Color.IosiColors.iosiSuccess30 : Color.IosiColors.iosiNeutral100
            }
        }
        
        public static func getProgressColors(colorScheme: ColorScheme, for useOfColor: useOfColor) -> Color {
            if Color.IosiColors().isLightMode(colorScheme) {
                return useOfColor == .under ? Color.IosiColors.iosiNeutral50 : Color.IosiColors.iosiNeutral50
            } else {
                return useOfColor == .under ? Color.IosiColors.iosiSuccess50 : Color.IosiColors.iosiSuccess50
            }
        }
        
        public static func getErrorColors(colorScheme: ColorScheme, for useOfColor: useOfColor) -> Color {
            if Color.IosiColors().isLightMode(colorScheme) {
                return useOfColor == .under ? Color.IosiColors.iosiError50 : Color.IosiColors.iosiNeutral100
            } else {
                return useOfColor == .under ? Color.IosiColors.iosiError50 : Color.IosiColors.iosiNeutral100
            }
        }
        
        public static func getInfoColors(colorScheme: ColorScheme, for useOfColor: useOfColor) -> Color {
            if Color.IosiColors().isLightMode(colorScheme) {
                return useOfColor == .under ? Color.IosiColors.iosiInfo50 : Color.IosiColors.iosiNeutral100
            } else {
                return useOfColor == .under ? Color.IosiColors.iosiInfo30 : Color.IosiColors.iosiNeutral100
            }
        }
        
        public static func getSurfaceContainerColor(colorScheme: ColorScheme, height: surfaceCountainerHeight) -> Color {
            switch height {
            case .lowest:
                return Color.IosiColors.iosiNeutral100
            case .low:
                return Color.IosiColors.iosiNeutral93
            case .regular:
                return Color.IosiColors.iosiNeutral40
            case .high:
                return Color.IosiColors.iosiNeutral10
            case .highest:
                return Color.IosiColors.iosiNeutralZero
            }
        }
    }
}



