import UIKit

protocol RegionSelectRoutingLogic {
    func routeToStoreList(stores: [Store]?)
}

class RegionSelectRouter: NSObject, RegionSelectRoutingLogic {
    var scene: RegionSelectSceneLogic
    private var storeListScene: StoreListSceneLogic
    
    init(scene: RegionSelectScene, storeListScene: StoreListSceneLogic) {
        self.scene = scene
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
        scene.viewController.show(destinationVC, sender: nil)
    }
}
