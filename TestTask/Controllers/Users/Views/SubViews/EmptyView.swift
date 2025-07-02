import UIKit
import SnapKit

final class EmptyView: UIView {
    lazy var iconImageView: UIImageView = {
        $0.image = UIImage(named: "emptyusers.icon")
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    lazy var titleLabel: UILabel = {
        $0.text = "There are no users yet"
        $0.textColor = K.Colors.black87
        $0.font = K.Fonts.heading1
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension EmptyView {
    func setupConstraints() {
        [iconImageView, titleLabel].forEach {
            addSubview($0)
        }
        
        iconImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.horizontalEdges.equalToSuperview()
            $0.height.width.equalTo(200)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconImageView.snp.bottom).offset(24)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
}
