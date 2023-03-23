import UIKit
import SnapKit

final class DetailsView: UIView {

    // MARK: - Outlets
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setup() {
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    private func setupView() {
        backgroundColor = .systemBackground
    }
    
    private func setupHierarchy() {
        addSubview(iconView)
        addSubview(label)
    }
    
    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(150)
        }
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(iconView.snp.bottom).offset(20)
        }
    }
    
    // MARK: - Configuration
    
    func configure(with setting: Setting) {
        iconView.image = setting.iconImage
        iconView.tintColor = setting.tintColor
        iconView.backgroundColor = setting.backgroundColor
        label.text = setting.text
    }
}
