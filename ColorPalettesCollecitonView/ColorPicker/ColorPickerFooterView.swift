//
//  ColorPickerFooterView.swift
//  ColorPalettesCollecitonView
//
//  Created by Glenn Posadas on 6/27/22.
//

import UIKit

protocol ColorPickerFooterViewDelegate: AnyObject {
    func colorPickerFooterView(_ picker: ColorPickerFooterView, didSelect color: UIColor)
}

class ColorPickerFooterView: UIView {
    
    // MARK: -
    // MARK: Properties
    
    private(set) var title: String?
    private(set) var titleLabel: UILabel!
    
    private(set) var collectionView: UICollectionView!
    static var defaultColors: [UIColor] = [
        .red,
        .blue,
        .yellow,
        .purple,
        .orange,
        .cyan,
        .systemMint,
        .systemPink,
        .systemTeal,
        .green,
        .brown,
        .gray,
        .lightGray,
    ]
    private(set) var colors = [UIColor]()
    
    private weak var delegate: ColorPickerFooterViewDelegate?
    
    // MARK: -
    // MARK: Functions
    
    private init() { super.init(frame: .zero) }
    
    convenience init(title: String?,
                     colors: [UIColor] = ColorPickerFooterView.defaultColors,
                     delegate: ColorPickerFooterViewDelegate) {
        self.init()
        
        self.title = title
        self.delegate = delegate
        self.colors = colors
        
        setup()
        
        self.collectionView.reloadData()
    }
    
    private func setup() {
        if colors.isEmpty {
            colors = ColorPickerFooterView.defaultColors
        }
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.register(ColorCell.self, forCellWithReuseIdentifier: "ColorCell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        if let title = self.title {
            titleLabel = UILabel()
            titleLabel.textColor = .white
            titleLabel.font = .systemFont(ofSize: 14)
            titleLabel.text = title
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            addSubview(titleLabel)
            
            addSubview(collectionView)
            NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
                titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                titleLabel.trailingAnchor.constraint(equalTo:trailingAnchor, constant: 16),
                titleLabel.heightAnchor.constraint(equalToConstant: 30)
            ])
            
            addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo:trailingAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 50)
            ])
            
        } else {
            addSubview(collectionView)
            NSLayoutConstraint.activate([
                collectionView.centerYAnchor.constraint(equalTo: centerYAnchor),
                collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo:trailingAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: -
// MARK: UICollectionViewDelegate

extension ColorPickerFooterView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCell else {
            return
        }
        
        cell.isSelected = true
        let color = colors[indexPath.item]
        delegate?.colorPickerFooterView(self, didSelect: color)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCell else {
            return
        }
        
        cell.isSelected = false
    }
}

// MARK: -
// MARK: UICollectionViewDelegateFlowLayout

extension ColorPickerFooterView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 40, height: 40)
    }
}

// MARK: -
// MARK: UICollectionViewDataSource

extension ColorPickerFooterView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath) as? ColorCell else {
            return UICollectionViewCell()
        }
        
        let color = colors[indexPath.item]
        cell.setupCell(color: color)
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
}
