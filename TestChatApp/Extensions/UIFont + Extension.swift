//
//  UIFont + Extension.swift
//  TestChatApp
//
//  Created by Tes on 17/05/2023.
//

import UIKit

extension UIFont {
    
    func useInterFont(ofSize: Int, weight: FontWeight) -> UIFont {
        switch weight {
        case .regular:
            return UIFont(name: "Inter-Regular", size: CGFloat(ofSize)) ?? UIFont()
        case .medium:
            return UIFont(name: "Inter-Medium", size: CGFloat(ofSize)) ?? UIFont()
        case .bold:
            return UIFont(name: "Inter-Bold", size: CGFloat(ofSize)) ?? UIFont()
        case .light:
            return UIFont(name: "Inter-Light", size: CGFloat(ofSize)) ?? UIFont()
        case .semiBold:
            return UIFont(name: "Inter-SemiBold", size: CGFloat(ofSize)) ?? UIFont()
        }
    }
    
    enum FontWeight {
        case regular
        case medium
        case bold
        case light
        case semiBold
    }
}

