import UIKit
import SnapKit

final class SignUpView: MainView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView(titleText: "Working with POST request")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
