import UIKit
import SnapKit

final class PrimaryFilledButton: UIButton {
    
    // MARK: - Overrides
    override var isEnabled: Bool {
        didSet {
            updateAppearance()
        }
    }
    
    // MARK: - Initializers
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        addTarget(self, action: #selector(didTouchDown), for: .touchDown)
        addTarget(self, action: #selector(didTouchUp), for: [.touchUpInside, .touchUpOutside, .touchCancel])
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension PrimaryFilledButton {
    // MARK: - Setup Methods
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
    
    func updateAppearance() {
        if isEnabled {
            // TODO: Configure appearance for enabled button state
        } else {
            backgroundColor = K.Colors.disabled
            setTitleColor(K.Colors.black48, for: .normal)
        }
    }
    
    // MARK: - Actions
    @objc private func didTouchDown() {
        backgroundColor = K.Colors.pressed
    }
    
    @objc private func didTouchUp() {
        backgroundColor = K.Colors.primary
    }
}
