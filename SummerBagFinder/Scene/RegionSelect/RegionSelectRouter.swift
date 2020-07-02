import UIKit

protocol RegionSelectRoutingLogic {
    #warning("구체타입")
    var viewController: RegionSelectViewController { get }
    func routeToStoreList(stores: [Store]?)
}

class RegionSelectRouter: NSObject, RegionSelectRoutingLogic {
    var viewController: RegionSelectViewController
    private var storeListBuilder: StoreListBuildingLogic
    
    init(viewController: RegionSelectViewController, storeListBuilder: StoreListBuildingLogic) {
        self.viewController = viewController
        self.storeListBuilder = storeListBuilder
    }
    
    deinit {
        print(#function)
    }
}

extension RegionSelectRouter {
    // MARK: Routing
    func routeToStoreList(stores: [Store]?) {
        /// 유킷 -> 유킷 
        let router = storeListBuilder.build(stores: stores)
        let destinationVC = router.viewController
        navigateToStoreList(source: viewController, destination: destinationVC)
    }
    
    // MARK: Navigation
    func navigateToStoreList(source: ViewControllingLogic, destination: ViewControllingLogic) {
        source.display(destination)
    }
}
