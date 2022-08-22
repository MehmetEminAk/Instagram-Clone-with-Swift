//
//  feedVC.swift
//  Voie Upp!
//
//  Created by Macbook Air on 22.08.2022.
//

import UIKit
import Parse

class addImageVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    var imgPicker : UIImagePickerController?
    @objc func chooseImgFunc(){
        self.imgPicker = UIImagePickerController()
        self.imgPicker!.delegate = self
        imgPicker?.sourceType = .photoLibrary
        self.present(self.imgPicker!, animated: true)
        
        
        
        
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        chooseImg.image = info[.originalImage] as! UIImage
        self.dismiss(animated: true)
        self.postImg.isEnabled = true
        
        
    }
    @objc func dissmissKybrd(){
        view.endEditing(true)
    }
    @IBOutlet weak var postImg: UIButton!
    @IBOutlet weak var commentTW: UITextView!
    @IBOutlet weak var chooseImg: UIImageView!
    @objc func postServerFunc(){
        var postLikes = 0
        let data = self.chooseImg.image?.jpegData(compressionQuality: 0.5)
        let object = PFObject(className: "Posts")
        let imgData = PFFileObject(name: "\(UUID().uuidString) ", data: data!)
        
        
        object["imgData"] = imgData
        object["description"] = commentTW.text
        object["postOwner"] = PFUser.current()?.username
        object["likes"] = postLikes
        object.saveInBackground { succes, error in
            if error != nil {
                let alert = returnAlert(errTitle: "ERROR!", errBody: "\(error!.localizedDescription). Please try again! ")
                self.present(alert, animated: true)
                
            }else{
                self.chooseImg.image = .add
                self.commentTW.text = "Açıklama girin"
                self.tabBarController?.selectedIndex = 0
                
            }
        }
        self.postImg.isEnabled = false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.postImg.setTitle("PAYLAŞ", for: .normal)
        self.postImg.addTarget(self, action: #selector(postServerFunc), for: .touchUpInside)
        self.postImg.backgroundColor = .cyan
        self.postImg.layer.cornerRadius = 15
        self.postImg.isEnabled = false
        
        let dissmissKybrdGstr = UITapGestureRecognizer(target: self, action: #selector(dissmissKybrd))
        view.addGestureRecognizer(dissmissKybrdGstr)
        let imgGesture = UITapGestureRecognizer(target: self, action: #selector(chooseImgFunc))
        chooseImg.addGestureRecognizer(imgGesture)

        
    }
    

    
}
