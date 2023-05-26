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
    
    
    var messages: [Message] = [
        Message(sender: "Deneme1@mail.com", body: "Hey"),
        Message(sender: "Deneme2@mail.com", body: "Hey man!"),
        Message(sender: "Deneme1@mail.com", body: "What's up mate?"),
        Message(sender: "Deneme2@mail.com", body: "Everthing's perfect bro where are you?"),
        Message(sender: "Deneme1@mail.com", body: "Umm... I don't know i just see a huge shark"),
        Message(sender: "Deneme2@mail.com", body: "What? a Shark? Ahh you are joking me..")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        //
        
        navigationItem.hidesBackButton = true
        ///Login olduktan sonra log out butonuyla cikis yapilabilecegi icin back butonunu bu ekranda islevsiz kalir ve bu kod ile back butonu devre disi birakilir
        title = Constants.appName
        

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

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    ///Mesajlasma kadar table view row olusturur
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath)
        cell.textLabel?.text = messages[indexPath.row].body
        /// sirasiyla mesajlari texte atar
        return cell
    }
    
    
}


