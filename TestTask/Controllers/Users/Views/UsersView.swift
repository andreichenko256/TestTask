import UIKit
import SnapKit

final class UsersView: MainView {
    
    let emptyView = EmptyView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView(titleText: "Working with GET request")
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UsersView {
    func setupConstraints() {
        [emptyView].forEach {
            addSubview($0)
        }
        
        emptyView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
