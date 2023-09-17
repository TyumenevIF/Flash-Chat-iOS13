//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Ilyas Tyumenev on 27.05.2023.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    
    private let emailView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "textfield")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 25)
        textField.textColor = UIColor(named: K.BrandColors.blue)
        textField.textAlignment = .center
        textField.placeholder = "Email"
        textField.minimumFontSize = 17
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordView: UIView = {
        let view = UIView()
        view.contentMode = .scaleToFill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let passwordImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "textfield")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 25)
        textField.textColor = UIColor(named: K.BrandColors.blue)
        textField.textAlignment = .center
        textField.placeholder = "Password"
        textField.minimumFontSize = 17
        textField.borderStyle = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(UIColor(named: K.BrandColors.blue), for: .normal)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(registerPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
        setViews()
        setupConstraints()
    }
    
    private func setViews() {
        emailView.addSubview(emailImageView)
        emailView.addSubview(emailTextField)
        view.addSubview(emailView)
        passwordView.addSubview(passwordImageView)
        passwordView.addSubview(passwordTextField)
        passwordView.addSubview(registerButton)
        view.addSubview(passwordView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            emailView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            emailView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            emailView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            emailView.heightAnchor.constraint(equalToConstant: 177),
            
            emailImageView.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 20),
            emailImageView.leadingAnchor.constraint(equalTo: emailView.leadingAnchor),
            emailImageView.trailingAnchor.constraint(equalTo: emailView.trailingAnchor),
            emailImageView.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 50),
            emailTextField.leftAnchor.constraint(equalTo: emailView.leftAnchor, constant: 48),
            emailTextField.rightAnchor.constraint(equalTo: emailView.rightAnchor, constant: -48),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -82),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -100),
            passwordView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            passwordView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            passwordView.heightAnchor.constraint(equalToConstant: 177),
            
            passwordImageView.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 20),
            passwordImageView.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            passwordImageView.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
            passwordImageView.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -20),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 50),
            passwordTextField.leftAnchor.constraint(equalTo: passwordView.leftAnchor, constant: 48),
            passwordTextField.rightAnchor.constraint(equalTo: passwordView.rightAnchor, constant: -48),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -82),
            
            registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 31),
            registerButton.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor),
            registerButton.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor)
        ])
    }
    
    // MARK: - Target actions
    @objc func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in
                if let err = error {
                    print(err.localizedDescription)
                } else {
//                    self.performSegue(withIdentifier: K.registerSegue, sender: self)
                    print("registerPressed")
                }
            }
        }
    }
}
