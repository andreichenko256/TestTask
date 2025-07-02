import UIKit
import SnapKit

class MainView: UIView {
    
    lazy var topBarView: UIView = {
        $0.backgroundColor = K.Colors.primary
        return $0
    }(UIView())
    
    lazy var titleLabel: UILabel = {
        $0.textColor = K.Colors.topBarText
        $0.font = K.Fonts.heading1
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MainView {
    func setupUI() {
        backgroundColor = K.Colors.background
    }
    
    func setupConstraints() {
        [topBarView].forEach {
            addSubview($0)
        }
        
        topBarView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide.snp.top)
            $0.height.equalTo(56)
        }
        
        topBarView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

extension MainView {
    func configureView(titleText: String) {
        titleLabel.text = titleText
    }
}
