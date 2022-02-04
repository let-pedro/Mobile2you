
import Foundation
import UIKit


class AppCoordinator {
    
    var window: UIWindow
    var detailsCoordinator: DetailsCoordinator?

    required init(window: UIWindow) {
        self.window = window
        self.window.makeKeyAndVisible()
    }
    
    func start(){
        detailsCoordinator = DetailsCoordinator(window: window)
        detailsCoordinator?.start()
    }
}



