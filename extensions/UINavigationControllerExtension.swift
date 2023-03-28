//
//  File.swift
//  
//
//  Created by 최명근 on 2023/03/28.
//

import Foundation
import UIKit

extension UINavigationController {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = nil
    }
}
