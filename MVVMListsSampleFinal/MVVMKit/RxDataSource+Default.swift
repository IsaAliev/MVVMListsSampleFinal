//
//  RxDataSource+Default.swift
//  smb
//
//  Created by Isa Aliev on 17.09.2020.
//  Copyright © 2020 IA. All rights reserved.
//

import RxDataSources
import UIKit

typealias SectionData = SectionModel<CollectionItemViewModel, CollectionItemViewModel>

typealias PreReturnHandler = (
    CollectionViewSectionedDataSource<SectionData>,
    IndexPath,
    UICollectionViewCell
    ) -> Void

extension RxCollectionViewSectionedReloadDataSource {
    static func `default`(
        with manager: CollectionItemsViewModelDependencyManager,
        preReturnHandler: PreReturnHandler? = nil
    ) -> RxCollectionViewSectionedReloadDataSource<SectionData> {
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionData>(
            configureCell: { dataSource, collectionView, indexPath, item in
                // 1
                let identifier = manager.reuseIdentifier(for: item)
                
                // 2
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: identifier,
                    for: indexPath
                    ) as! ViewModelTypeErasedViewRepresentable & UICollectionViewCell
                // 3
                cell.typeErasedViewModel = item
                
                // 4
                if var dependecyInstallableView = cell as? CollectionItemsViewDependenciesContainable,
                    dependecyInstallableView.itemsDependencyManager == nil {
                    dependecyInstallableView.itemsDependencyManager = manager
                }
                
                // 5
                preReturnHandler?(dataSource, indexPath, cell)
                
                return cell
        })
        
        dataSource.configureSupplementaryView = { dataSource, collectionView, kind, indexPath in
            let sectionModel = dataSource.sectionModels[indexPath.section].model
            let identifier = manager.reuseIdentifier(for: sectionModel)	
            let view = collectionView
                .dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                  withReuseIdentifier: identifier,
                                                  for: indexPath)
            
            (view as? ViewModelTypeErasedViewRepresentable)?.typeErasedViewModel = sectionModel
            
            return view
        }
        
        return dataSource
    }
}

extension RxTableViewSectionedReloadDataSource {
    static func `default`(
        with manager: CollectionItemsViewModelDependencyManager
    ) -> RxTableViewSectionedReloadDataSource<SectionData> {
        
        let dataSource = RxTableViewSectionedReloadDataSource<SectionData>(
            configureCell: { (_, tableView, indexPath, item) -> UITableViewCell in
                let identifier = manager.reuseIdentifier(for: item)
                let cell = tableView.dequeueReusableCell(
                    withIdentifier: identifier,
                    for: indexPath
                    ) as! ViewModelTypeErasedViewRepresentable & UITableViewCell
                cell.typeErasedViewModel = item
                
                return cell
        }
        )
        
        return dataSource
    }
}
