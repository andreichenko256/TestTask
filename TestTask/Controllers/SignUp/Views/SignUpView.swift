import UIKit
import SnapKit

final class SignUpView: MainView {
    
    lazy var nameTextField: UITextField = createFormTextField(title: "Your Name")
    lazy var emailTextField: UITextField = createFormTextField(title: "Email")
    lazy var phoneTextField: UITextField = createFormTextField(title: "Phone")
    
    lazy var formVStackView: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 32
        $0.distribution = .fillProportionally
        return $0
    }(UIStackView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView(titleText: "Working with POST request")
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension SignUpView {
    func setupConstraints() {
        [formVStackView].forEach {
            addSubview($0)
        }
        
        formVStackView.snp.makeConstraints {
            $0.top.equalTo(topBarView.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        
        setupFormVStackView()
    }
    
    func setupFormVStackView() {
        [nameTextField, emailTextField, phoneTextField].forEach {
            $0.snp.makeConstraints {make in
                make.height.equalTo(56)
            }

            formVStackView.addArrangedSubview($0)
        }
    }
    
    func createFormTextField(title: String) -> UITextField {
        let textField = UITextField()
        textField.placeholder = title
        textField.attributedPlaceholder = NSAttributedString(
            string: title,
            attributes: [
                .foregroundColor: K.Colors.black48,
                .font: K.Fonts.body1
            ]
        )
        textField.textColor = K.Colors.black87
        textField.font = K.Fonts.body1
        textField.layer.cornerRadius = 8
        textField.layer.borderWidth = 1
        textField.layer.borderColor = K.Colors.border.cgColor
        textField.clipsToBounds = true
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 0))
        textField.leftView = paddingView
        textField.leftViewMode = .always
        return textField
    }
}
