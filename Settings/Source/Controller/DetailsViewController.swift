import UIKit

final class DetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    private var detailsView: DetailsView? {
        guard isViewLoaded else { return nil }
        return view as? DetailsView
    }
    
    var setting: Setting?
    
    // MARK: - Lifecycle
    
    override func loadView() {
        let detailsView = DetailsView()
        view = detailsView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        guard let setting = setting else { fatalError("setting not found") }
        guard let detailsView = detailsView else { fatalError("details view not found") }
        detailsView.configure(with: setting)
    }
}
