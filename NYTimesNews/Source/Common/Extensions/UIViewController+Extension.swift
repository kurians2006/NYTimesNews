//
//  UIViewController+Extension.swift
//  NYTimesNews
//
//  Created by Naeem Paracha on 13/10/2021.
//

import Foundation
import UIKit
extension UIViewController {
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        guard let controller = storyboard.instantiateViewController(withIdentifier: identifier) as? T else { return T() }
        return controller
    }
    class func controllerFromStoryboard(_ storyboard: String) -> Self {
        return controllerInStoryboard(UIStoryboard(name: storyboard, bundle: nil), identifier: nameOfClass)
    }
    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        return instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    class func controllerInStoryboard(_ storyboard: UIStoryboard) -> Self {
        return controllerInStoryboard(storyboard, identifier: nameOfClass)
    }
}


extension NSObject {
    class var nameOfClass: String {
    return NSStringFromClass(self).components(separatedBy: ".").last!
  }
}
