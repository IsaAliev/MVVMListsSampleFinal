//
//  TextCell.swift
//  MVVMListsSampleStarter
//
//  Created by Isa Aliev on 17.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

import UIKit

class TextCell: UICollectionViewCell, ViewRepresentable {
    private weak var label: UILabel!
    
    var model: TextCellModel! {
        didSet {
            bindWithModel()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bindWithModel() {
        label.text = model.text
    }
    
    private func setupViews() {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.textColor = .secondaryLabel
        label.font = .systemFont(ofSize: 12.0)
        
        contentView.addSubview(label)
        
        label.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(8.0)
            make.leading.equalToSuperview().offset(16.0)
            make.trailing.equalToSuperview().offset(-16.0)
            make.bottom.equalToSuperview().offset(-8.0)
        }
        
        self.label = label
    }
}
