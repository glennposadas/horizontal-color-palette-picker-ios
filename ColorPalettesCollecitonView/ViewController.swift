//
//  ViewController.swift
//  ColorPalettesCollecitonView
//
//  Created by Glenn Posadas on 6/27/22.
//

import UIKit

class ViewController: UIViewController {

    // MARK: -
    // MARK: Properties
    
    private var picker: ColorPickerFooterView!
    
    // MARK: -
    // MARK: Functions
    
    override func loadView() {
        super.loadView()
        
        setupPicker()
    }

    private func setupPicker() {
        picker = ColorPickerFooterView(title: "Background Color", delegate: self)
        picker.backgroundColor = .lightGray
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        
        NSLayoutConstraint.activate([
            picker.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            picker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            picker.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            picker.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}

// MARK: -
// MARK: ColorPickerFooterViewDelegate

extension ViewController: ColorPickerFooterViewDelegate {
    func colorPickerFooterView(_ picker: ColorPickerFooterView, didSelect color: UIColor) {
        view.backgroundColor = color
    }
}
