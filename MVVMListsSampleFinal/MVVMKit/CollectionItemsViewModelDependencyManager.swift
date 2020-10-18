//
//  CollectionItemsViewModelDependencyManager.swift
//  smb
//
//  Created by Isa Aliev on 26.09.2020.
//  Copyright © 2020 IA. All rights reserved.
//

import Foundation
import UIKit

protocol CollectionItemsViewModelDependencyManager {
    var dependencies: [ViewDependency] { get }
    
    func mapModelTypeNameToIdentifier(_ fullTypeName: String) -> String
    func reuseIdentifier(for model: CollectionItemViewModel) -> String
    func resolveIdentifier(forModelTypeUsingUnusualNaming fullTypeName: String) -> String
}

extension CollectionItemsViewModelDependencyManager {
    func reuseIdentifier(for model: CollectionItemViewModel) -> String {
        let typeName = String(describing: type(of: model))
        
        return mapModelTypeNameToIdentifier(typeName)
    }
    
    func mapModelTypeNameToIdentifier(_ fullTypeName: String) -> String {
        guard fullTypeName.hasSuffix("Model") else {
            return resolveIdentifier(forModelTypeUsingUnusualNaming: fullTypeName)
        }
        
        let typeName = String(fullTypeName.split(separator: ".").last!)
        let modelTailTrimmedName = typeName.dropLast(5)
                
        return String(modelTailTrimmedName)
    }
}

extension CollectionItemsViewModelDependencyManager {
    func install(on tableView: UITableView) {
        dependencies.forEach({
            tableView.register($0.classType,
                               forCellReuseIdentifier: $0.identifier)
            
            if $0.withNib {
                tableView.register(UINib(nibName: $0.nibName, bundle: nil),
                                   forCellReuseIdentifier: $0.identifier)
            }
        })
    }
    
    func install(on collectionView: UICollectionView) {
        dependencies.forEach({
            guard $0.isCell else {
                collectionView.register($0.classType,
                                        forSupplementaryViewOfKind: $0.kind,
                                        withReuseIdentifier: $0.identifier)
                
                return
            }
            
            collectionView.register($0.classType,
                                    forCellWithReuseIdentifier: $0.identifier)
            
            if $0.withNib {
                collectionView.register(UINib(nibName: $0.nibName, bundle: nil),
                                        forCellWithReuseIdentifier: $0.identifier)
            }
        })
    }
}

