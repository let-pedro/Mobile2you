
import Foundation
import UIKit


class DetailsCoordinator{
    
    var window: UIWindow
    var viewModel: DetailsViewModel?
    var viewController: DetailsCollectionViewController?
    
    
    required init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        viewModel = DetailsViewModel()
        viewController = DetailsCollectionViewController(collectionViewLayout: HeaderLayout())
        viewController?.delegate = self
        window.rootViewController = viewController
    }
}
