import UIKit
import SnapKit

final class CustomTabBarViewController: UIViewController {
    
    var customTabBarView: CustomTabBarView {
        return view as! CustomTabBarView
    }
    
    var currentVC: UIViewController?
    
    var tabBarTabs: [TabView: Tabs] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabs()
        handleTabSelection(tab: .users)
        customTabBarView.onTabSelected = { [weak self] tabView in
            guard let self, let selectedTab = self.tabBarTabs[tabView] else { return }
            HapticManager.shared.vibrateForSelection()
            self.handleTabSelection(tab: selectedTab)
        }
    }
    
    override func loadView() {
        view = CustomTabBarView()
    }
}

private extension CustomTabBarViewController {
    func setupTabs() {
        tabBarTabs[customTabBarView.userTab] = .users
        tabBarTabs[customTabBarView.signUpTab] = .signUp
    }
    
    func handleTabSelection(tab: Tabs) {
        customTabBarView.setActiveTab(tab)
        
        switch tab {
        case .users:
            currentVC = UsersViewController()
        case .signUp:
            currentVC = SignUpViewController()
        }
        
        updateViewControllerSelection()
    }
    
    func updateViewControllerSelection() {
        if let oldVC = children.first {
            oldVC.willMove(toParent: nil)
            oldVC.view.removeFromSuperview()
            oldVC.removeFromParent()
        }

        guard let newVC = currentVC else { return }
        
        addChild(newVC)
        customTabBarView.contentView.addSubview(newVC.view)
        newVC.view.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        newVC.didMove(toParent: self)
    }
}
