import UIKit
import SnapKit

final class PrimaryFilledButton: UIButton {

    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PrimaryFilledButton {
    func setupUI() {
        backgroundColor = K.Colors.primary
        titleLabel?.font = K.Fonts.body1
        setTitleColor(K.Colors.black87, for: .normal)
        
        layer.cornerRadius = 24
        
        snp.makeConstraints {
            $0.width.equalTo(140)
            $0.height.equalTo(48)
        }
    }
}
