//
//  PartyJoinViewController.swift
//  WatchPartyFinal
//
//  Created by Antoine Assaf on 4/29/20.
//  Copyright © 2020 Nikhil Vaidyamath. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class PartyJoinViewController: UIViewController {
    
    @IBOutlet var partyIdField: UITextField!
    @IBOutlet var errorMessage: UILabel!
    @IBOutlet var joinButton: UIButton!
    @IBOutlet var exitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIUtilities.styleTextField(partyIdField)
        UIUtilities.styleFilledButtonParty(joinButton)
        UIUtilities.styleFilledButtonCancel(exitButton)
        errorMessage.alpha = 0;
    }

    @IBAction func joinParty(_ sender: Any) {
        if partyIdField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            errorMessage.text = "Please enter the unique party ID"
            errorMessage.alpha = 1;
        }
        else{
            let userID = Auth.auth().currentUser!.uid
            let db = Firestore.firestore()
            db.collection("parties").document(partyIdField.text!).getDocument{ (document, error) in
                if let document = document {
                    let partyName = document.get("name")!
                    db.collection("users").document(userID).updateData([
                        "partyNames": FieldValue.arrayUnion([partyName]),
                        "partyIDs": FieldValue.arrayUnion([self.partyIdField.text!]),
                    ])
                    db.collection("parties").document(self.partyIdField.text!).updateData([
                        "members": FieldValue.arrayUnion([userID])
                    ])
                    
                    // Direct back to party management
                    let partyManagementVC = self.storyboard?.instantiateViewController(identifier: "PartyManagement") as? PartyManagementViewController
                    self.view.window?.rootViewController = partyManagementVC
                    self.view.window?.makeKeyAndVisible()
                }
                else{
                    self.errorMessage.text = "Invalid ID"
                    self.errorMessage.alpha = 1;
                }
            }
        }
    }
    @IBAction func cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
