import UIKit

final class EmptyConnectionViewController: UIViewController {
    
    var emptyConnectionView: EmptyConnectionView {
        return view as! EmptyConnectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handleTryAgainButtonTapped()
    }
    
    override func loadView() {
        view = EmptyConnectionView()
    }
}

private extension EmptyConnectionViewController {
    func handleTryAgainButtonTapped() {
        emptyConnectionView.onTapTryAgain = {
            print("tapped")
        }
    }
}
