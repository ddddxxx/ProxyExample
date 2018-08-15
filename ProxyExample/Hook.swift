//
//  Hook.swift
//  ProxyExample
//
//  Created by noctis on 2018/8/15.
//  Copyright © 2018年 ddddxxx. All rights reserved.
//

import UIKit

extension TransparentProxy: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("didSelectRowAtIndexPath:\(indexPath.row)")
        if let target = target,
            target.responds(to: #selector(tableView(_:didSelectRowAt:))) {
            target.tableView(tableView, didSelectRowAt: indexPath)
        }
    }
}

extension UITableView {
    
    @objc private func _swizzle_setDelegate(_ delegate: Any?) {
        self._swizzle_setDelegate(delegate.map(proxy))
    }
    
    static let _swizzler_setDelegate: Void = {
        let m1 = class_getInstanceMethod(UITableView.self, #selector(setter: delegate))
        let m2 = class_getInstanceMethod(UITableView.self, #selector(_swizzle_setDelegate(_:)))
        method_exchangeImplementations(m1!, m2!)
    }()
}
