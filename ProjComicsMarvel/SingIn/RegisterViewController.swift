//
//  RegisterViewController.swift
//  LoginViewCode
//
//  Created by test on 26/01/23.
//

import UIKit


class RegisterViewController: UIViewController {
    
    var registerView: RegisterView?
    var registerViewModel = RegisterViewModel()
    var alert:Alert?
    
    override func loadView() {
        self.registerView = RegisterView()
        self.view = self.registerView
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerView?.configTextFieldDelegate(delegate: self)
        self.registerView?.delegate(delegate: self)
        self.alert = Alert(controller: self)
    }
    

}

// tentar coloca todas as verificaçoes aqui
extension RegisterViewController: UITextFieldDelegate{
    //quando o teclado abaixar -> faz a verificação
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.registerView?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension RegisterViewController: RegisterScrrenProtocol{
    func actionBackButton() {
        print("Botão de voltar")
        self.navigationController?.popViewController(animated: true) //indo pra login
    }
    
    func actionRegisterButton() {
        //criando usuario fireBase *_*
        guard let register = self.registerView else {return}
        
        self.registerViewModel.crateUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { result in
            if !result{
                self.alert?.getAlert(titulo: "Erro no cadastro", mensagem: "Tente novamente")
            }else{
                self.alert?.getAlert(titulo: "Usuario cadastrado", mensagem: "", complition: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })

    }
    
}
    

