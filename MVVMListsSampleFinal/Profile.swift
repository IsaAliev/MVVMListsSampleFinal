//
//  Profile.swift
//  MVVMListsSampleStarter
//
//  Created by Isa Aliev on 17.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

struct Profile: Codable {
    struct Attribute: Codable {
        let name: String
        let value: String
    }
    
    let name: String
    let imageFileName: String
    let about: String
    let attributes: [Attribute]
}
