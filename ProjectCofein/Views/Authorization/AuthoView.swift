//
//  AuthoView.swift
//  ProjectCofein
//
//  Created by Apple on 22.4.2024.
//

import UIKit

protocol AuthoViewProtocol: AnyObject {
    
}

class AuthoViewController: UIViewController {
    
    private var controller: AuthoControllerProtocol?
    
    private let titleRestourant: UILabel = {
        let label = UILabel()
        label.text = "Cofee House"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Geeks"
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        label.textColor = UIColor(named: "ColorGeeks")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let entranceLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let userNameTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите имя"
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.systemGray.cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let phoneNumberTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Введите номер телефона"
        tf.keyboardType = .phonePad
        tf.layer.borderWidth = 1
        tf.layer.cornerRadius = 12
        tf.layer.borderColor = UIColor.systemGray.cgColor
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 1))
        tf.leftView = leftView
        tf.leftViewMode = .always
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    private let signInBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = UIColor(named: "ColorGeeks")
        button.addTarget(self, action: #selector(signInTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.hidesBackButton = true
        setup()
    }
    
    private func setup(){
        setupAdd()
        setupLayouts()
        controller = AuthoController(view: self)
    }
    
    private func setupAdd(){
        
        view.addSubview(titleRestourant)
        view.addSubview(titleLabel)
        view.addSubview(entranceLabel)
        view.addSubview(userNameTF)
        view.addSubview(phoneNumberTF)
        view.addSubview(signInBtn)
        
    }
    
    private func setupLayouts(){
        
        NSLayoutConstraint.activate([
            
            titleRestourant.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 90),
            titleRestourant.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: titleRestourant.bottomAnchor, constant: 3),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            entranceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 25),
            entranceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            userNameTF.topAnchor.constraint(equalTo: entranceLabel.bottomAnchor, constant: 5),
            userNameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            userNameTF.heightAnchor.constraint(equalToConstant: 45),
            userNameTF.widthAnchor.constraint(equalToConstant: 355),
            
            phoneNumberTF.topAnchor.constraint(equalTo: userNameTF.bottomAnchor, constant: 15),
            phoneNumberTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            phoneNumberTF.heightAnchor.constraint(equalToConstant: 45),
            phoneNumberTF.widthAnchor.constraint(equalToConstant: 355),
            
            signInBtn.topAnchor.constraint(equalTo: phoneNumberTF.bottomAnchor, constant: 25),
            signInBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInBtn.heightAnchor.constraint(equalToConstant: 40),
            signInBtn.widthAnchor.constraint(equalToConstant: 120),

        ])
        
    }
    
    @objc
    private func signInTap() {
        checAutho()
        validateTf()
    }
    
    private func validateTf(){
        let name = "Temirlan"
        let phoneNumber = "0502030422"
        
        if name == userNameTF.text && phoneNumber == phoneNumberTF.text {
            let vc = HomeView()
            navigationController?.pushViewController(vc, animated: true)
        } else {
            showAlert(massage: "Неправильно ввели ваше имя или номер телефона!")
        }
    }
    
    private func showAlert(massage: String){
        let alert = UIAlertController(title: "Ошибка", message: massage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    private func checAutho() {
        guard
            let name = userNameTF.text, !name.isEmpty,
            let phoneNumber = phoneNumberTF.text, !phoneNumber.isEmpty
        else {
            return
        }
        UserSessionManager.shared.saveSession(
            name: name,
            phoneNumber: phoneNumber
        )
    }
    
}

extension AuthoViewController: AuthoViewProtocol {
    func setData(with item: String ){
        
    }
}
