import UIKit
import SnapKit
import Kingfisher

final class UsersTableViewCell: UITableViewCell {
    
    lazy var photoImageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var cardView: UIView = {
        return $0
    }(UIView())
    
    lazy var mainCardInfoVerticalStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 4
        return $0
    }(UIStackView())
    
    lazy var contactsCardVerticalStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 4
        return $0
    }(UIStackView())
    
    lazy var nameLabel: UILabel = {
        $0.textColor = K.Colors.black87
        $0.numberOfLines = 0
        $0.font = K.Fonts.body1
        return $0
    }(UILabel())
    
    lazy var positionLabel: UILabel = {
        $0.textColor = K.Colors.black60
        $0.numberOfLines = 0
        $0.font = K.Fonts.body3
        return $0
    }(UILabel())
    
    lazy var emailLabel: UILabel = {
        $0.textColor = K.Colors.black87
        $0.font = K.Fonts.body3
        return $0
    }(UILabel())
    
    lazy var phoneLabel: UILabel = {
        $0.textColor = K.Colors.black87
        $0.numberOfLines = 0
        $0.font = K.Fonts.body3
        return $0
    }(UILabel())
    
    lazy var separatorView: UIView = {
        $0.backgroundColor = K.Colors.black12
        return $0
    }(UIView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImageView.image = nil
        nameLabel.text = nil
        positionLabel.text = nil
    }
}

private extension UsersTableViewCell {
    func setupConstraints() {
        [photoImageView,
         cardView].forEach {
            contentView.addSubview($0)
        }
        
        photoImageView.snp.makeConstraints {
            $0.height.width.equalTo(50)
            $0.top.equalTo(24)
            $0.leading.equalTo(16)
        }
        
        cardView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(photoImageView.snp.trailing).offset(16)
            $0.bottom.equalToSuperview()
        }
        setupCardViewConstraints()
        
    }
    
    func setupCardViewConstraints() {
        [mainCardInfoVerticalStack,
         contactsCardVerticalStack,
         separatorView].forEach {
            cardView.addSubview($0)
        }
        
        mainCardInfoVerticalStack.snp.makeConstraints {
            $0.top.horizontalEdges.equalToSuperview()
        }
        setupMainCardInfoVerticalStackConstraints()
        
        contactsCardVerticalStack.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(mainCardInfoVerticalStack.snp.bottom).offset(8)
            $0.bottom.equalTo(separatorView.snp.top).inset(-24)
        }
        setupContactsCardVerticalStackConstraints()
        
        separatorView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
            $0.horizontalEdges.equalToSuperview()
        }
    }
    
    func setupMainCardInfoVerticalStackConstraints() {
        [nameLabel, positionLabel].forEach {
            mainCardInfoVerticalStack.addArrangedSubview($0)
        }
    }
    
    func setupContactsCardVerticalStackConstraints() {
        [emailLabel, phoneLabel].forEach {
            contactsCardVerticalStack.addArrangedSubview($0)
        }
    }
}

extension UsersTableViewCell {
    func configureCell(photo: String, name: String, position: String, email: String, phone: String) {
        photoImageView.kf.indicatorType = .activity
        photoImageView.kf.setImage(
            with: URL(string: photo),
            placeholder: UIImage(named: "placeholder"),
            options: [.transition(.fade(0.2))]
        )
        
        nameLabel.text = name
        positionLabel.text = position
        emailLabel.text = email
        phoneLabel.text = phone
    }
}
