//
//  ProfileViewController.swift
//  MVVMListsSampleStarter
//
//  Created by Isa Aliev on 17.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

import UIKit
import RxSwift

class ProfileViewController:
    UICollectionViewController,
    ViewRepresentable,
    RxDataSourceRepresentableView
{
    var model: ProfileViewModel!
    
    lazy var dataProvider: RxDataSourceProvider! = model
    var itemsDependencyManager: CollectionItemsViewModelDependencyManager?
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionDataSource()
        model.setup()
        configureCollectionView()
    }
    
    convenience init() {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .vertical
        
        self.init(collectionViewLayout: layout)
    }
    
    func bindWithModel() { }
    
    private func configureCollectionView() {
        collectionView.backgroundColor = .white
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        referenceSizeForHeaderInSection section: Int
    ) -> CGSize {
        .init(width: 1.0, height: 30.0)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = collectionView.frame.width - collectionView.contentInset.left * 2.0
        
        return .init(width: width, height: 50.0)
    }
}
