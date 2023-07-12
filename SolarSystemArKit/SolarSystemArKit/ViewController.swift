//
//  ViewController.swift
//  SolarSystemArKit
//
//  Created by Salih Yusuf Göktaş on 11.07.2023.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Set the view's delegate
		sceneView.delegate = self
		
		//	let myBox = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
		
		//let mySphere = createSphere(radius: 0.1, content: "earth.jpeg", vector: SCNVector3(x: 0, y: 0.1, z: -0.5))
		
		let sun = createSphere(radius: 0.5, content: "sun.jpeg", vector: SCNVector3(x: 1, y: 1, z: -10))
		let mercury = createSphere(radius: 0.05, content: "mercury.jpeg", vector: SCNVector3(x: 2, y: 1, z: -10))
		let venus = createSphere(radius: 0.1, content: "venus.jpeg", vector: SCNVector3(x: 3, y: 1, z: -10))
		let earth = createSphere(radius: 0.1, content: "earth.jpeg", vector: SCNVector3(x: 4, y: 1, z: -10))
		let moon = createSphere(radius: 0.045, content: "moon.jpeg", vector: SCNVector3(x: 4.2, y: 1, z: -10))
		let mars = createSphere(radius: 0.150, content: "mars.jpeg", vector: SCNVector3(x: 5, y: 1, z: -10))
		let jupiter = createSphere(radius: 0.4, content: "jupiter.jpeg", vector: SCNVector3(x: 6, y: 1, z: -10))
		let saturn = createSphere(radius: 0.350, content: "saturn.jpeg", vector: SCNVector3(x: 7, y: 1, z: -10))
		let uranus = createSphere(radius: 0.3, content: "uranus.jpeg", vector: SCNVector3(x: 8, y: 1, z: -10))
		let neptune = createSphere(radius: 0.250 , content: "neptune.jpeg", vector: SCNVector3(x: 9, y: 1, z: -10))
		
		
		/*
		 let sun = createSphere(radius: 0.05, content: "sun.jpeg", vector: SCNVector3(x: 0.1, y: 1, z: -10))
		 let mercury = createSphere(radius: 0.005, content: "mercury.jpeg", vector: SCNVector3(x: 1, y: 0.2, z: -10))
		 let venus = createSphere(radius: 0.01, content: "venus.jpeg", vector: SCNVector3(x: 0.3, y: 1, z: -10))
		 let earth = createSphere(radius: 0.01, content: "earth.jpeg", vector: SCNVector3(x: 0.4, y: 1, z: -10))
		 let moon = createSphere(radius: 0.0045, content: "moon.jpeg", vector: SCNVector3(x: 0.5, y: 1, z: -10))
		 let mars = createSphere(radius: 0.0150, content: "mars.jpeg", vector: SCNVector3(x: 0.6, y: 1, z: -10))
		 let jupiter = createSphere(radius: 0.04, content: "jupiter.jpeg", vector: SCNVector3(x: 0.7, y: 1, z: -10))
		 let saturn = createSphere(radius: 0.0350, content: "saturn.jpeg", vector: SCNVector3(x: 0.8, y: 1, z: -10))
		 let uranus = createSphere(radius: 0.03, content: "uranus.jpeg", vector: SCNVector3(x: 0.9, y: 1, z: -10))
		 let neptune = createSphere(radius: 0.0250 , content: "neptune.jpeg", vector: SCNVector3(x: 1, y: 1, z: -10))
		 */
		
		
		//sceneView.scene.rootNode.addChildNode(mySphere)
		
		sceneView.scene.rootNode.addChildNode(sun)
		sceneView.scene.rootNode.addChildNode(mercury)
		sceneView.scene.rootNode.addChildNode(venus)
		sceneView.scene.rootNode.addChildNode(earth)
		sceneView.scene.rootNode.addChildNode(moon)
		sceneView.scene.rootNode.addChildNode(mars)
		sceneView.scene.rootNode.addChildNode(jupiter)
		sceneView.scene.rootNode.addChildNode(saturn)
		sceneView.scene.rootNode.addChildNode(uranus)
		sceneView.scene.rootNode.addChildNode(neptune)
		
		sceneView.automaticallyUpdatesLighting = true
		
	}
	
	func createSphere(radius: CGFloat, content: String, vector: SCNVector3) -> SCNNode{
		let mySphere = SCNSphere(radius: radius)
		
		let sphereMaterial = SCNMaterial()
		
		sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
		
		mySphere.materials = [sphereMaterial]
		
		let node = SCNNode()
		
		node.position = vector
		
		node.geometry = mySphere
		
		return node
		
	}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
