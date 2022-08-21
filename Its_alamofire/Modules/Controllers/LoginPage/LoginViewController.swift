//
//  LoginViewController.swift
//  Its_alamofire
//
//  Created by Jhansi Ch on 18/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var viewModelObject :LoginViewModel = {
       return LoginViewModel() }()
    
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var mailTxt: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tapLogin(_ sender: Any) {
        viewModelObject.callingLogin(mail:mailTxt.text ?? "", userPassword: passwordTxt.text ?? "", completion: { response in
            if self.viewModelObject.loginResponseObject?.status != "success" {
                self.displayAlert(message: self.viewModelObject.loginResponseObject?.message ?? "")
            }
            else {
            DispatchQueue.main.async {
                UserDefaults.standard.set(self.viewModelObject.loginResponseObject?.data?.userId, forKey: "userid")
                UserDefaults.standard.set(self.viewModelObject.loginResponseObject?.data?.loginStatus, forKey: "loginstatus")
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let tabBarVC = self.storyboard?.instantiateViewController(withIdentifier: "TabBarController") as! TabBarController
                self.navigationController?.pushViewController(tabBarVC, animated: true)
                }
            }
        })
    }
    
    func displayAlert(message : String)
    {
        let messageVC = UIAlertController(title: "", message: message, preferredStyle: .alert)
        DispatchQueue.main.async {
            
            self.present(messageVC, animated: true) {
                Timer.scheduledTimer(withTimeInterval: 0.4, repeats: false, block: { (_) in
                    messageVC.dismiss(animated: true, completion: nil)})
            }
        }
    }
}
