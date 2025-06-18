import UIKit

final class LaunchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        ConnectivityManager.shared.observeConnectionStatus { [self] isConnected in
            if isConnected {
                print("true")
            } else {
                setRootController(EmptyConnectionViewController())
            }
        }
    }
    
    override func loadView() {
        view = LaunchView()
    }
}

private extension LaunchViewController {
    func setRootController(_ viewController: UIViewController) {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        }
    }
}
