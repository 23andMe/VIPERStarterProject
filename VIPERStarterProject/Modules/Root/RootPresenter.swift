//
//  RootPresenter.swift
//  VIPERStarterProject
//
//  Created by Neil Wright on 07-22-2018.
//

// View->Presenter interface.
protocol RootPresenterType: class {
    
    var interactor: RootInteractorType { get set }
    var router: RootPresenterToRouterType? { get set }
    var view: RootPresenterToViewType? { get set }
}

// Presenter->View interface for calling view.
protocol RootPresenterToViewType: class {
    
}

final class RootPresenter: RootPresenterType {
    
    var interactor: RootInteractorType
    var router: RootPresenterToRouterType?
    weak var view: RootPresenterToViewType?
    
    init(interactor: RootInteractorType) {
        self.interactor = interactor
    }
    
    deinit {
        print("Root presenter deinit")
    }
}

// (Outbound) Interface for receiving the interactor's events.
extension RootPresenter: RootInteractorPresenterType {
    
}
