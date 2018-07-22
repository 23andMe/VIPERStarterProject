//
//  RootViewController.swift
//  VIPERStarterProject
//
//  Created by Neil Wright on 07-22-2018.
//

import UIKit

// MARK: View controller interface
protocol RootViewControllerType: class {
    
}

final class RootViewController:
    UIViewController,
    RootViewControllerType,
    RootPresenterToViewType {
    
    let presenter: RootPresenterType
    
    // MARK: View elements
    
    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel(frame: .zero)
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.font = UIFont.preferredFont(
            forTextStyle: .headline,
            compatibleWith: self.traitCollection
        )
        headerLabel.textColor = .white
        headerLabel.textAlignment = .center
        headerLabel.text = RootLocalization.titleText
        headerLabel.numberOfLines = 0
        headerLabel.lineBreakMode = .byWordWrapping
        return headerLabel
    }()
    
    private var didSetConstraints: Bool = false

    // MARK: Initializers
    
    required init(presenter: RootPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()

        // add views here
        self.view.addSubview(self.headerLabel)
        self.view.setNeedsUpdateConstraints()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .gray
    }
    
    override func updateViewConstraints() {
        // apply constraints here
        if !self.didSetConstraints {
            self.didSetConstraints = true
            
            NSLayoutConstraint.activate([
                self.headerLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
                self.headerLabel.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
            ])
        }
        super.updateViewConstraints()
    }
}
