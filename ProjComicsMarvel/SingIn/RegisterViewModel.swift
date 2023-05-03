//
//  RegisterViewModel.swift
//  ProjComicsMarvel
//
//  Created by test on 10/04/23.
//

import Foundation
import Firebase

class RegisterViewModel{
    
    var alth: Auth
    
    init(alth: Auth = Auth.auth()) {
        self.alth = alth
    }
    
    func crateUser(withEmail email: String, password: String, completion: @escaping (Bool) -> Void){
        self.alth.createUser(withEmail: email, password: password) { (result, error) in
            if error != nil{
                completion(false)
                return
            }else{
                if result == nil {
                    completion(false)
                    return
                } else {
                    completion(true)
                }
            }
        }
    }
}
    
    

