//
//  ViewController.swift
//  LoginViewCode
//
//  Created by test on 23/01/23.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    var loginScreenView: LoginScreenView?
    var alert:Alert?
    var loginViewModel = LoginViewModel()
    
    override func loadView() {
        self.loginScreenView = LoginScreenView()
        self.view = self.loginScreenView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginScreenView?.delegate(delegate: self)
        self.loginScreenView?.configTextFieldDelegate(delegate: self)
        self.alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false) // escondendo animação da navigation controller
    }
    
}

extension LoginViewController:LoginScreenProtocol{
    func actionLoginButton() {
        
        guard let login = self.loginScreenView else {return}
        
        self.loginViewModel.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { result in
            if !result {
                //alerta
                self.alert?.getAlert(titulo: "Erro", mensagem: "Problema inesperado, tente mais tarde!")
            } else{
                let vc: HomeViewController = HomeViewController()
                self.navigationController?.pushViewController(vc, animated: true)
            }
        })
        
    }
    
    func actionRegisterButton() {
        print("Deu certo registro")
        let vcontrol: RegisterViewController = RegisterViewController()
       self.navigationController?.pushViewController(vcontrol, animated: true) // para chamar outra tela
    }
    
    
}

extension LoginViewController: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        self.loginScreenView?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //para teclado descer 
    }
}
