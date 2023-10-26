//
//  ColorExtension.swift
//  MountUI
//
//  Created by Ian Pacini on 01/08/23.
//

import SwiftUI

public extension Color {

    // MARK: - Color scheme customizado

    enum IosiColorScheme: String, CaseIterable {
        case light
        case dark
        case midTone
        case system

        public static func fromIosiToColorscheme(_ from: IosiColorScheme) -> ColorScheme {
            switch from {
            case .light:
                return .light
            case .dark:
                return .dark
            case .midTone:
                return .dark
            case .system:
                return .light
            }
        }

        public static func fromColorschemeToIosi(_ from: ColorScheme) -> IosiColorScheme {
            switch from {
            case .light:
                return .light
            case .dark:
                return .dark
            @unknown default:
                return .light
            }
        }

        public static func == (lhs: IosiColorScheme, rhs: IosiColorScheme) -> Bool {
            return lhs.rawValue == rhs.rawValue
        }

        public static let allCases: [Color.IosiColorScheme] = [.light, .dark, .midTone, .system]
    }

    struct IosiColors {

        // MARK: - Casos de uso de cores mapeados

        public enum UseOfColor {
            case background, text
        }

        public enum UseOfColorWSubtext {
            case background, text, subtext
        }
        
        public enum UseOfColorStatus {
            case expired, canceled, info, success, error
        }

        public enum UseOfColorWSelection {
            case background, selected, nonselected
        }

        public enum UseOfColorButtonType {
            case background, text, subtext, onclick
        }

        // MARK: - Cores

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
        public static let iosiError70 = Color(red: 1, green: 0.4124999940395355, blue: 0.4124999940395355, opacity: 1)
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
        public static let iosiNeutral45 = Color(red: 0.3294117748737335, green: 0.3294117748737335, blue: 0.3294117748737335, opacity: 1)
        public static let iosiNeutral40 = Color(red: 0.2823529541492462, green: 0.2823529541492462, blue: 0.29019609093666077, opacity: 1)
        public static let iosiNeutral30 = Color(red: 0.22745098173618317, green: 0.22745098173618317, blue: 0.23529411852359772, opacity: 1)
        public static let iosiNeutral20 = Color(red: 0.1725490242242813, green: 0.1725490242242813, blue: 0.18039216101169586, opacity: 1)
        public static let iosiNeutral10 = Color(red: 0.10980392247438431, green: 0.10980392247438431, blue: 0.11764705926179886, opacity: 1)
        public static let iosiNeutral05 = Color(red: 0.07058823853731155, green: 0.07058823853731155, blue: 0.07058823853731155, opacity: 1)
        public static let iosiNeutralZero = Color(red: 0, green: 0, blue: 0, opacity: 1)

        public static let iosiNearNeutral30 = Color(red: 0.12156862765550613, green: 0.125490203499794, blue: 0.16078431904315948, opacity: 1)
        public static let iosiNearNeutral10 = Color(red: 0.07058823853731155, green: 0.07450980693101883, blue: 0.10196078568696976, opacity: 1)

        // MARK: - Gradientes

        public static let iosiGradientLight = LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(red: 0.9058823585510254, green: 0.9490196108818054, blue: 0.9843137264251709, opacity: 1), location: 0), Gradient.Stop(color: Color(red: 0.9960784316062927, green: 0.9882352948188782, blue: 0.9372549057006836, opacity: 1), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))
        public static let iosiGradientDark = LinearGradient(gradient: Gradient(stops: [Gradient.Stop(color: Color(red: 0, green: 0.11372549086809158, blue: 0.19607843458652496, opacity: 1), location: 0), Gradient.Stop(color: Color(red: 0.11692707985639572, green: 0.09566760808229446, blue: 0, opacity: 1), location: 1)]), startPoint: UnitPoint(x: 0.5, y: 0), endPoint: UnitPoint(x: 0.5, y: 1))

        // MARK: - Funções

        public static func gradientColors(_ colorScheme: IosiColorScheme) -> LinearGradient {
            switch colorScheme {
            case .light:
                return iosiGradientLight
            case .dark:
                fallthrough
            case .midTone:
                return iosiGradientDark
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return gradientColors(.light)
                case .dark:
                    return gradientColors(.dark)
                @unknown default:
                    return gradientColors(.light)
                }
            }
        }

        public static func smallLabelColorInfo(_ colorScheme: IosiColorScheme) -> Color {
            switch colorScheme {
            case .light:
                return iosiInfo30
            case .dark:
                return iosiInfo50
            case .midTone:
                return iosiInfo50
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return smallLabelColorInfo(.light)
                case .dark:
                    return smallLabelColorInfo(.dark)
                @unknown default:
                    return smallLabelColorInfo(.light)
                }
            }
        }

        public static func normalizedStatusLabelsColors(_ colorScheme: IosiColorScheme, for use: UseOfColorStatus) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .expired:
                    return iosiNeutral80
                case .canceled:
                    return iosiNeutral45
                case .info:
                    return iosiPrimary50
                case .success:
                    return iosiSuccess30
                case .error:
                    return iosiError50
                }
            case .dark:
                fallthrough
            case .midTone:
                switch use {
                case .expired:
                    return iosiNeutral30
                case .canceled:
                    return iosiNeutral90
                case .info:
                    return iosiInfo50
                case .success:
                    return iosiSuccess50
                case .error:
                    return iosiSuccess70
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return normalizedStatusLabelsColors(.light, for: use)
                case .dark:
                    return normalizedStatusLabelsColors(.dark, for: use)
                @unknown default:
                    return normalizedStatusLabelsColors(.light, for: use)
                }
            }
        }

        public static func quizCardColor(_ colorScheme: IosiColorScheme, for use: UseOfColorWSubtext) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral100
                case .text:
                    return iosiNeutral10
                case .subtext:
                    return iosiNeutral50
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutral10
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return quizCardColor(.light, for: use)
                case .dark:
                    return quizCardColor(.dark, for: use)
                @unknown default:
                    return quizCardColor(.light, for: use)
                }
            }
        }

        public static func liveClassCardColors(_ colorScheme: IosiColorScheme, for use: UseOfColorWSubtext) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral100
                case .text:
                    return iosiNeutral10
                case .subtext:
                    return iosiNeutral50
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutral10
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral93
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral93
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return liveClassCardColors(.light, for: use)
                case .dark:
                    return liveClassCardColors(.dark, for: use)
                @unknown default:
                    return liveClassCardColors(.light, for: use)
                }
            }
        }

        public static func tabBarColors(_ colorScheme: IosiColorScheme, for use: UseOfColorWSelection) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral100
                case .selected:
                    return iosiPrimary30
                case .nonselected:
                    return iosiNeutral60
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutralZero
                case .selected:
                    return iosiPrimary70
                case .nonselected:
                    return iosiNeutral80
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral10
                case .selected:
                    return iosiPrimary70
                case .nonselected:
                    return iosiNeutral80
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return tabBarColors(.light, for: use)
                case .dark:
                    return tabBarColors(.dark, for: use)
                @unknown default:
                    return tabBarColors(.light, for: use)
                }
            }
        }

        public static func calendarColors(_ colorScheme: IosiColorScheme, for use: UseOfColorWSubtext) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral100
                case .text:
                    return iosiNeutralZero
                case .subtext:
                    return iosiNeutral30
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutral20
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return calendarColors(.light, for: use)
                case .dark:
                    return calendarColors(.dark, for: use)
                @unknown default:
                    return calendarColors(.light, for: use)
                }
            }
        }

        public static func filterSheetColors(_ colorScheme: IosiColorScheme, for use: UseOfColorWSubtext) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral70
                case .text:
                    return iosiPrimary10
                case .subtext:
                    return iosiNeutral70
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutral10
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral95
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral95
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return filterSheetColors(.light, for: use)
                case .dark:
                    return filterSheetColors(.dark, for: use)
                @unknown default:
                    return filterSheetColors(.light, for: use)
                }
            }
        }

        public static func labelButtonColors(_ colorScheme: IosiColorScheme, for use : UseOfColorButtonType) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral100
                case .text:
                    return iosiNeutralZero
                case .subtext:
                    return iosiNeutral80
                case .onclick:
                    return iosiNeutral90
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutral40
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                case .onclick:
                    return iosiNeutral60
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                case .onclick:
                    return iosiNearNeutral30.opacity(0.9)
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return labelButtonColors(.light, for: use)
                case .dark:
                    return labelButtonColors(.dark, for: use)
                @unknown default:
                    return labelButtonColors(.light, for: use)
                }
            }
        }

        public static func sheetButtonsColors(_ colorScheme: IosiColorScheme, for use : UseOfColorButtonType) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral100
                case .text:
                    return iosiError50
                case .subtext:
                    return iosiError50
                case .onclick:
                    return iosiNeutral95
                }
            case .dark:
                fallthrough
            case .midTone:
                switch use {
                case .background:
                    return iosiNeutral40
                case .text:
                    return iosiError70
                case .subtext:
                    return iosiError70
                case .onclick:
                    return iosiNeutral60
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return sheetButtonsColors(.light, for: use)
                case .dark:
                    return sheetButtonsColors(.dark, for: use)
                @unknown default:
                    return sheetButtonsColors(.light, for: use)
                }
            }
        }

        public static func materialButtonsColors(_ colorScheme: IosiColorScheme, for use : UseOfColorButtonType) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral100
                case .text:
                    return iosiPrimary30
                case .subtext:
                    return iosiNeutral30
                case .onclick:
                    return iosiNeutral95
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutralZero
                case .text:
                    return iosiInfo50
                case .subtext:
                    return iosiNeutral80
                case .onclick:
                    return iosiNeutral30
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiInfo50
                case .subtext:
                    return iosiNeutral80
                case .onclick:
                    return iosiNeutral80
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return materialButtonsColors(.light, for: use)
                case .dark:
                    return materialButtonsColors(.dark, for: use)
                @unknown default:
                    return materialButtonsColors(.light, for: use)
                }
            }
        }

        public static func quizLabelColors(_ colorScheme: IosiColorScheme, for use : UseOfColorWSubtext) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral93
                case .text:
                    return iosiNeutralZero
                case .subtext:
                    return iosiNeutral50
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutralZero
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return quizLabelColors(.light, for: use)
                case .dark:
                    return quizLabelColors(.dark, for: use)
                @unknown default:
                    return quizLabelColors(.light, for: use)
                }
            }
        }

        public static func courseClassButtonColors(_ colorScheme: IosiColorScheme, for use : UseOfColorButtonType) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral93
                case .text:
                    return iosiPrimary30
                case .subtext:
                    return iosiNeutral50
                case .onclick:
                    return iosiNeutral95
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutralZero
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                case .onclick:
                    return iosiNeutral30
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral80
                case .onclick:
                    return iosiNearNeutral30.opacity(0.9)
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return courseClassButtonColors(.light, for: use)
                case .dark:
                    return courseClassButtonColors(.dark, for: use)
                @unknown default:
                    return courseClassButtonColors(.light, for: use)
                }
            }
        }

        public static func paymentListLabelColors(_ colorScheme: IosiColorScheme, for use : UseOfColorWSubtext) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral100
                case .text:
                    return iosiNeutralZero
                case .subtext:
                    return iosiNeutral45
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutral10
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral90
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiNeutral90
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return paymentListLabelColors(.light, for: use)
                case .dark:
                    return paymentListLabelColors(.dark, for: use)
                @unknown default:
                    return paymentListLabelColors(.light, for: use)
                }
            }
        }
//
//        public static func textFieldColors(_ colorScheme: IosiColorScheme, for use: UseOfColorWSubtext) -> Color {
//            switch colorScheme {
//            case .light:
//                switch use {
//                case .background:
//                    return iosiNeutral95
//                case .text:
//                    return iosiNeutral50
//                case .subtext:
//                    return iosiPrimary30
//                }
//            case .dark:
//                switch use {
//                case .background:
//                    return iosiNeutral10
//                case .text:
//                    return iosiNeutral93
//                case .subtext:
//                    return iosiNeutral60
//                }
//            case .midTone:
//                switch use {
//                case .background:
//                    return iosiNearNeutral30
//                case .text:
//                    return iosiNeutral93
//                case .subtext:
//                    return iosiNeutral60
//                }
//            case .system:
//                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
//                case .light:
//                    return textFieldColors(.light, for: use)
//                case .dark:
//                    return textFieldColors(.dark, for: use)
//                @unknown default:
//                    return textFieldColors(.light, for: use)
//                }
//            }
//        }

        public static func fileFieldColors(_ colorScheme: IosiColorScheme, for use: UseOfColorButtonType) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral95
                case .text:
                    return iosiPrimary30
                case .subtext:
                    return iosiNeutral50
                case .onclick:
                    return iosiNeutral80
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutral10
                case .text:
                    return iosiPrimary70
                case .subtext:
                    return iosiNeutral80
                case .onclick:
                    return iosiNeutral40
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiPrimary70
                case .subtext:
                    return iosiNeutral80
                case .onclick:
                    return iosiNeutral60
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return fileFieldColors(.light, for: use)
                case .dark:
                    return fileFieldColors(.dark, for: use)
                @unknown default:
                    return fileFieldColors(.light, for: use)
                }
            }
        }

        public static func genericButtonColors(_ colorScheme: IosiColorScheme, for use: UseOfColorWSubtext) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiPrimary10
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiPrimary10
                }
            case .dark:
                fallthrough
            case .midTone:
                switch use {
                case .background:
                    return iosiPrimary70
                case .text:
                    return iosiNeutral100
                case .subtext:
                    return iosiPrimary70
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return genericButtonColors(.light, for: use)
                case .dark:
                    return genericButtonColors(.dark, for: use)
                @unknown default:
                    return genericButtonColors(.light, for: use)
                }
            }
        }

        public static func greenSnackBarColors(_ colorScheme: IosiColorScheme, for use: UseOfColor) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiSuccess30
                case .text:
                    return iosiNeutral100
                }
            case .dark:
                fallthrough
            case .midTone:
                switch use {
                case .background:
                    return iosiSuccess70
                case .text:
                    return iosiNeutralZero
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return greenSnackBarColors(.light, for: use)
                case .dark:
                    return greenSnackBarColors(.dark, for: use)
                @unknown default:
                    return greenSnackBarColors(.light, for: use)
                }
            }
        }

        public static func redSnackBarColors(_ colorScheme: IosiColorScheme, for use: UseOfColor) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiError50
                case .text:
                    return iosiNeutral100
                }
            case .dark:
                fallthrough
            case .midTone:
                switch use {
                case .background:
                    return iosiError70
                case .text:
                    return iosiNeutralZero
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return redSnackBarColors(.light, for: use)
                case .dark:
                    return redSnackBarColors(.dark, for: use)
                @unknown default:
                    return redSnackBarColors(.light, for: use)
                }
            }
        }

        public static func textfieldColors(_ colorScheme: IosiColorScheme, for use: UseOfColor) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiNeutral93
                case .text:
                    return iosiNeutral45
                }
            case .dark:
                switch use {
                case .background:
                    return iosiNeutral10
                case .text:
                    return iosiNeutral93
                }
            case .midTone:
                switch use {
                case .background:
                    return iosiNearNeutral30
                case .text:
                    return iosiNeutral93
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return textfieldColors(.light, for: use)
                case .dark:
                    return textfieldColors(.dark, for: use)
                @unknown default:
                    return textfieldColors(.light, for: use)
                }
            }
        }

        public static func tooltipColors(_ colorScheme: IosiColorScheme, for use: UseOfColor) -> Color {
            switch colorScheme {
            case .light:
                switch use {
                case .background:
                    return iosiInfo50
                case .text:
                    return iosiNeutral100
                }
            case .dark:
                fallthrough
            case .midTone:
                switch use {
                case .background:
                    return iosiInfo30
                case .text:
                    return iosiNeutral100
                }
            case .system:
                switch Color.IosiColorScheme.fromIosiToColorscheme(colorScheme) {
                case .light:
                    return tooltipColors(.light, for: use)
                case .dark:
                    return tooltipColors(.dark, for: use)
                @unknown default:
                    return tooltipColors(.light, for: use)
                }
            }
        }
    }
}
