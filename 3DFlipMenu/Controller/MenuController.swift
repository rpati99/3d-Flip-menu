
//
//  MenuController.swift
//  3D Menu
//
//  Created by Rachit Prajapati on 24/03/21.
//

import UIKit

class MenuController: UIViewController {
    
    // MARK: - Properties

    private let guitar: UILabel = {
        let label = UILabel.createMenuItem(name: "guitars", color: .red, size: 30)
        return label
    }()
    
    private let basses: UILabel = {
        let label = UILabel.createMenuItem(name: "basses", size: 30)
        return label
    }()
    
    private let amps: UILabel = {
        let label = UILabel.createMenuItem(name: "amps", size: 30)
        return label
    }()
    
    
    
    private let pedals: UILabel = {
        let label = UILabel.createMenuItem(name: "pedals", size: 30)
        return label
    }()
    
    
    private let others: UILabel = {
        let label = UILabel.createMenuItem(name: "others", size: 30)
        return label
    }()
    
    
    private let about: UILabel = {
        let label = UILabel.createMenuItem(name: "about", size: 15)
        return label
    }()
    
    
    private let support: UILabel = {
        let label = UILabel.createMenuItem(name: "support", size: 15)
        return label
    }()
    
    
    private let terms: UILabel = {
        let label = UILabel.createMenuItem(name: "terms", size: 15)
        return label
    }()
    
    private let faq: UILabel = {
        let label = UILabel.createMenuItem(name: "faq", size: 15)
        return label
    }()

    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        mutateSize()
    }
    
    // MARK: - Helpers
    
    func mutateSize() {
        self.preferredContentSize = CGSize(width: view.frame.width - 100, height: view.frame.height)
    }
    
    func setupUI() {
        view.backgroundColor = UIColor(red: 231/255, green: 222/255, blue: 210/255, alpha: 1.0)
        view.addSubview(guitar)
        guitar.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,  paddingTop: 120, paddingLeft: 40)
        view.addSubview(basses)
        basses.anchor(top: guitar.bottomAnchor ,left: view.leftAnchor,  paddingTop: 10, paddingLeft: 40)
        view.addSubview(amps)
        amps.anchor(top: basses.bottomAnchor, left: view.leftAnchor,  paddingTop: 10, paddingLeft: 40)
        view.addSubview(pedals)
        pedals.anchor(top: amps.bottomAnchor, left: view.leftAnchor,  paddingTop: 10, paddingLeft: 40)
        view.addSubview(others)
        others.anchor(top: pedals.bottomAnchor, left: view.leftAnchor,  paddingTop: 10, paddingLeft: 40)
        view.addSubview(about)
        about.anchor(top: others.bottomAnchor ,left: view.leftAnchor,  paddingTop: 90, paddingLeft: 40)
        view.addSubview(support)
        support.anchor(top: about.bottomAnchor, left: view.leftAnchor,  paddingTop: 10, paddingLeft: 40)
        view.addSubview(terms)
        terms.anchor(top: support.bottomAnchor, left: view.leftAnchor,  paddingTop: 10, paddingLeft: 40)
        view.addSubview(faq)
        faq.anchor(top: terms.bottomAnchor, left: view.leftAnchor,  paddingTop: 10, paddingLeft: 40)
    }
}
