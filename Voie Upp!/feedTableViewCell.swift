//
//  feedTableViewCell.swift
//  Voie Upp!
//
//  Created by Macbook Air on 22.08.2022.
//

import UIKit

class feedTableViewCell: UITableViewCell {

    @IBOutlet weak var usrNameLbl: UILabel!
    @IBOutlet weak var uuidLbl: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func likeBtn(_ sender: Any) {
        
    }
    @IBAction func commentBtn(_ sender: Any) {
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        self.uuidLbl.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
