//
//  NamedImageCell.swift
//  MVVMListsSampleStarter
//
//  Created by Isa Aliev on 17.10.2020.
//  Copyright © 2020 Isa Aliev. All rights reserved.
//

import UIKit

class NamedImageCell: UICollectionViewCell, ViewRepresentable {
    private weak var imageView: UIImageView!
    private weak var nameLabel: UILabel!
    
    var model: NamedImageCellModel! {
        didSet {
            setupViewModel()
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
        imageView.image = UIImage(contentsOfFile: model.imageFilePath)
        nameLabel.text = model.name
    }
    
    private func setupViews() {
        let imageView = UIImageView()
        let label = UILabel()
        
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 15.0
        imageView.layer.masksToBounds = true
        
        label.font = .systemFont(ofSize: 14.0)
        label.textColor = .label
        
        [label, imageView].forEach({ contentView.addSubview($0) })
        
        imageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(16.0)
            make.top.equalToSuperview().offset(8.0)
            make.bottom.equalToSuperview().offset(-8.0)
            make.height.equalTo(30.0)
            make.width.equalTo(30.0)
        }
        
        label.snp.makeConstraints { (make) in
            make.leading.equalTo(imageView.snp.trailing).offset(8.0)
            make.centerY.equalToSuperview()
        }
        
        self.imageView = imageView
        self.nameLabel = label
    }
}
