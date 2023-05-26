//
//  ChatViewController.swift
//  TelegraphChat
//
//  Created by Berat Ridvan Asilturk 23/05/2023.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        ///Login olduktan sonra log out butonuyla cikis yapilabilecegi icin back butonunu bu ekranda islevsiz kalir ve bu kod ile back butonu devre disi birakilir
        title = "Telegraph Chat"
        

    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        
        do {
          try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
            ///Sign out basarili oldugunda giris olan kok root ekrana doner
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    

}
