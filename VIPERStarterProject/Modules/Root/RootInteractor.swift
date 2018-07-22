//
//  RootInteractor.swift
//  VIPERStarterProject
//
//  Created by Neil Wright on 07-22-2018.
//

// inbound protocol interface
protocol RootInteractorType: class {
    // held strongly
    var dataManager: RootDataManagerType { get set }
    
    // held weakly (is owned by)
    var presenter: RootInteractorPresenterType? { get set }
}

// outbound protocol interface
protocol RootInteractorPresenterType: class {

}

final class RootInteractor: RootInteractorType {
    
    var dataManager: RootDataManagerType
    weak var presenter: RootInteractorPresenterType?
    
    init(dataManager: RootDataManagerType) {
        self.dataManager = dataManager
    }
    
    deinit {
        print("Root interactor deinit")
    }
}
