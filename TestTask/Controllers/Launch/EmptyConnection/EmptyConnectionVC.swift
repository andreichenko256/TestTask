import UIKit

final class EmptyConnectionViewController: UIViewController {
    
    var emptyConnectionView: EmptyConnectionView {
        return view as! EmptyConnectionView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = EmptyConnectionView()
    }
}
