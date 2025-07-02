import UIKit

final class UsersViewController: UIViewController {
    let testArr: [String] = ["dsa"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForEmpty()
    }
    
    override func loadView() {
        view = UsersView()
    }
    
    private var usersView: UsersView {
        return view as! UsersView
    }
}

private extension UsersViewController {
    func checkForEmpty() {
        usersView.emptyView.isHidden = !testArr.isEmpty
    }
}
