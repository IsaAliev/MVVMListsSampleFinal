//
//  CollectionItemViewModel.swift
//  smb
//
//  Created by Isa Aliev on 17/09/2020.
//  Copyright © 2020 IA. All rights reserved.
//

protocol CollectionItemViewModel: ViewModel {
    var identityIdentifier: Any? { get }
}

extension CollectionItemViewModel {
    var identityIdentifier: Any? { nil }
}
