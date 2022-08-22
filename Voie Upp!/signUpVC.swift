//
//  signUpVC.swift
//  Voie Upp!
//
//  Created by Macbook Air on 22.08.2022.
//

import UIKit
import Parse

class signUpVC: UIViewController {
    var name,surname,username,password : String?
    
    @IBAction func toTheIn(_ sender: Any) {
        performSegue(withIdentifier: "uptoIn", sender: nil)
    }
    @objc func signintofeed(){
        self.name = nameTF.text
        self.surname = surnameTF.text
        self.username = usernameTF.text
        self.password = passTF.text
        if (
            name != nil
            && name != ""
            && surname != nil
            && surname != ""
            && username != nil
            && username != ""
            && password != nil
            && password != ""){
            let newUsrInfos = PFObject(className: "UsersInfos")
            let newUsr = PFUser()
            newUsr.username = self.username
            newUsr.password = self.password
            newUsrInfos["name"] = name
            newUsrInfos["surname"] = surname
            newUsr.signUpInBackground { succes, error in
                if error != nil {
                    let returnAlert = returnAlert(errTitle: "ERROR!", errBody: error!.localizedDescription)
                    self.present(returnAlert, animated: true)
                    
                    
                }else if succes == true{
                    self.performSegue(withIdentifier: "uptoFeed", sender: nil)
                    
                    
                }
            }
            newUsrInfos.saveInBackground { succes, error in
                if error != nil {
                    let alert = returnAlert(errTitle: "ERROR!", errBody: error!.localizedDescription)
                    self.present(alert, animated: true)
                }
            }
            
        }else{
            let alertt = returnAlert(errTitle: "An error occured!", errBody: "Please type true format informations")
            self.present(alertt, animated: true)
        }
    }
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var surnameTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    @IBOutlet weak var signupBtn: UIButton!
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let dismissKybrdGstr = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(dismissKybrdGstr)
        
        signupBtn.addTarget(self, action: #selector(signintofeed), for: .touchUpInside)
        signupBtn.layer.cornerRadius = 15
        signupBtn.backgroundColor = .cyan
        
    }
    


}
