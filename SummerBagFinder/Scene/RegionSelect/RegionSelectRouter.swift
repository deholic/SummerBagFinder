import UIKit

protocol RegionSelectRoutingLogic: RoutingLogic {
    func routeToStoreList(stores: [Store]?)
}

class RegionSelectRouter: NSObject, RegionSelectRoutingLogic {
    var viewController: UIViewController
    private var storeListBuilder: StoreListBuildingLogic
    
    init(viewController: UIViewController, storeListBuilder: StoreListBuildingLogic) {
        self.viewController = viewController
        self.storeListBuilder = storeListBuilder
    }
}

extension RegionSelectRouter {
    // MARK: Routing
    func routeToStoreList(stores: [Store]?) {
        let router = storeListBuilder.build(stores: stores)
        let destinationVC = router.viewController
        navigateToStoreList(source: viewController, destination: destinationVC)
    }
    
    // MARK: Navigation
    func navigateToStoreList(source: UIViewController, destination: UIViewController) {
        source.show(destination, sender: nil)
    }
}
