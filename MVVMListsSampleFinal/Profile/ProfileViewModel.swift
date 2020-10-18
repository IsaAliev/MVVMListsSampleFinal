//
//  ProfileViewModel.swift
//  MVVMListsSampleStarter
//
//  Created by Isa Aliev on 17.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

import RxSwift

class ProfileViewModel: ViewModel, RxDataSourceProvider {
    let collectionData = BehaviorSubject<[SectionData]>(value: [])
    
    lazy var profile: Profile = {
        let decoder = JSONDecoder()
        let url = Bundle.main.url(forResource: "info", withExtension: "json")!
        
        return try! decoder.decode(Profile.self, from: .init(contentsOf: url))
    }()
    
    func setup() {
        let profileImagePath = Bundle.main.path(forResource: profile.imageFileName, ofType: nil) ?? ""
        
        collectionData.onNext([
            .init(
                model: TextHeaderViewModel(text: "Main Info"),
                items: [NamedImageCellModel(name: profile.name, imageFilePath: profileImagePath)]
            ),
            .init(
                model: TextHeaderViewModel(text: "About Me"),
                items: [TextCellModel(text: profile.about)]
            ),
            .init(
                model: TextHeaderViewModel(text: "Attributes"),
                items: profile.attributes.map({ AttributeCellModel(name: $0.name, value: $0.value) })
            ),
        ])
    }
}
