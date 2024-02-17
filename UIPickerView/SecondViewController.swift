//
//  SecondViewController.swift
//  UIPickerView
//
//  Created by Stanislav Seroukhov on 02.02.2024.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func update(name: String?, dateBD: String?, image: UIImage?)
}


class SecondViewController: UIViewController {
    
    
    lazy var photoProfile: UIImageView = {
        let image = UIImage(systemName: "person.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 30
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    lazy var nameLable: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dayLabel: UILabel = {
        let label = UILabel()
        
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 240 / 255, green: 254 / 255, blue: 255 / 255, alpha: 1)
        navigationItem.title = "Birthday"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backVC))
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(showVC))
        
        
        
        
        view.addSubview(photoProfile)
        photoProfile.widthAnchor.constraint(equalToConstant: 60).isActive = true
        photoProfile.heightAnchor.constraint(equalToConstant: 60).isActive = true
        photoProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        photoProfile.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25).isActive = true
        
        view.addSubview(nameLable)
        nameLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        nameLable.leadingAnchor.constraint(equalTo: photoProfile.trailingAnchor, constant: 10).isActive = true
        
        view.addSubview(dayLabel)
        dayLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        dayLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25).isActive = true
        
        view.addSubview(descriptionLabel)
        descriptionLabel.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 15).isActive = true
        descriptionLabel.leadingAnchor.constraint(equalTo: photoProfile.trailingAnchor, constant: 10).isActive = true
        
        
        
    }
    
    @objc func backVC() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func showVC() {
        let vc = AddContactController()
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension SecondViewController: SecondViewControllerDelegate {
    
    func update(name: String?, dateBD: String?, image: UIImage?) {
        nameLable.text = name
        descriptionLabel.text = dateBD
        photoProfile.image = image
    }
}

