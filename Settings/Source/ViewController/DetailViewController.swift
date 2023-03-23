import UIKit
import SnapKit

final class DetailViewController: UIViewController {

    // MARK: - Properties
    
    var setting: Setting?
    
    // MARK: - Outlets
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupFill()
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        view.addSubview(iconView)
        view.addSubview(label)
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
    
    private func setupFill() {
        iconView.image = setting?.iconImage
        iconView.tintColor = setting?.tintColor
        iconView.backgroundColor = setting?.backgroundColor
        label.text = setting?.text
    }
}
