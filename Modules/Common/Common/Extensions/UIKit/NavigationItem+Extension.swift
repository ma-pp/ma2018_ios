//
//  NavigationItem+Extension.swift
//  Common
//
//  Created by PondokiOS on 11/3/18.
//  Copyright © 2018 PondokiOS. All rights reserved.
//

import UIKit

public extension UINavigationItem {
    public func defaultBackBarButton(_ target: Any, selector: Selector) {
        let backImage = UIImage(
            named: "back_button",
            in: Constant.bundle,
            compatibleWith: nil
        )
        
        let backBarButtonItem = UIBarButtonItem(
            image: backImage,
            style: .plain,
            target: target,
            action: selector
        )
        self.leftBarButtonItem = backBarButtonItem
    }
    
    public func defaultDoneBarButton(_ target: Any, selector: Selector) {
        let doneImage = UIImage(
            named: "done_button",
            in: Constant.bundle,
            compatibleWith: nil
        )
        
        let doneBarButtonItem = UIBarButtonItem(
            image: doneImage,
            style: .plain,
            target: target,
            action: selector
        )
        self.rightBarButtonItem = doneBarButtonItem
    }
    
    public func defaultCloseBarButton(_ target: Any, selector: Selector) {
        let doneImage = UIImage(
            named: "close_button",
            in: Constant.bundle,
            compatibleWith: nil
        )
        
        let doneBarButtonItem = UIBarButtonItem(
            image: doneImage,
            style: .plain,
            target: target,
            action: selector
        )
        self.rightBarButtonItem = doneBarButtonItem
    }
}
