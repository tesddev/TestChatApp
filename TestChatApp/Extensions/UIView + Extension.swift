//
//  UIView + Extension.swift
//  TestChatApp
//
//  Created by Tes on 21/05/2023.
//

import UIKit

extension UIView {

    public var viewWidth: CGFloat {
        return frame.size.width
    }

    public var viewHeight: CGFloat {
        return frame.size.height
    }

    public var viewTop: CGFloat {
        return frame.origin.y
    }

    public var viewBottom: CGFloat {
        return frame.size.height + frame.origin.y
    }

    public var viewLeft: CGFloat {
        return frame.origin.x
    }

    public var viewRight: CGFloat {
        return frame.size.width + frame.origin.x
    }

}
