//
//  LoginVC.swift
//  LoginMVVM
//
//  Created by Narender Kumar on 16/08/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    private var loginViewModel = LoginViewModel()
    private var userListViewModel = UserListViewModel()
    var spinner = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // showActivityIndicatory()
        loginViewModel.delegate = self
        
    }
    
    func showActivityIndicatory() {
        spinner.center = self.view.center
        self.view.addSubview(spinner)
        spinner.startAnimating()
    }
    
    @IBAction func doLogin(_ sender: Any) {
        userName.resignFirstResponder()
        password.resignFirstResponder()
        showActivityIndicatory()
        let request = LoginRequest(userEmail: userName.text ?? "", userPassword: password.text ?? "")
        loginViewModel.loginUser(loginRequest: request)
    }

}

extension LoginViewController : LoginViewModelDelegate
{
    func didReceiveLoginResponse(loginResponse: LoginResponse?){
        spinner.stopAnimating()
        if(loginResponse?.errorMessage == nil && loginResponse?.data != nil)
        {
            let userListVC = self.storyboard?.instantiateViewController(withIdentifier: UserListViewController.identifier) as! UserListViewController
            
            self.navigationController?.pushViewController(userListVC, animated: true)

        }
        else if (loginResponse?.errorMessage != nil)
        {
            let alert = UIAlertController(title: Constants.ErrorAlertTitle, message: loginResponse?.errorMessage, preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: Constants.OkAlertTitle, style: .default, handler: nil))

            self.present(alert, animated: true)
        }
    }
}



