import UIKit
import  SceneKit

class ContainerController: UIViewController {
    var scnView: SCNView!
    var geometryNode: SCNNode!
    var menuWidth: CGFloat!
    var selectedNode: SCNNode?
    
    let menuViewController: UIViewController
    let fenderViewController: UINavigationController
    var isOpening = false
    let animationTime = 0.5
    var currentAngle : Float = 0.15
    
    
    init(sideMenu: UIViewController, center: UINavigationController) {
        menuViewController = sideMenu
        fenderViewController = center
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScene()
    }
    
    
    @objc func handleGuitarGesture(sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: sender.view!)
        
        var progress = (translation.x / menuWidth * (isOpening ? 1.0 : -1.0))
        progress = min(max(progress, 0.0), 1.0)
        
        
        switch sender.state {
        case .began:
            let isOpen = floor(fenderViewController.view.frame.origin.x/menuWidth)
            
            isOpening = isOpen == 1.0 ? false: true
            menuViewController.view.layer.shouldRasterize = true
            menuViewController.view.layer.rasterizationScale =
            UIScreen.main.scale
            
        case .changed:
            setMenu(toPercent: isOpening ? progress: (1.0 - progress))
            
            
        case .ended: fallthrough
        case .cancelled: fallthrough
        case .failed:
            
            var targetProgress: CGFloat
            if (isOpening) {
                targetProgress = progress < 0.5 ? 0.0 : 1.0
                
                
            } else {
                targetProgress = progress < 0.5 ? 1.0 : 0.0
            }
            
            UIView.animate(withDuration: animationTime,
                           animations: {
                self.setMenu(toPercent: targetProgress)
            },
                           completion: {_ in }
            )
        default: break
        }
    }
    
    private func setupScene() {
        view.backgroundColor = UIColor(red: 172/255, green: 166/255, blue: 155/255, alpha: 1.0)
        menuWidth = view.frame.width - 100
        
        addChild(fenderViewController)
        view.addSubview(fenderViewController.view)
        fenderViewController.didMove(toParent: self)
        
        
        addChild(menuViewController)
        view.addSubview(menuViewController.view)
        
        menuViewController.didMove(toParent: self)
        
        menuViewController.view.layer.anchorPoint.x = 0.8
        menuViewController.view.frame = CGRect(x: -menuWidth, y: 0, width: menuWidth, height: view.frame.height)
        
        scnView = SCNView()
        
        view.addSubview(scnView)
        scnView.backgroundColor = .clear
        scnView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 70, paddingLeft: view.frame.width / 2, paddingBottom: 70)
        
        let scene = SCNScene(named: "fender_stratocaster.scn")

        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light?.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        lightNode.light?.shadowMode = .deferred
        
        lightNode.light?.type = .directional
        lightNode.position = SCNVector3(x: 0, y: 70, z: 35)
        lightNode.castsShadow = true
        
        scene?.rootNode.addChildNode(lightNode)
        
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light?.type = .ambient
        ambientLightNode.light?.color = UIColor.white
        scene?.rootNode.addChildNode(ambientLightNode)
        scnView.allowsCameraControl = true
    
        scnView.scene = scene
        
        geometryNode = scene!.rootNode.childNode(withName: "fender_stratocaster", recursively: false)
        
        let panGesture2 = UIPanGestureRecognizer(target: self, action: #selector(handleGuitarGesture))
        scnView.addGestureRecognizer(panGesture2)
    }

}

