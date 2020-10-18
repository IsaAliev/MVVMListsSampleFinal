//
//  AppDelegate.swift
//  MVVMListsSampleStarter
//
//  Created by Isa Aliev on 04.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private var coordinator: AppLaunchCoordinator!
    var window: UIWindow?
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        setupWindow()
        coordinate()
        
        return true
    }
    
    private func setupWindow() {
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    private func coordinate() {
        coordinator = AppLaunchCoordinator(window!)
        coordinator.start()
    }
}

