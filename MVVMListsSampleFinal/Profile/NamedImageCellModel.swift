//
//  NamedImageCellModel.swift
//  MVVMListsSampleFinal
//
//  Created by Isa Aliev on 18.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

class NamedImageCellModel: CollectionItemViewModel {
    let name: String
    let imageFilePath: String
    
    init(name: String, imageFilePath: String) {
        self.name = name
        self.imageFilePath = imageFilePath
    }
}
