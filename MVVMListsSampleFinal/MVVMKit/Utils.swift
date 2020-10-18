//
//  Utils.swift
//  smb
//
//  Created by Isa Aliev on 26.09.2020.
//  Copyright © 2020 IA. All rights reserved.
//

import Foundation

public let executableName = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String

public func swiftClassFromString(_ className: String) -> AnyClass? {
    let moduleName = executableName.replacingOccurrences(of: " ", with: "_")
    
    return NSClassFromString(moduleName + "." + className)
}
