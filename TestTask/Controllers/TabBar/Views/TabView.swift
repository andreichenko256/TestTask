import UIKit
import SnapKit

final class TabView: UIView {
    var onTap: (() -> Void)?
    
    lazy var containerView: UIView = {
        $0.backgroundColor = .clear
        return $0
    }(UIView())
    
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.tintColor = K.Colors.black60
        return $0
    }(UIImageView())
    
    lazy var titleLabel: UILabel = {
        $0.textColor = K.Colors.black60
        $0.font = K.Fonts.body1
        return $0
    }(UILabel())
    
    init(title: String, imageName: String) {
        super.init(frame: .zero)
        imageView.image = UIImage(systemName: imageName)
        titleLabel.text = title
        setupConstraints()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Constraints
private extension TabView {
    func setupConstraints(){
        addSubview(containerView)
        
        [imageView, titleLabel].forEach {
            containerView.addSubview($0)
        }
        
        containerView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.centerX.equalToSuperview()
            $0.leading.equalTo(imageView)
            $0.trailing.equalTo(titleLabel)
        }
        
        imageView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.equalTo(imageView.snp.trailing).offset(8)
            $0.verticalEdges.equalToSuperview()
        }
    }
}

// MARK: - Gesture
private extension TabView {
    func setupGesture() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        addGestureRecognizer(gesture)
    }
    
    @objc func handleTap() {
        onTap?()
    }
}
