//  Created by Pavel Gurov. Copyright © 2017 Pavel Gurov. All rights reserved.

import UIKit

class UserEditViewController: UIViewController {
    
    // MARK: - Input -
    var user: User? { didSet { updateView() } }
    
    // MARK: - Output -
    var onSelectCity: (() -> Void)?
 
    @IBOutlet private weak var userLabel: UILabel!
    @IBAction private func selectCityTap(_ sender: UIButton) {
        onSelectCity?()
    }
    
    override func viewDidLoad() {
        updateView()
    }
    
    private func updateView() {
        guard isViewLoaded else { return }
        
        userLabel.text = "User: \(user?.name ?? ""), \ncity: \(user?.city?.name ?? "")"
    }
}
