//
//  ChatListCell.swift
//  Chat
//
//  Created by Ivan Herashchenko on 16.03.2021.
//

import UIKit

final class ChatListCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var textContentLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
    
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

private extension ChatListCell {
    
    func render(_ viewModel: ViewModel) {
        avatarImageView.image = UIImage(named: viewModel.avatar)
        titleLabel.text = viewModel.title
        textContentLabel.text = viewModel.content
        timeLabel.text = viewModel.time.description
    }
    
    func setupAvatarImageView() {
        avatarImageView.layer.borderWidth = 1.0
        avatarImageView.layer.masksToBounds = false
        avatarImageView.layer.borderColor = UIColor.black.cgColor
        avatarImageView.layer.cornerRadius = avatarImageView.frame.size.width/2
        avatarImageView.clipsToBounds = true
    }
}

// MARK: - Public methods

extension ChatListCell {
    func configure(with viewModel: ViewModel) {
        setupAvatarImageView()
        self.viewModel = viewModel
    }
}

extension ChatListCell {
    struct ViewModel {
        let avatar: String
        let content: String
        let id: String
        let title: String
        let time: Date
        let action: Command
        
        static var initial: Self { .init(avatar: "", content: "", id: "", title: "", time: Date(), action: .nop)
        }
    }
}
