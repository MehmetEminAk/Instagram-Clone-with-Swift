//
//  alert.swift
//  Voie Upp!
//
//  Created by Macbook Air on 19.08.2022.
//

import Foundation
import UIKit


func returnAlert(errTitle : String, errBody : String) ->UIAlertController {
    let alert = UIAlertController(title: errTitle, message: errBody, preferredStyle: .alert)
    let okBtn = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(okBtn)
    return alert
}
