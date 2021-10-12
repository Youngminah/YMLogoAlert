
import UIKit

public enum YMLogoAlertButtonStyle{
    case confirmAndCancel
    case confirm
}

@available(iOS 13.0, *)
open class YMLogoAlert: UIView {

    private let alertView: UIView = {
       let alert = UIView()
        alert.backgroundColor = .white
        alert.layer.masksToBounds = true
        alert.layer.cornerRadius = 11
        return alert
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 2
        titleLabel.font = .systemFont(ofSize: 17, weight: .medium)
        return titleLabel
    }()
    
    private let messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.textAlignment = .center
        messageLabel.numberOfLines = 2
        messageLabel.font = .systemFont(ofSize: 14, weight: .regular)
        messageLabel.tintColor = #colorLiteral(red: 0.5490196078, green: 0.5490196078, blue: 0.5490196078, alpha: 1)
        return messageLabel
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle("OK", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 1, green: 0.4705882353, blue: 0.3058823529, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        return button
    }()
    
    private let cancelButton: UIButton = {
        let button = UIButton()
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 19, weight: .bold)
        button.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.8980392157, blue: 0.8980392157, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        return button
    }()
    
    private var imageName: String?
    private var title: String?
    private var message: String?
    private var completion: (() -> Void)?
    private var font: UIFont?
    private var color: UIColor = #colorLiteral(red: 1, green: 0.4705882353, blue: 0.3058823529, alpha: 1)
    private var buttonStyle: YMLogoAlertButtonStyle = .confirm
    
    override public init(frame: CGRect){
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        alertView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public convenience init(title: String,
                            message: String? = nil,
                            color: UIColor,
                            font: UIFont? = nil,
                            imageName: String? = nil,
                            completion: (() -> Void)?) {
        self.init(frame: CGRect.zero)
        self.imageName = imageName
        self.title = title
        self.message = message
        self.color = color
        self.completion = completion
    }
    
    public convenience init(title: String,
                            message: String? = nil,
                            color: UIColor,
                            font: UIFont? = nil,
                            imageName: String? = nil,
                            buttonStyle: YMLogoAlertButtonStyle,
                            okCompletion: (() -> Void)?) {
        self.init(frame: CGRect.zero)
        self.imageName = imageName
        self.title = title
        self.message = message
        self.color = color
        self.buttonStyle = buttonStyle
        self.completion = okCompletion
    }
    
    open func showAlert(in superView: UIView){
        self.setAttributes()
        self.setConstraints(in: superView)
        self.setAnimation()
    }
    
    private func setAttributes() {
        self.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        titleLabel.text = title ?? ""
        messageLabel.text = message ?? ""
        if let name = imageName {
            imageView.image = UIImage(named: name)
        }
        setfont()
        setColor()
        confirmButton.addTarget(self, action: #selector(confirmAction), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
    }
    
    @objc private func confirmAction() {
        removeAnimation()
        completion?()
    }
    
    @objc private func cancelAction() {
        removeAnimation()
    }
    
    private func setConstraints(in superView: UIView){
        superView.addSubview(self)
        self.addSubview(imageView)
        self.addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(messageLabel)
        setContentViewConstraints(in: superView)
        setLabelConstraints()
        setButtonConstraints()
    }
    
    private func setColor(){
        confirmButton.backgroundColor = color
    }
    
    private func setfont(){
        guard let font = font else { return }
        titleLabel.font = font
        messageLabel.font = font
        confirmButton.titleLabel?.font = font
        cancelButton.titleLabel?.font = font
    }
    
    private func setAnimation(){
        alertView.alpha = 0
        imageView.alpha = 0
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let strongself = self else { return }
            strongself.alertView.alpha = 1
            strongself.imageView.alpha = 1
        })
    }
    
    private func removeAnimation(){
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            guard let self = self else { return  }
            self.backgroundColor = .clear
            self.alertView.alpha = 0
            self.imageView.alpha = 0
        }, completion: { [weak self] _ in
            guard let self = self else { return }
            self.removeFromSuperview()
        })
    }
    
    private func setContentViewConstraints(in superView: UIView){
        let constantValue = superView.bounds.height/10
        self.topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
        
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -constantValue).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        alertView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        alertView.topAnchor.constraint(equalTo: imageView.bottomAnchor).isActive = true
        alertView.widthAnchor.constraint(equalToConstant: 270.0).isActive = true
    }
    
    private func setLabelConstraints(){
        titleLabel.centerXAnchor.constraint(equalTo: alertView.centerXAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 220).isActive = true
        titleLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 30).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
        if message == nil {
            alertView.heightAnchor.constraint(equalToConstant: 150.0).isActive = true
        }else {
            alertView.heightAnchor.constraint(equalToConstant: 180.0).isActive = true
            messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
            messageLabel.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = true
            messageLabel.trailingAnchor.constraint(equalTo: alertView.trailingAnchor).isActive = true
            messageLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    }
    
    private func setButtonConstraints(){
        switch buttonStyle {
        case .confirm:
            alertView.addSubview(confirmButton)
            confirmButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = true
            confirmButton.trailingAnchor.constraint(equalTo: alertView.trailingAnchor).isActive = true
            confirmButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor).isActive = true
            confirmButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        case .confirmAndCancel:
            alertView.addSubview(cancelButton)
            alertView.addSubview(confirmButton)
            cancelButton.leadingAnchor.constraint(equalTo: alertView.leadingAnchor).isActive = true
            cancelButton.widthAnchor.constraint(equalToConstant: 135).isActive = true
            cancelButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor).isActive = true
            cancelButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            confirmButton.leadingAnchor.constraint(equalTo: cancelButton.trailingAnchor).isActive = true
            confirmButton.widthAnchor.constraint(equalToConstant: 135).isActive = true
            confirmButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor).isActive = true
            confirmButton.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        }
    }
}

