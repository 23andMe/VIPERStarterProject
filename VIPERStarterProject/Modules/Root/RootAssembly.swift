//
//  RootAssembly.swift
//  VIPERStarterProject
//
//  Created by Neil Wright on 07-22-2018.
//

import Swinject

class RootAssembly: Assembly {
    
    func assemble(container: Container) {
        
        // router type
        container.register(RootRouterType.self) { resolver in
            return RootRouter()
        }.initCompleted({ resolver, router in
            router.wireframe = resolver.resolve(WireframeType.self)!
        }).inObjectScope(.weak)
        
        // presenter/router type
        container.register(RootPresenterToRouterType.self) { resolver in
            return resolver.resolve(RootRouterType.self)!
        }.initCompleted({ resolver, router in
            (router as? RootRouterType)?.wireframe = resolver.resolve(WireframeType.self)!
        })
        
        // data manager
        container.register(RootDataManagerType.self) { resolver in
            return RootDataManager()
        }
        
        // interactor
        container.register(RootInteractorType.self) { resolver in
            return RootInteractor(dataManager: resolver.resolve(RootDataManagerType.self)!)
        }.initCompleted({ resolver, interactor in
            interactor.presenter = resolver.resolve(RootInteractorPresenterType.self)!
        })
        
        // presenter
        container.register(RootPresenterType.self) { resolver in
            return RootPresenter(interactor: resolver.resolve(RootInteractorType.self)!)
        }.initCompleted({ resolver, presenter in
            presenter.router = resolver.resolve(RootRouterType.self)!
            presenter.view = resolver.resolve(RootPresenterToViewType.self)!
        })
        
        // presenter->view type
        container.register(RootPresenterToViewType.self) { resolver in
            let viewController = resolver.resolve(RootViewControllerType.self)!
            return viewController as! RootPresenterToViewType
        }
        
        // interactor->presenter type
        container.register(RootInteractorPresenterType.self) { resolver in
            let presenter = resolver.resolve(RootPresenterType.self)!
            return presenter as! RootInteractorPresenterType
        }
        
        // view controller
        container.register(RootViewControllerType.self) { resolver in
            return RootViewController(presenter: resolver.resolve(RootPresenterType.self)!)
        }
    }
    
    func loaded(resolver: Resolver) {
        
    }
}
