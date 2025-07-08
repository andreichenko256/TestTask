import UIKit

final class SignUpViewController: UIViewController {
    
    var siguUpView: SignUpView {
        return view as! SignUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkManager.shared.fetchPositions()
    }
    
    override func loadView() {
        view = SignUpView()
    }
}

private extension SignUpViewController {
    
}
