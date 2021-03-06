//
//  LoginViewController.swift
//  ProfileApp
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {
    
    deinit {
        print("Huỷ LoginViewController")
    }
    
    let scrollView: TPKeyboardAvoidingScrollView = {
        let scrollView = TPKeyboardAvoidingScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = UIColor.red
        return view
    }()
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let phoneTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Số điện thoại"
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor.mainColor()
        textField.tintColor = UIColor.mainColor() // cursor
        textField.keyboardType = .numberPad
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Mật khẩu"
        textField.borderStyle = .roundedRect
        textField.textColor = UIColor.mainColor()
        textField.tintColor = UIColor.mainColor() // cursor
        textField.isSecureTextEntry = true
        return textField
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ĐĂNG KÝ", for: .normal)
        button.setTitleColor(UIColor.mainColor(), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(onRegister), for: .touchUpInside)
        return button
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ĐĂNG NHẬP", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = UIColor.mainColor()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(onLogin), for: .touchUpInside)
        return button
    }()
    
    let hotlineLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        
        let mainString = "Hotline: 1800.1186"
        let stringToColor = "1800.1186"
        let range = (mainString as NSString).range(of: stringToColor)
        
        let mutableAttributedString = NSMutableAttributedString.init(string: mainString)
        mutableAttributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.mainColor(), range: range)
        
        label.attributedText = mutableAttributedString
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        addViews()
        setupLayout()
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
    }
    
    func addViews(){
        view.addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(logoImageView)
        containerView.addSubview(phoneTextField)
        containerView.addSubview(passwordTextField)
        containerView.addSubview(registerButton)
        containerView.addSubview(loginButton)
        containerView.addSubview(hotlineLabel)
    }
    
    func setupLayout(){
        let margin = view.layoutMarginsGuide
        let constant: CGFloat = 20
        scrollView.topAnchor.constraint(equalTo: margin.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        containerView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1).isActive = true
        
        logoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: constant).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.5).isActive = true
        
        phoneTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 2*constant).isActive = true
        phoneTextField.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 2*constant).isActive = true
        phoneTextField.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -2*constant).isActive = true
        phoneTextField.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
        passwordTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: constant).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: phoneTextField.leadingAnchor, constant: 0).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: phoneTextField.trailingAnchor, constant: 0).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: phoneTextField.heightAnchor).isActive = true
        
        registerButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: constant).isActive = true
        registerButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor, constant: 0).isActive = true
        registerButton.heightAnchor.constraint(equalTo: passwordTextField.heightAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor, multiplier: 0.5).isActive = true
        
        loginButton.topAnchor.constraint(equalTo: registerButton.topAnchor, constant: 0).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: 0).isActive = true
        loginButton.heightAnchor.constraint(equalTo: registerButton.heightAnchor, multiplier: 1).isActive = true
        loginButton.widthAnchor.constraint(equalTo: registerButton.widthAnchor, multiplier: 1).isActive = true
        
        hotlineLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        hotlineLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -constant).isActive = true
        containerView.bottomAnchor.constraint(greaterThanOrEqualTo: margin.bottomAnchor, constant: 0).isActive = true
        
    }
    
    @objc func onRegister(){
        let registerVC = RegisterViewController()
        navigationController?.pushViewController(registerVC, animated: true)
    }
    
    @objc func onLogin(){
        guard let phone = phoneTextField.text, !phone.isEmpty,
              let password = passwordTextField.text, !password.isEmpty else {
            AlertHelper.sorry(message: "Vui lòng nhập đầy đủ thông tin", viewController: self)
            return
        }
        
        ApiManager.shared.login(phone: phone, password: password) { [weak self] in
            guard let strongSelf = self else { return }
            let homeVC = HomeViewController()
            strongSelf.navigationController?.pushViewController(homeVC, animated: false)
        } failure: { (msg) in
            AlertHelper.sorry(message: msg, viewController: self)
        }
        
    }
    
}
