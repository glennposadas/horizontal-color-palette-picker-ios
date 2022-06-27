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
        picker = ColorPickerFooterView()
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
