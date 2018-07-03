//
//  ExtensionController.swift
//  Cowalker
//
//  Created by 조예원 on 2018. 7. 3..
//  Copyright © 2018년 조예원. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func gsno(_ value: String?) -> String {
        return value ?? ""
    }
    
    func gino(_ value: Int?) -> Int {
        return value ?? 0
    }
}

extension NSObject {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

