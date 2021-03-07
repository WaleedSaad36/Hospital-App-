//
//  UIFont+extension.swift
//  TODOApp-MVC-Demo
//
//  Created by AbeerSharaf on 11/25/20.
//  Copyright © 2020 IDEAEG. All rights reserved.
//

import Foundation
import UIKit
extension UIFont {
    
        enum AppFont : String {
            case Regular    = "PTSans"
            case Heavy      = "PTSans-Heavy"
            case Light      = "PTSans-Light"
            case ExtraLight = "PTSans-ExtraLight"
            case Medium     = "PTSans-Medium"
            case Bold       = "PTSans-Bold"
        }

        convenience init(named name: AppFont, size:CGFloat) {
            self.init(name:name.rawValue, size:size)!
        }

    public enum OpenSansType: String {
        case extraboldItalic = "-ExtraboldItalic"
        case semiboldItalic = "-SemiboldItalic"
        case semibold = "-Semibold"
        case regular = ""
        case lightItalic = "Light-Italic"
        case light = "-Light"
        case italic = "-Italic"
        case extraBold = "-Extrabold"
        case boldItalic = "-BoldItalic"
        case bold = "-Bold"
    }

    static func openSans(_ type: OpenSansType = .regular, size: CGFloat = UIFont.systemFontSize) -> UIFont {
        return UIFont(name: "OpenSans\(type.rawValue)", size: size)!
    }

    var isBold: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitBold)
    }

    var isItalic: Bool {
        return fontDescriptor.symbolicTraits.contains(.traitItalic)
    }

}

