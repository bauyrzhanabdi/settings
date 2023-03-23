import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var settingsView: SettingsView? {
        guard isViewLoaded else { return nil }
        return view as? SettingsView
    }
    
    private var settingsModel: SettingsModel?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let settingsView = SettingsView()
        settingsView.delegate = self
        view = settingsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupModel()
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupModel() {
        settingsModel = SettingsModel()
        guard let settingsModel = settingsModel else { fatalError("settings model not found") }
        guard let settingsView = settingsView else { fatalError("settings view not found") }
        let setting = settingsModel.createModels()
        settingsView.configure(with: setting)
    }
    
    private func setupView() {
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

// MARK: - Extension

extension SettingsViewController: SettingsViewDelegate {
    func transitionToPage(with setting: Setting) {
        let detailViewController = DetailsViewController()
        detailViewController.setting = setting
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}
