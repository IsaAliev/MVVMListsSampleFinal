//
//  ProfileViewItemsDependecyManager.swift
//  MVVMListsSampleFinal
//
//  Created by Isa Aliev on 18.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

import UIKit

struct ProfileViewItemsDependecyManager: CollectionItemsViewModelDependencyManager {
    let dependencies: [ViewDependency] = [
        .init("TextCell", withNib: false),
        .init("NamedImageCell", withNib: false),
        .init("AttributeCell", withNib: false),
        .init("TextHeaderView", viewKind: UICollectionView.elementKindSectionHeader)
    ]
    
    func resolveIdentifier(forModelTypeUsingUnusualNaming fullTypeName: String) -> String { "" }
}
