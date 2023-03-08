import UIKit
import SnapKit

final class CustomTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    
    // MARK: - Outlets
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "airplane")
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "just a text to check"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(containerView)
        contentView.addSubview(label)
        
        containerView.addSubview(iconView)
    }
    
    private func setupLayout() {
        containerView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
            make.height.width.equalTo(30)
        }
        
        iconView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.width.equalTo(20)
        }
        
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(iconView.snp.right).offset(20)
        }
    }
    
    // MARK: - Reuse
}
