//
//  MessageCell.swift
//  TelegraphChat
//
//  Created by Berat Rıdvan Asiltürk on 27.05.2023.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet var messageBuble: UIView!
    @IBOutlet var label: UILabel!
    @IBOutlet var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
