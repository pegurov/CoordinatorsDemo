//  Created by Pavel Gurov. Copyright © 2017 Pavel Gurov. All rights reserved.

import UIKit

extension UIStoryboard {
    
    private static let userEdit = UIStoryboard(name: "UserEdit", bundle: nil)
    
    class func makeUserEditController() -> UserEditViewController {
        return UIStoryboard.userEdit.instantiateViewController(withIdentifier: "UserEditViewController") as! UserEditViewController
    }
    
    class func makeCitiesController() -> CitiesViewController {
        return UIStoryboard.userEdit.instantiateViewController(withIdentifier: "CitiesViewController") as! CitiesViewController
    }
}
