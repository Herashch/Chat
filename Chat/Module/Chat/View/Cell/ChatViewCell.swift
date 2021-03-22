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
    
    private var viewModel: ViewModel = .initial {
        didSet { render(viewModel) }
    }
    
    // MARK: - Life cycle
    
    override func prepareForReuse() {
        super.prepareForReuse()
        configure(with: .initial)
    }
    
}

// MARK: - Private methods

private extension ChatViewCell {
    func render(_ viewModel: ViewModel) {
        messageText.text = viewModel.text
    }
}

// MARK: - Public methods

extension ChatViewCell {
    func configure(with viewModel: ViewModel) {
        messageBody.layer.cornerRadius = messageBody.frame.size.height / 5
        self.viewModel = viewModel
    }
}

extension ChatViewCell {
    struct ViewModel {
        let chatID: String
        let date: Date
        let id: String
        let text: String
        let userID: String
        
        static var initial: Self { .init(chatID: "", date: Date(), id: "", text: "", userID: "")
        }
    }
}
