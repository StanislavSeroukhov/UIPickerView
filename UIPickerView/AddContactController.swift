//
//  AddContactController.swift
//  UIPickerView
//
//  Created by Stanislav Seroukhov on 06.02.2024.
//

import UIKit



class AddContactController: UIViewController {
    
    weak var delegate: SecondViewControllerDelegate!

    
    /*
     lazy var cancelButton: UIButton = {
     let button = UIButton(type: .system)
     button.setTitle("Отмена", for: .normal)
     button.translatesAutoresizingMaskIntoConstraints = false
     button.addTarget(nil, action: #selector(backVC), for: .touchUpInside)
     return button
     }()
     
     lazy var addButton: UIButton = {
     let button = UIButton(type: .system)
     button.setTitle("Добавить", for: .normal)
     button.addTarget(nil, action: #selector(showVC), for: .touchUpInside)
     button.translatesAutoresizingMaskIntoConstraints = false
     return button
     }()
     */
    
    
    lazy var imageProfile: UIImageView = {
        let image = UIImage(systemName: "person.circle.fill")
        let imageView = UIImageView(image: image)
        imageView.layer.cornerRadius = 50
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    lazy var imagePicker: UIImagePickerController = {
        let image = UIImagePickerController()
        return image
    }()
    
    lazy var addPhoto: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Изменить", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(nil, action: #selector(clickButton), for: .touchUpInside)
        return button
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Имя"
        label.font = UIFont(name: "Shree Devanagari 714", size: 15)
        label.textColor = UIColor(red: 66 / 255, green: 129 / 255, blue: 14 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nameTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите имя"
        textField.text = ""
        textField.leftViewMode = .always
        textField.textColor = UIColor(red: 95 / 255, green: 0 / 255, blue: 102 / 255, alpha: 1)
        let line = CALayer()
        line.frame = CGRect(x: 0, y: 35, width: 345, height: 1)
        line.backgroundColor = CGColor(red: 151 / 255, green: 166 / 255, blue: 41 / 255, alpha: 1)
        textField.layer.addSublayer(line)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "Дата"
        label.font = UIFont(name: "Shree Devanagari 714", size: 15)
        label.textColor = UIColor(red: 66 / 255, green: 129 / 255, blue: 14 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Введите дату"
        textField.leftViewMode = .always
        textField.textColor = UIColor(red: 95 / 255, green: 0 / 255, blue: 102 / 255, alpha: 1)
        let line = CALayer()
        line.frame = CGRect(x: 0, y: 35, width: 345, height: 1)
        line.backgroundColor = CGColor(red: 151 / 255, green: 166 / 255, blue: 41 / 255, alpha: 1)
        textField.layer.addSublayer(line)
        textField.inputView = datePicker
        textField.inputAccessoryView = createToolbar()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.locale = .init(identifier: "Russian")
        picker.preferredDatePickerStyle = .wheels
        picker.maximumDate = .now
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.addTarget(nil, action: #selector(setDateBirthday), for: .valueChanged)
        return picker
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.text = "Возраст"
        label.font = UIFont(name: "Shree Devanagari 714", size: 15)
        label.textColor = UIColor(red: 66 / 255, green: 129 / 255, blue: 14 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var ageTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить"
        textField.leftViewMode = .always
        textField.textColor = UIColor(red: 95 / 255, green: 0 / 255, blue: 102 / 255, alpha: 1)
        let line = CALayer()
        line.frame = CGRect(x: 0, y: 35, width: 345, height: 1)
        line.backgroundColor = CGColor(red: 151 / 255, green: 166 / 255, blue: 41 / 255, alpha: 1)
        textField.layer.addSublayer(line)
        textField.tag = 1
        textField.inputView = pickerAge
        textField.inputAccessoryView = createToolbar()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var pickerAge: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        picker.tag = 1
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.text = "Пол"
        label.font = UIFont(name: "Shree Devanagari 714", size: 15)
        label.textColor = UIColor(red: 66 / 255, green: 129 / 255, blue: 14 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var genderTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Добавить"
        textField.leftViewMode = .always
        textField.textColor = UIColor(red: 95 / 255, green: 0 / 255, blue: 102 / 255, alpha: 1)
        let line = CALayer()
        line.frame = CGRect(x: 0, y: 35, width: 345, height: 1)
        line.backgroundColor = CGColor(red: 151 / 255, green: 166 / 255, blue: 41 / 255, alpha: 1)
        textField.layer.addSublayer(line)
        textField.inputView = pickerGender
        textField.inputAccessoryView = createToolbar()
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var pickerGender: UIPickerView = {
        let picker = UIPickerView()
        picker.dataSource = self
        picker.delegate = self
        picker.tag = 2
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    lazy var socialwebLabel: UILabel = {
        let label = UILabel()
        label.text = "Instagram"
        label.font = UIFont(name: "Shree Devanagari 714", size: 15)
        label.textColor = UIColor(red: 66 / 255, green: 129 / 255, blue: 14 / 255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var socialwebTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "@username"
        textField.leftViewMode = .always
        textField.textColor = UIColor(red: 95 / 255, green: 0 / 255, blue: 102 / 255, alpha: 1)
        let line = CALayer()
        line.frame = CGRect(x: 0, y: 35, width: 345, height: 1)
        line.backgroundColor = CGColor(red: 151 / 255, green: 166 / 255, blue: 41 / 255, alpha: 1)
        textField.layer.addSublayer(line)
        textField.addTarget(nil, action: #selector(alertForInstagram), for: .allEditingEvents)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let gender = ["Женский", "Мужской"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 240 / 255, green: 254 / 255, blue: 255 / 255, alpha: 1)
        
        navigationItem.rightBarButtonItem = .init(barButtonSystemItem: .add, target: nil, action: #selector(addContact))
        
        imagePicker.delegate = self
        
        
        
        
        /*
         view.addSubview(cancelButton)
         cancelButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
         cancelButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
         
         view.addSubview(addButton)
         addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
         addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
         */
        
        view.addSubview(imageProfile)
        imageProfile.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageProfile.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageProfile.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        imageProfile.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(addPhoto)
        addPhoto.topAnchor.constraint(equalTo: imageProfile.bottomAnchor, constant: 20).isActive = true
        addPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: addPhoto.bottomAnchor, constant: 20).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(nameTF)
        nameTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        nameTF.heightAnchor.constraint(equalToConstant: 35).isActive = true
        nameTF.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        nameTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(dateLabel)
        dateLabel.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 20).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(dateTF)
        dateTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        dateTF.heightAnchor.constraint(equalToConstant: 35).isActive = true
        dateTF.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5).isActive = true
        dateTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(ageLabel)
        ageLabel.topAnchor.constraint(equalTo: dateTF.bottomAnchor, constant: 20).isActive = true
        ageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(ageTF)
        ageTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        ageTF.heightAnchor.constraint(equalToConstant: 35).isActive = true
        ageTF.topAnchor.constraint(equalTo: ageLabel.bottomAnchor, constant: 5).isActive = true
        ageTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(genderLabel)
        genderLabel.topAnchor.constraint(equalTo: ageTF.bottomAnchor, constant: 20).isActive = true
        genderLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(genderTF)
        genderTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        genderTF.heightAnchor.constraint(equalToConstant: 35).isActive = true
        genderTF.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 5).isActive = true
        genderTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(socialwebLabel)
        socialwebLabel.topAnchor.constraint(equalTo: genderTF.bottomAnchor, constant: 20).isActive = true
        socialwebLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(socialwebTF)
        socialwebTF.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        socialwebTF.heightAnchor.constraint(equalToConstant: 35).isActive = true
        socialwebTF.topAnchor.constraint(equalTo: socialwebLabel.bottomAnchor, constant: 5).isActive = true
        socialwebTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        
        
        
        
    }
    
    //    MARK: - Back ViewController
    //    @objc func backVC() {
    //        self.dismiss(animated: true)
    //    }
    
    
    //    MARK: - Add On VC
    
    @objc func addContact() {
        delegate.update(name: nameTF.text, dateBD: dateTF.text, image: imageProfile.image)
        navigationController?.popViewController(animated: true)
    }
    
    
    
    //    MARK: - Click Button Gallery
    
    @objc func clickButton(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    
    //    MARK: - Create Tool Bar
    
    @objc func createToolbar() -> UIToolbar {
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        // create done button
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(pressButtonDone))
        toolbar.setItems([doneButton], animated: true)
        
        return toolbar
    }
    
    //    MARK: - Press button Done
    
    @objc func pressButtonDone() {
        view.endEditing(true)
        
    }
    
    //    MARK: - Install Date Birthday
    
    @objc func setDateBirthday(paramdatePicker: UIDatePicker) {
        if paramdatePicker.isEqual(datePicker) {
            let date = DateFormatter()
            date.dateStyle = .medium
            dateTF.text = date.string(from: datePicker.date)
        }
    }
    
    //    MARK: - Alert for Instagram
    
    @objc func alertForInstagram() {
        
        let alertController = UIAlertController(title: "Введите username Instagram", message: nil, preferredStyle: .alert)
        alertController.addTextField() { textField in
            textField.placeholder = "@username"}
        
        let actionOK = UIAlertAction(title: "Ok", style: .default) { _ in
            guard let text = alertController.textFields?.first else { return }
            self.socialwebTF.text = text.text
        }
        
        let actionCancel = UIAlertAction(title: "Отмена", style: .cancel)
        
        alertController.addAction(actionOK)
        alertController.addAction(actionCancel)
        
        self.present(alertController, animated: true)
    }
    
}


//    MARK: - PicketView DataSource

extension AddContactController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView.tag {
        case 1: return 100
        case 2: return gender.count
        default: return 0
        }
    }
}

// MARK: - PickerView Delegate

extension AddContactController: UIPickerViewDelegate {
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView.tag {
        case 1: return String((row) + 1)
        case 2: return gender[row]
        default: return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView.tag {
        case 1: return ageTF.text = String((row) + 1)
        case 2: return genderTF.text = gender[row]
        default: break
        }
    }
}

//  MARK: - ImagePickerController

extension AddContactController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.originalImage] as? UIImage {
            imageProfile.image = image
        }
        dismiss(animated: true)
    }
}
