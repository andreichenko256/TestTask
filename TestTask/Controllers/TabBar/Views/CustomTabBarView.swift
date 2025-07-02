import UIKit
import SnapKit

final class CustomTabBarView: UIView {
    var onTabSelected: ((TabView) -> Void)?
    
    lazy var tabBarContainerView: UIView = {
        $0.backgroundColor = K.Colors.tabBarBackground
        return $0
    }(UIView())
    
    
    
    lazy var bottomSafeAreaBackgroundView: UIView = {
        $0.backgroundColor = K.Colors.tabBarBackground
        return $0
    }(UIView())
    
    lazy var horizontalStackView: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.backgroundColor = .clear
        return $0
    }(UIStackView())
    
    lazy var contentView: UIView = {
        $0.backgroundColor = .clear
        return $0
    }(UIView())
    
    let userTab: TabView = .init(title: "Users", imageName: "person.3.sequence.fill")
    let signUpTab: TabView = .init(title: "Sign Up", imageName: "person.crop.circle.fill.badge.plus")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Costraints
private extension CustomTabBarView {
    func setupConstraints() {
        [tabBarContainerView,
         bottomSafeAreaBackgroundView, contentView].forEach {
            addSubview($0)
        }
        

        
        tabBarContainerView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(56)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
        setupTabBarContainerViewConstraints()
        
        contentView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(tabBarContainerView.snp.top)
        }
        
        bottomSafeAreaBackgroundView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.top.equalTo(tabBarContainerView.snp.bottom)
        }
    }
    
    func setupTabBarContainerViewConstraints() {
        tabBarContainerView.addSubview(horizontalStackView)
        
        horizontalStackView.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview()
            $0.verticalEdges.equalToSuperview().inset(16)
        }
        setupHorizontalStackViewConstraints()
    }
    
    func setupHorizontalStackViewConstraints() {
        [userTab, signUpTab].forEach { tab in
            tab.onTap = { [weak self] in
                self?.onTabSelected?(tab)
            }
            
            horizontalStackView.addArrangedSubview(tab)
        }
    }
}

// MARK: - Update selection tab
extension CustomTabBarView {
    func setActiveTab(_ selectedTab: Tabs) {
        let tabs: [(Tabs, TabView)] = [
            (.users, userTab),
            (.signUp, signUpTab)
        ]
        
        for (tab, view) in tabs {
            let isSelected = tab == selectedTab
            UIView.transition(with: view.imageView, duration: 0.2, options: .transitionCrossDissolve) {
                view.imageView.tintColor = isSelected ? K.Colors.secondary : K.Colors.black60
            }
            
            UIView.transition(with: view.titleLabel, duration: 0.2, options: .transitionCrossDissolve) {
                view.titleLabel.textColor = isSelected ? K.Colors.secondary : K.Colors.black60
            }
            view.isUserInteractionEnabled = !isSelected
        }
    }
}
