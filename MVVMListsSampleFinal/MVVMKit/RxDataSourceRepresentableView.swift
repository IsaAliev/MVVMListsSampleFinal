//
//  RxDataSourceRepresentableView.swift
//  smb
//
//  Created by Isa Aliev on 28.09.2020.
//  Copyright © 2020 IA. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxDataSources

struct EmptyModel: CollectionItemViewModel { }

protocol RxDataSourceProvider {
    var collectionData: BehaviorSubject<[SectionData]> { get }
}

protocol RxDataSourceRepresentableView: CollectionItemsViewDependenciesContainable {
    var dataProvider: RxDataSourceProvider! { get }
    var disposeBag: DisposeBag { get }
}

extension RxDataSourceRepresentableView {
    func itemModel(at indexPath: IndexPath) -> CollectionItemViewModel? {
        guard let data = try? dataProvider.collectionData.value() else {
            return nil
        }
        
        return data[indexPath.section].items[indexPath.row]
    }
}

extension RxDataSourceRepresentableView where Self: UICollectionViewController {
    func configureCollectionDataSource(
        withPreReturnHandler preReturnHandler: PreReturnHandler? = nil
    ) {
        collectionView.dataSource = nil
        
        guard let manager = itemsDependencyManager else {
            return
        }
        
        manager.install(on: collectionView)
        let dataSource = RxCollectionViewSectionedReloadDataSource<SectionData>
            .default(with: manager, preReturnHandler: preReturnHandler)
        
        dataProvider.collectionData.bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

extension RxDataSourceRepresentableView where Self: UITableViewController {
    func configureCollectionDataSource() {
        tableView.dataSource = nil
        
        guard let manager = itemsDependencyManager else {
            return
        }
        
        manager.install(on: tableView)
        let dataSource = RxTableViewSectionedReloadDataSource<SectionData>.default(with: manager)
        
        dataProvider.collectionData
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }
}

