import UIKit
import SnapKit

final class UsersTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension UsersTableView {
    func setupTableView() {
        separatorStyle = .none
        register(UsersTableViewCell.self, forCellReuseIdentifier: "UsersTableViewCell")
        backgroundColor = .clear
    }
}
