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
        emptyConnectionView.onTapTryAgainButton = { [self] in
            emptyConnectionView.spinner.startAnimating()
            emptyConnectionView.coverView.isHidden.toggle()
            view.isUserInteractionEnabled.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {[self] in
                emptyConnectionView.spinner.stopAnimating()
                view.isUserInteractionEnabled.toggle()
                emptyConnectionView.coverView.isHidden.toggle()
            }
        }
    }
}
