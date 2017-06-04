import UIKit

protocol UpdateableWithUser: class {
    var user: User? { get set }
}

final class UserEditCoordinator {
    
    // MARK: - Properties
    private var user: User { didSet { updateInterfaces() } }
    private weak var navigationController: UINavigationController?
    
    // MARK: - Init
    init(user: User, navigationController: UINavigationController) {
        self.user = user
        self.navigationController = navigationController
    }
    
    func start() {
        showUserEditScreen()
    }

    // MARK: - Private implementation
    private func showUserEditScreen() {
        let controller = UIStoryboard.makeUserEditController()
        controller.user = user
        controller.onSelectCity = { [weak self] in
            self?.showCitiesScreen()
        }
        navigationController?.pushViewController(controller, animated: false)
    }
    
    private func showCitiesScreen() {
        let controller = UIStoryboard.makeCitiesController()
        controller.onCitySelected = { [weak self] city in
            self?.user.city = city
            _ = self?.navigationController?.popViewController(animated: true)
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func updateInterfaces() {
        navigationController?.viewControllers.forEach {
            ($0 as? UpdateableWithUser)?.user = user
        }
    }
}
