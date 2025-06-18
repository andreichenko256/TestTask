import UIKit

final class LaunchViewController: UIViewController {
    
    let isConnectedToInternet: Bool = false
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if !isConnectedToInternet {
            let emptyVC = EmptyConnectionViewController()
            setRootController(emptyVC)
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
