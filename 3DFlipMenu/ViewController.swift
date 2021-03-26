//
//  ViewController.swift
//  3D Menu
//
//  Created by Rachit Prajapati on 24/03/21.
//

import UIKit


class ViewController: UIViewController {
    
    // MARK: - Properties
    
   
    
    private let menuIcon: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named:"menu"), for: .normal)
        button.setDimensions(width: 25, height: 20)
        button.tintColor = .black
        return button
    }()
    
    private let fender: UILabel = {
        let label = UILabel()
        label.text = "fender"
        label.font = UIFont(name: "BlackRocker", size: 80)
        label.textColor = UIColor(red: 202/255, green: 195/255, blue: 183/255, alpha: 1.0)
        return label
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "fender american elit strait"
        label.numberOfLines = 3
        label.font = UIFont(name: "BlackRocker", size: 25)
        label.textColor = UIColor.black
        label.widthAnchor.constraint(equalToConstant: 170).isActive = true
        return label
    }()
    
    private let spec: UILabel = {
        let label = UILabel()
        label.text = "spec"
        label.font = UIFont(name: "BlackRocker", size: 10)
        label.textColor = UIColor.black
        return label
    }()
    
    
    
   
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
     


        
    }
    
    // MARK: - Selectors
    
    
    // MARK: - API
    
    
    
    // MARK: - Helpers
 
    private func setupUI() {
        view.backgroundColor = UIColor(red: 231/255, green: 222/255, blue: 210/255, alpha: 1.0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: menuIcon)
        
        view.addSubview(fender)
        fender.transform = CGAffineTransform(rotationAngle: .pi/2)
        fender.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 170, paddingLeft: -80)
        
        view.addSubview(aboutLabel)
        aboutLabel.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingLeft: 20, paddingBottom: 20)
        
        view.addSubview(spec)
        spec.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingBottom: 20, paddingRight: 20)
        

        
    }
}

