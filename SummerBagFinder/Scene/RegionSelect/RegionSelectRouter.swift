import UIKit

protocol RegionSelectRoutingLogic {
    func routeToStoreList(stores: [Store]?)
}

class RegionSelectRouter: NSObject, RegionSelectRoutingLogic {
    weak var viewController: UIViewController!
    private var storeListBuilder: StoreListBuildingLogic
    
    init(viewController: UIViewController, storeListBuilder: StoreListBuildingLogic) {
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
        ///라우팅: 유킷 -> 유킷 
        let destinationVC = storeListBuilder.build(stores: stores)
        viewController.show(destinationVC, sender: nil)
    }
}
