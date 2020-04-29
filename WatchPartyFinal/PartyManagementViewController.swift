//
//  PartyManagementViewController.swift
//  WatchPartyFinal
//
//  Created by Zach on 4/28/20.
//  Copyright © 2020 Nikhil Vaidyamath. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

protocol SegueHandler: class {
    func segueToNext(identifier: String)
    func getPartyInfo(name: String, ID: String)
}

class PartyManagementViewController: UIViewController, SegueHandler {
    
    var selectedPartyName = String()
    var selectedPartyID = String()
    
    func segueToNext(identifier: String) {
        self.performSegue(withIdentifier:identifier, sender: self)
    }
    
    func getPartyInfo(name: String, ID: String) {
        self.selectedPartyName = name
        self.selectedPartyID = ID
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func logoutPressed(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            // direct to initial sign-in/sign-up view
            let initialVC = storyboard?.instantiateViewController(identifier: "InitialViewController") as? ViewController
            view.window?.rootViewController = initialVC
            view.window?.makeKeyAndVisible()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbeddedSelectionSegue" {
            let dvc = segue.destination as! PartySelectionTableViewController
            dvc.delegate = self
        } else if segue.identifier == "SwipeSegue" {
            let dvc = segue.destination as! SwipeMoviesViewController
            dvc.partyName = self.selectedPartyName
            dvc.partyID = self.selectedPartyID
        }
    }
}
