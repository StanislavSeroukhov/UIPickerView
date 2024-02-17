//
//  EyeButton.swift
//  UIPickerView
//
//  Created by Stanislav Seroukhov on 02.02.2024.
//

import UIKit

final class EyeButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupEyeButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupEyeButton() {
        setImage(UIImage(systemName: "eye.slash"), for: .normal)
        tintColor = .systemGray
        widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
