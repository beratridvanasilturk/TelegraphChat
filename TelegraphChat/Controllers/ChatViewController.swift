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
    
    let dataBase = Firestore.firestore()
    
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
        navigationItem.hidesBackButton = true
        ///Login olduktan sonra log out butonuyla cikis yapilabilecegi icin back butonunu bu ekranda islevsiz kalir ve bu kod ile back butonu devre disi birakilir
        title = Constants.appName
        
        tableView.register(UINib(nibName: Constants.cellNibName, bundle: nil), forCellReuseIdentifier: Constants.cellIdentifier)
        

    }
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        
        
        do {
          try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
            ///Sign out basarili oldugunda giris olan kok root ekrana doner, ki bu da bizim karsilama ekranimizdir.
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
        
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
        if let messageBody = messageTextfield.text, let messageSender =  Auth.auth().currentUser?.email {
            dataBase.collection(Constants.FStore.collectionName).addDocument(data: [Constants.FStore.senderField: messageSender, Constants.FStore.bodyField: messageBody]) { (error) in
                if let e = error {
                    print("Some issues with about saving data to firestore. \(e)")
                } else {
                    print("Succesfully data saved.")
                }
            }
        }
    }
    

}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    ///Mesajlasma kadar table view row'u olusturur
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! MessageCell
        cell.label.text = messages[indexPath.row].body
        /// Sirasiyla mesajlari text'teki label etiketine atar
        return cell
    }
    
    
}


