import UIKit
import SnapKit

protocol SettingsViewDelegate: AnyObject {
    func transitionToPage(with setting: Setting)
}

final class SettingsView: UIView {
    
    // MARK: - Properties
    
    private var settings: [[Setting]]?
    weak var delegate: SettingsViewDelegate?
    
    // MARK: - Outlets
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(SettingsTableViewCell.self, forCellReuseIdentifier: SettingsTableViewCell.identifier)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
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
        addSubview(tableView)
    }
    
    private func setupLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    // MARK: - Configuration
    
    func configure(with settings: [[Setting]]) {
        self.settings = settings
    }
}

// MARK: - Extension

extension SettingsView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let settings = settings else { return 0 }
        return settings[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let settings = settings else { return 0 }
        return settings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SettingsTableViewCell.identifier, for: indexPath) as? SettingsTableViewCell else { fatalError("cell not found") }
        guard let settings = settings else { fatalError("settings not found") }
        let setting = settings[indexPath.section][indexPath.row]
        let accessory = setting.accessory
        cell.setting = setting
        
        switch accessory {
            case .chevron:
                cell.accessoryType = .disclosureIndicator
            case .switcher:
                cell.accessoryView = UISwitch()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let settings = settings else { fatalError("settings not found") }
        let setting = settings[indexPath.section][indexPath.row]
        delegate?.transitionToPage(with: setting)
    }
}
