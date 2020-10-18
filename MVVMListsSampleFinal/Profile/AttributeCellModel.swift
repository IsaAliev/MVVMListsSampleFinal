//
//  AttributeCellModel.swift
//  MVVMListsSampleFinal
//
//  Created by Isa Aliev on 18.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

class AttributeCellModel: CollectionItemViewModel {
    let name: String
    let value: String
    
    init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
