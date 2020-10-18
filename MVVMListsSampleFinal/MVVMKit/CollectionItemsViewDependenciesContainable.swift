//
//  ViewDependecyInstallable.swift
//  smb
//
//  Created by Isa Aliev on 18.09.2020.
//  Copyright © 2020 IA. All rights reserved.
//

protocol CollectionItemsViewDependenciesContainable {
    var itemsDependencyManager: CollectionItemsViewModelDependencyManager? { get set }
}
