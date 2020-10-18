//
//  ViewDependecy.swift
//  smb
//
//  Created by Isa Aliev on 18.09.2020.
//  Copyright © 2020 IA. All rights reserved.
//

import Foundation

struct ViewDependency: ExpressibleByStringLiteral {
    typealias StringLiteralType = String
    
    var nibName: String
    var identifier: String
    var classType: AnyClass
    var withNib = true
    var isCell = true
    var kind = ""
    
    init(stringLiteral value: String) {
        classType = swiftClassFromString(value)!
        identifier = value
        nibName = value
        withNib = false
    }
    
    init(_ className: String, viewKind: String) {
        isCell = false
        kind = viewKind
        identifier = className
        classType = swiftClassFromString(className)!
        self.identifier = className
        nibName = ""
    }
    
    init(_ className: String, viewKind: String, for identifier: String) {
        isCell = false
        kind = viewKind
        classType = swiftClassFromString(className)!
        self.identifier = identifier
        nibName = ""
    }
    
    init(_ id: String, withNib: Bool = true) {
        classType = swiftClassFromString(id)!
        identifier = id
        nibName = id
        self.withNib = withNib
    }
    
    init(_ className: String, identifier: String) {
        self.init(identifier)
        classType = swiftClassFromString(className)!
    }
    
    init(_ className: String, identifier: String, nibName: String) {
        classType = swiftClassFromString(className)!
        self.identifier = identifier
        self.nibName = nibName
    }
}
