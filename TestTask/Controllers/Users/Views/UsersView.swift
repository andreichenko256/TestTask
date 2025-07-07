import UIKit
import SnapKit

final class UsersView: MainView {
    
    let emptyView = EmptyView()
    let tableView = UsersTableView()
    let activityIndicatorView = UIActivityIndicatorView(style: .medium)
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
        [emptyView, tableView, activityIndicatorView].forEach {
            addSubview($0)
        }
        
        emptyView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom)
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
//        
//        activityIndicatorView.snp.makeConstraints {
//            $0.top.equalTo(tableView.snp.bottom)
//            $0.centerX.equalToSuperview()
//            $0.bottom.lessThanOrEqualToSuperview().inset(16)
//        }
    }
}
