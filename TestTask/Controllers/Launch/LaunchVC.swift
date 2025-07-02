import UIKit

final class LaunchViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        checkConnection()
    }
    
    override func loadView() {
        view = LaunchView()
        
    }
} 

private extension LaunchViewController {
    func checkConnection() {
        print("check")
        ConnectivityManager.shared.observeConnectionStatus { [self] isConnected in
            if isConnected {
                print("true")
                let customTabBarVC = CustomTabBarViewController()
                setRootController(customTabBarVC)
            } else {
                let emptyConnectionVC = EmptyConnectionViewController()
                emptyConnectionVC.delegate = self
                setRootController(emptyConnectionVC)
                print("false")
            }
        }
    }
    
    func setRootController(_ viewController: UIViewController) {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = scene.windows.first {
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        }
    }
}

extension LaunchViewController: EmptyConnectionViewControllerDelegate {
    func didTapTryAgainButton() {
        checkConnection()
        print("hello")
    }
}
