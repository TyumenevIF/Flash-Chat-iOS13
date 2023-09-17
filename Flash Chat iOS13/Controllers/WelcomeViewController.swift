//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Ilyas Tyumenev on 27.05.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 50, weight: .black)
        label.textColor = UIColor(named: K.BrandColors.blue)
        label.backgroundColor = .clear
        label.textAlignment = .natural
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Register", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(UIColor(named: K.BrandColors.blue), for: .normal)
        button.setTitleShadowColor(.black, for: .normal)
        button.backgroundColor = UIColor(named: K.BrandColors.lighBlue)
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var logInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemTeal
        button.contentHorizontalAlignment = .center
        button.addTarget(self, action: #selector(logInButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupTitleLabel()
        setViews()
        setupConstraints()
    }
    
    // MARK: - Private Methods
    private func setupTitleLabel() {
        titleLabel.text = ""
        var charIndex = 0.0
        let titleText = "⚡️FlashChat"
        for letter in titleText {
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.titleLabel.text?.append(letter)
            }
            charIndex += 1
        }
    }
    
    private func setViews() {
        view.addSubview(titleLabel)
        view.addSubview(registerButton)
        view.addSubview(logInButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 52),
            titleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 60),
            
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            registerButton.heightAnchor.constraint(equalToConstant: 48),
            registerButton.bottomAnchor.constraint(equalTo: logInButton.topAnchor, constant: -8),
            
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            logInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 8),
            logInButton.heightAnchor.constraint(equalToConstant: 61)
            
        ])
    }
    
    @objc func registerButtonPressed() {
        print("registerButtonPressed")
    }
    
    @objc func logInButtonPressed() {
        print("logInButtonPressed")
    }
}
