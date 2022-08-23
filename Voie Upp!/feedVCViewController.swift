//
//  feedVCViewController.swift
//  Voie Upp!
//
//  Created by Macbook Air on 22.08.2022.
//

import UIKit
import Parse
import StoreKit

class feedVCViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var navigationBar: UINavigationBar!
    var postOwnerArray : [String]! = []
    var isWhat : Int = 0
    var postCommentArray : [String]! = []
    var postUUIDArray : [String]! = []
    var postImageArray : [PFFileObject]! = []
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(getData), name: NSNotification.Name(rawValue: "newPost"), object: nil)
    }
    @objc func getData(){
        let query = PFQuery(className: "Posts")
        query.addDescendingOrder("createdAt")
        query.findObjectsInBackground { [self] objects, error in
            if error != nil {
                let alert = returnAlert(errTitle: "ERROR!", errBody: error!.localizedDescription)
            }else{
                if objects!.count > 0 {
                    self.postImageArray.removeAll()
                    self.postOwnerArray.removeAll()
                    self.postCommentArray.removeAll()
                    self.postUUIDArray.removeAll()
                    for object in objects! {
                        self.postCommentArray.append(object.object(forKey: "description") as! String)
                        self.postImageArray.append(object.object(forKey: "imgData") as! PFFileObject)
                        
                       
                        
                        self.postOwnerArray.append(object.object(forKey: "postOwner") as! String)
                        self.postUUIDArray.append(object.object(forKey: "imgId") as! String)
                        
                        
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
        cell.uuidLbl.text = self.postUUIDArray[indexPath.row]
        
        
        cell.usrNameLbl.text = self.postOwnerArray![indexPath.row]
        
        cell.descriptionLbl.text = self.postCommentArray[indexPath.row]
        self.isWhat += 1
        
        
        
        return cell
        
    }
    @objc func logOutFunction(){
        let isSureOut = returnAlert(errTitle: "LOGOUT", errBody: "Are you sure to logout? If you are not press OK")
        let yesSure = UIAlertAction(title: "YES", style: .default) { alert in
            PFUser.logOut()
            self.performSegue(withIdentifier: "logoutSegue", sender: nil)
            
        }
        isSureOut.addAction(yesSure)
        self.present(isSureOut, animated: true)
        
        
    }
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        getData()
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(title: "LOG OUT", style: .plain, target: self, action: #selector(logOutFunction))

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
