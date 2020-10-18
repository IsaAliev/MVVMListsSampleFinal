//
//  AttributeCell.swift
//  MVVMListsSampleStarter
//
//  Created by Isa Aliev on 17.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

import UIKit

class AttributeCell: UICollectionViewCell, ViewRepresentable {
    private weak var nameLabel: UILabel!
    private weak var valueLabel: UILabel!
    
    var model: AttributeCellModel! {
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
        nameLabel.text = model.name
        valueLabel.text = model.value
    }
    
    private func setupViews() {
        let nameLabel = UILabel()
        let valueLabel = UILabel()
        
        nameLabel.font = .systemFont(ofSize: 14.0, weight: .semibold)
        valueLabel.font = .systemFont(ofSize: 14.0)
        nameLabel.textColor = .label
        valueLabel.textColor = .secondaryLabel
        
        [valueLabel, nameLabel].forEach({ contentView.addSubview($0) })
        
        valueLabel.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-16.0)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16.0)
            make.top.equalToSuperview().offset(8.0)
            make.bottom.equalToSuperview().offset(8.0)
        }
        
        self.nameLabel = nameLabel
        self.valueLabel = valueLabel
    }
}
