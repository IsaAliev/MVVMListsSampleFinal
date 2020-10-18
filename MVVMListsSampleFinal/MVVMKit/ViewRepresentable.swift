//
//  ViewRepresentable.swift
//  smb
//
//  Created by Isa Aliev on 17/09/2020.
//  Copyright © 2020 IA. All rights reserved.
//

protocol ViewRepresentable: ViewModelTypeErasedViewRepresentable {
    associatedtype ViewModelType: ViewModel
    
    var model: ViewModelType! { get set }
    
    func bindWithModel()
}

protocol ViewModelTypeErasedViewRepresentable: class {
    var typeErasedViewModel: ViewModel? { get set }
}

extension ViewRepresentable {
    var typeErasedViewModel: ViewModel? {
        get {
            model
        }
        
        set {
            model = (newValue as! Self.ViewModelType)
        }
    }
}

extension ViewRepresentable {
    func setupViewModel() {
        model?.setup()
        bindWithModel()
    }
}
