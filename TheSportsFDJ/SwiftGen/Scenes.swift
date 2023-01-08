//
//  Scenes.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 5/1/2023.
//

import Foundation
import UIKit

// MARK: - Storyboard Scenes

internal enum StoryboardScene {
    
    internal enum LaunchScreen: StoryboardType {
        internal static let storyboardName = "LaunchScreen"
        
        internal static let initialScene = InitialSceneType<UIKit.UIViewController>(storyboard: LaunchScreen.self)
    }
    
    internal enum Main: StoryboardType {
        internal static let storyboardName = "Main"
        
        internal static let splashScreenViewController = SceneType<SplashScreenViewController>(storyboard: Main.self, identifier: "SplashScreenViewController")
        
        internal static let homeViewController = SceneType<HomeViewController>(storyboard: Main.self, identifier: "HomeViewController")
        
        internal static let mainNVC = SceneType<UIKit.UINavigationController>(storyboard: Main.self, identifier: "MainNVC")
    }
    
    internal enum Details: StoryboardType {
        internal static let storyboardName = "Details"
        
        internal static let detailsViewController = SceneType<DetailsViewController>(storyboard: Details.self, identifier: "DetailsViewController")
    }
}

internal protocol StoryboardType {
    static var storyboardName: String { get }
}

internal extension StoryboardType {
    static var storyboard: UIStoryboard {
        let name = self.storyboardName
        return UIStoryboard(name: name, bundle: BundleToken.bundle)
    }
}

internal struct SceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    internal let identifier: String
    internal func instantiate() -> T {
        let identifier = self.identifier
        guard let controller = storyboard.storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("ViewController '\(identifier)' is not of the expected class \(T.self).")
        }
        return controller
    }
    
    @available(iOS 13.0, tvOS 13.0, *)
    internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
        return storyboard.storyboard.instantiateViewController(identifier: identifier, creator: block)
    }
}

internal struct InitialSceneType<T: UIViewController> {
    internal let storyboard: StoryboardType.Type
    internal func instantiate() -> T {
        guard let controller = storyboard.storyboard.instantiateInitialViewController() as? T else {
            fatalError("ViewController is not of the expected class \(T.self).")
        }
        return controller
    }
    
    @available(iOS 13.0, tvOS 13.0, *)
    internal func instantiate(creator block: @escaping (NSCoder) -> T?) -> T {
        guard let controller = storyboard.storyboard.instantiateInitialViewController(creator: block) else {
            fatalError("Storyboard \(storyboard.storyboardName) does not have an initial scene.")
        }
        return controller
    }
}

private final class BundleToken {
    static let bundle: Bundle = {
        return Bundle(for: BundleToken.self)
    }()
}
