//
//  ChatViewCell.swift
//  Chat
//
//  Created by Ivan Herashchenko on 18.03.2021.
//

import UIKit

class ChatViewCell: UITableViewCell {
    
    // MARK: - Outlets

    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    @IBOutlet weak var messageBody: UIView!
    @IBOutlet weak var messageText: UILabel!
    
    // MARK: - Private properties
    
//    private var viewModel: ViewModel = .initial {
//        didSet { render(viewModel) }
//    }
    
    // MARK: - Public methods
    
    func configure() {
        messageBody.layer.cornerRadius = messageBody.frame.size.height / 5
    }
    
}

extension ChatViewCell {
    struct ViewModel {
        let sender: String
        let body: String
        
        static var initial: Self { .init(sender: "", body: "") }
    }
}
