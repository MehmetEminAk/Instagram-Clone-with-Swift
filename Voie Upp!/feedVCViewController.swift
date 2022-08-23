//
//  feedVCViewController.swift
//  Voie Upp!
//
//  Created by Macbook Air on 22.08.2022.
//

import UIKit
import Parse

class feedVCViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    var postOwnerArray : [String]! = []
    var isWhat : Int = 0
    var postCommentArray : [String]! = []
    var postUUIDArray : [String]! = []
    var postImageArray : [PFFileObject]! = []
    
    func getData(){
        let query = PFQuery(className: "Posts")
        query.findObjectsInBackground { [self] objects, error in
            if error != nil {
                let alert = returnAlert(errTitle: "ERROR!", errBody: error!.localizedDescription)
            }else{
                if objects!.count > 0 {
                    for object in objects! {
                        self.postCommentArray.append(object.object(forKey: "description") as! String)
                        self.postImageArray.append(object.object(forKey: "imgData") as! PFFileObject)
                        
                       
                        
                        self.postOwnerArray.append(object.object(forKey: "postOwner") as! String)
                        
                        
                    }
                }
               
                self.tableView.reloadData()
                
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postOwnerArray!.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath) as! feedTableViewCell
        
        postImageArray[indexPath.row].getDataInBackground { data, error in
            if error != nil {
                print(error?.localizedDescription)
            }else{
                if  data != nil  {
                    cell.imgView.image = UIImage(data: data!)
                }
                
            }
        }
        
        cell.usrNameLbl.text = self.postOwnerArray![indexPath.row]
        
        cell.descriptionLbl.text = self.postCommentArray[indexPath.row]
        self.isWhat += 1
        
        
        
        return cell
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()

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
