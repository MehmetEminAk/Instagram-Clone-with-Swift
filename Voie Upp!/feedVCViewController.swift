//
//  feedVCViewController.swift
//  Voie Upp!
//
//  Created by Macbook Air on 22.08.2022.
//

import UIKit
import Parse

class feedVCViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var postOwnerArray : [String]?
    var postCommentArray : [String]?
    var postUUIDArray : [String]?
    var postImageArray : [PFFile]?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postOwnerArray!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! feedTableViewCell
        
        cell.usrNameLbl.text = self.postOwnerArray![indexPath.row]
        
        cell.imgView = self.postImageArray![indexPath.row] as! UIImageView
        
        
        return cell
        
    }
    @IBOutlet weak var tableView: UITableView!
    
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
