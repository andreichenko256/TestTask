import UIKit

protocol EmptyConnectionViewControllerDelegate: AnyObject {
    func didTapTryAgainButton()
}

final class EmptyConnectionViewController: UIViewController {
    
    weak var delegate: EmptyConnectionViewControllerDelegate?
    
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
            delegate?.didTapTryAgainButton()
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {[self] in
                emptyConnectionView.spinner.stopAnimating()
                view.isUserInteractionEnabled.toggle()
                emptyConnectionView.coverView.isHidden.toggle()
            }
        }
    }
}
