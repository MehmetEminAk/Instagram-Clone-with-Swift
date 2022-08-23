//
//  exploreVC.swift
//  Voie Upp!
//
//  Created by Macbook Air on 23.08.2022.
//

import UIKit

class exploreVC: UIViewController ,UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVieww.dequeueReusableCell(withIdentifier: "secondCell") as! secondCell
        cell.firstCell.text = "Label"
        cell.secondCell.text = "Label"
        cell.thirdCell.text = "Label"
        
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    @IBOutlet weak var tableVieww: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableVieww.delegate = self
        tableVieww.dataSource = self
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
