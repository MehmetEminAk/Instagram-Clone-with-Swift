//
//  feedTableViewCell.swift
//  Voie Upp!
//
//  Created by Macbook Air on 22.08.2022.
//

import UIKit
import Parse

class feedTableViewCell: UITableViewCell {

    @IBOutlet weak var usrNameLbl: UILabel!
    @IBOutlet weak var uuidLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    @IBAction func likeBtn(_ sender: Any) {
        let likeObject = PFObject(className: "Likes")
        likeObject["fromUser"] =  PFUser.current()?.username
        likeObject["whichImg"] = self.uuidLbl.text
        likeObject.saveInBackground { success, error in
            if error != nil {
                print("An error occured")
            }else{
                print("Liked succesfully")
                
            }
        }
    }
    @IBAction func commentBtn(_ sender: Any) {
        let commentObjects = PFObject(className: "Comments")
        commentObjects["fromUser"] = PFUser.current()?.username
        commentObjects["whichImg"] = self.uuidLbl.text
        
        
        commentObjects["comment"] = "\(PFUser.current()?.username) tarafından \(self.uuidLbl.text) id li resime yapılan yorum."
        commentObjects["commentId"] = "\(UUID().uuidString)"
        commentObjects.saveInBackground { succes, error in
            if error != nil {
                print("Error!")
            }else{
                print("Comments saved succesfully!")
                
            }
        }
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
