//
//  ViewController.swift
//  UIPickerView
//
//  Created by Stanislav Seroukhov on 02.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var eyeButton: UIButton = {
        let button = EyeButton()
        button.addTarget(nil, action: #selector(displayBookmarks), for: .touchUpInside)
        return button
    }()
    
    var isPrivate = true
    
    
    private lazy var image: UIImageView = {
        let image = UIImage(named: "happybirthday.jpg")!
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    private lazy var singInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sing In"
        label.textColor = UIColor(red: 95 / 255, green: 0 / 255, blue: 102 / 255, alpha: 1)
        label.font = .boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.font = UIFont(name: "Shree Devanagari 714", size: 15)
        label.textColor = UIColor(red: 66 / 255, green: 129 / 255, blue: 14 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var loginTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "email ID: login"
        textField.autocapitalizationType = .none
        textField.clearButtonMode = .whileEditing
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 151 / 255, green: 166 / 255, blue: 41 / 255, alpha: 1)
        textField.backgroundColor = UIColor(red: 215 / 255, green: 236 / 255, blue: 240 / 255, alpha: 0.3)
        textField.textColor = UIColor(red: 95 / 255, green: 0 / 255, blue: 102 / 255, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private lazy var passwordLablel: UILabel = {
        let label = UILabel()
        label.text = "Password"
        label.font = UIFont(name: "Shree Devanagari 714", size: 15)
        label.textColor = UIColor(red: 66 / 255, green: 129 / 255, blue: 14 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "password: 123"
        textField.isSecureTextEntry = true
        textField.autocapitalizationType = .none
        textField.leftView = UIView(frame: .init(x: 0, y: 0, width: 10, height: 0))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = CGColor(red: 151 / 255, green: 166 / 255, blue: 41 / 255, alpha: 1)
        textField.backgroundColor = UIColor(red: 215 / 255, green: 236 / 255, blue: 240 / 255, alpha: 0.3)
        textField.textColor = UIColor(red: 95 / 255, green: 0 / 255, blue: 102 / 255, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var labaelFaceID: UILabel = {
        let label = UILabel()
        label.text = "Вход по Face ID"
        label.font = UIFont(name: "Shree Devanagari 714", size: 15)
        label.textColor = UIColor(red: 66 / 255, green: 129 / 255, blue: 14 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var switchFaceID: UISwitch = {
        let faceID = UISwitch()
        faceID.isOn = true
        faceID.translatesAutoresizingMaskIntoConstraints = false
        return faceID
    }()
    
    
    private lazy var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red: 23 / 255, green: 189 / 255, blue: 187 / 255, alpha: 1)
        button.layer.cornerRadius = 23
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(showVC), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 240 / 255, green: 254 / 255, blue: 255 / 255, alpha: 1)
        
        SetupEyePassword()
        

        view.addSubview(image)
        image.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        image.heightAnchor.constraint(equalToConstant: 280).isActive = true
        image.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view.addSubview(singInLabel)
        singInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        singInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(emailLabel)
        emailLabel.topAnchor.constraint(equalTo: singInLabel.bottomAnchor, constant: 40).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(loginTF)
        loginTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        loginTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        loginTF.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10).isActive = true
        loginTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(passwordLablel)
        passwordLablel.topAnchor.constraint(equalTo: loginTF.bottomAnchor, constant: 25).isActive = true
        passwordLablel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(passwordTF)
        passwordTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        passwordTF.heightAnchor.constraint(equalToConstant: 40).isActive = true
        passwordTF.topAnchor.constraint(equalTo: passwordLablel.bottomAnchor, constant: 10).isActive = true
        passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(labaelFaceID)
        labaelFaceID.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 25).isActive = true
        labaelFaceID.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        view.addSubview(switchFaceID)
        switchFaceID.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 20).isActive = true
        switchFaceID.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true

        
        view.addSubview(button)
        button.widthAnchor.constraint(equalToConstant: 130).isActive = true
        button.heightAnchor.constraint(equalToConstant: 48).isActive = true
        button.topAnchor.constraint(equalTo: labaelFaceID.bottomAnchor, constant: 100).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                
    }
//    MARK:  - SetupEyePassword
    @objc func SetupEyePassword() {
        passwordTF.rightView = eyeButton
        passwordTF.rightViewMode = .always
    }
    
    @objc func displayBookmarks() {
        let imageName = isPrivate ? "eye" : "eye.slash"
        
        passwordTF.isSecureTextEntry.toggle()
        eyeButton.setImage(UIImage(systemName: imageName), for: .normal)
        isPrivate.toggle()
    }
    
//    MARK: - ShowVC
    @objc func showVC() {
        
//        if loginTF.text == "login" && passwordTF.text == "123"{
            let vc = SecondViewController()
            navigationController?.pushViewController(vc, animated: true)
//        } else {
//            alert(title: "Внимание", message: "Неверный логин или пароль!", style: .alert)
//        }
    }
    
    
//    MARK: - Alert
    @objc func alert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { action in
            self.loginTF.text = nil
            self.passwordTF.text = nil }
        
        alertController.addAction(action)
        
        self.present(alertController, animated: true)
    }
}


