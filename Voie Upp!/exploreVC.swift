//
//  exploreVC.swift
//  Voie Upp!
//
//  Created by Macbook Air on 22.08.2022.
//

import UIKit
import Parse

class exploreVC: UIViewController {

    @IBAction func logOutBtn(_ sender: Any) {
        PFUser.logOutInBackground { error in
            if error != nil {
                print(error?.localizedDescription)
            }
            else{
                self.performSegue(withIdentifier: "outtoın", sender: nil)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
