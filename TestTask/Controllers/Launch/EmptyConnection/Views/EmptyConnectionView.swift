import UIKit
import SnapKit

final class EmptyConnectionView: UIView {
    // MARK: - Outputs
    var onTapTryAgainButton: (() -> Void)?
    
    // MARK: - Private UI Elements
    private lazy var forbiddenImageView: UIImageView = {
        $0.image = UIImage(named: "emptyconnection.forbidden")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.text = "There is no internet connection"
        $0.numberOfLines = 0
        $0.font = K.Fonts.heading1
        return $0
    }(UILabel())
    
    // MARK: - Internal UI Elements
    lazy var tryAgainButton: PrimaryFilledButton = {
        $0.addTarget(self, action: #selector(tryAgainButtonTapped), for: .touchUpInside)
        return $0
    }(PrimaryFilledButton(title: "Try again"))
    
    lazy var spinner: UIActivityIndicatorView = {
        $0.style = .large
        $0.center = center
        addSubview($0)
        return $0
    }(UIActivityIndicatorView())
    
    lazy var coverView: UIView = {
        $0.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        $0.isHidden = true
        addSubview($0)
        $0.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        return $0
    }(UIView())
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EmptyConnectionView {
    // MARK: - Setup Methods
    func setupUI() {
        backgroundColor = K.Colors.background
        setupConstraints()
    }
    
    // MARK: - Layout
    func setupConstraints() {
        [forbiddenImageView, titleLabel, tryAgainButton].forEach {
            addSubview($0)
        }
        
        forbiddenImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(160)
            $0.size.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(forbiddenImageView.snp.bottom).inset(-24)
        }
        
        tryAgainButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(titleLabel.snp.bottom).inset(-24)
            
        }
    }
    
    // MARK: - Actions
    @objc func tryAgainButtonTapped() {
        onTapTryAgainButton?()
    }
}
