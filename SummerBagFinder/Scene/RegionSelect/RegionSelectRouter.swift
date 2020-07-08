import UIKit

protocol RegionSelectRoutingLogic {
    func routeToStoreList(stores: [Store]?)
}

class RegionSelectRouter: NSObject, RegionSelectRoutingLogic {
    weak var viewController: UIViewController!
    private var storeListScene: StoreListSceneLogic
    
    init(viewController: UIViewController, storeListScene: StoreListSceneLogic) {
        self.viewController = viewController
        self.storeListScene = storeListScene
    }
    
    deinit {
        print(#function)
    }
}

extension RegionSelectRouter {
    // MARK: Routing
    func routeToStoreList(stores: [Store]?) {
        /// 유킷 -> 유킷 
        let destinationVC = storeListScene.build(stores: stores)
        viewController.show(destinationVC, sender: nil)
    }
}
