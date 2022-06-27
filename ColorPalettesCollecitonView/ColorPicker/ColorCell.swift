//
//  ColorCell.swift
//  ColorPalettesCollecitonView
//
//  Created by Glenn Posadas on 6/27/22.
//

import UIKit

class ColorCell: UICollectionViewCell {
    
    // MARK: -
    // MARK: Properties
    
    private(set) var color: UIColor!
    private(set) var colorView: UIView!
    private(set) var checkmarkImageView: UIImageView!
    
    // MARK: -
    // MARK: Functions
    
    func setupCell(color: UIColor) {
        self.color = color
        self.colorView.backgroundColor = color
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.colorView.layer.cornerRadius = 20
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    private func setupViews() {
        colorView = UIView()
        contentView.addSubview(colorView)
        colorView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            colorView.widthAnchor.constraint(equalToConstant: 40),
            colorView.heightAnchor.constraint(equalToConstant: 40),
            colorView.topAnchor.constraint(equalTo: topAnchor),
            colorView.leftAnchor.constraint(equalTo: leftAnchor),
            colorView.rightAnchor.constraint(equalTo: rightAnchor),
            colorView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        checkmarkImageView = UIImageView(image: UIImage(named: ""))
        contentView.addSubview(checkmarkImageView)
        checkmarkImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            checkmarkImageView.widthAnchor.constraint(equalToConstant: 18),
            checkmarkImageView.heightAnchor.constraint(equalToConstant: 14),
            checkmarkImageView.centerXAnchor.constraint(equalTo: colorView.centerXAnchor),
            checkmarkImageView.centerYAnchor.constraint(equalTo: colorView.centerYAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
