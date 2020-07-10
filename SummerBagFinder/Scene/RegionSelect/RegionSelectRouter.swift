import UIKit

class RegionSelectRouter: NSObject {
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

extension RegionSelectRouter: RegionSelectRoutingLogic {
    // MARK: Routing
    func routeToStoreList(stores: [Store]?) {
        ///라우팅: 유킷 -> 유킷 
        let destinationVC = storeListBuilder.build(stores: stores)
        viewController.show(destinationVC, sender: nil)
    }
}
