import UIKit

final class UsersViewController: UIViewController {
    var users: [User] = []
    
    private var currentPage = 1
    private var isLoading = false
    
    private var usersView: UsersView {
        return view as! UsersView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersView.tableView.dataSource = self
        usersView.tableView.delegate = self
        fetchUsers(page: currentPage)
    }
    
    override func loadView() {
        view = UsersView()
    }
    
    private func fetchUsers(page: Int) {
        isLoading = true
        print("Fetching page \(page)")
        usersView.activityIndicatorView.startAnimating()
        NetworkManager.shared.fetchUsers(page: page, count: 6) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let users):
                self.users.append(contentsOf: users)
                self.currentPage += 1
            case .failure(let error):
                print(error)
            }
            
            self.usersView.tableView.reloadData()
            self.usersView.activityIndicatorView.stopAnimating()
            self.checkForEmpty()
            self.isLoading = false
        }
    }
}

private extension UsersViewController {
    func checkForEmpty() {
        usersView.emptyView.isHidden = !users.isEmpty
    }
}

extension UsersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsersTableViewCell", for: indexPath) as! UsersTableViewCell
        let user = users[indexPath.row]
        cell.configureCell(photo: user.photo, name: user.name, position: user.position, email: user.email, phone: user.phone)
        return cell
    }
}

extension UsersViewController: UITableViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // fetchUsers(page: currentPage) // Disabled to prevent fetching during scroll
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.size.height
        if offsetY > contentHeight - frameHeight * 1.5, !isLoading {
            fetchUsers(page: currentPage)
        }
    }
}
