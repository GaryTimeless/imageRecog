//
//  ViewController.swift
//  ImageDetection
//
//  Created by Mohammad Azam on 2/19/18.
//  Copyright © 2018 Mohammad Azam. All rights reserved.
//

//Box1Node    Box2Node    Box3Node    Box4Node     Box5Node     Box6Node

//[0]        [1]        [2]        [3]        [4]        [5]


import UIKit
import SceneKit
import ARKit

@available(iOS 12.0, *)
class ViewController: UIViewController, ARSCNViewDelegate {
    
    @IBOutlet var sceneView: ARSCNView!
    // MonsterField
    var box1Node : SCNNode!
    var box2Node : SCNNode!
    var box3Node : SCNNode!
    var box4Node : SCNNode!
    var box5Node : SCNNode!
    var box6Node : SCNNode!
    // MagicTrapField
    var box7Node : SCNNode!
    var box8Node : SCNNode!
    var box9Node : SCNNode!
    var box10Node : SCNNode!
    var box11Node : SCNNode!
    var box12Node : SCNNode!
    
    
    var chooseM: Int!
    var chooseT: Int!
    var ALLOWdetect: Bool!
    var EmptyOr = ["empty","empty","empty","empty","empty","empty","empty","empty","empty","empty","greg","empty"]
    var tempAction: String!
    var CountRender: Int!
    var statusAction: SCNText!
    var statusTypOfCard: SCNText!
    var statusActionNode: SCNNode!
    var statusTypOfCardNode: SCNNode!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sceneView = ARSCNView(frame: self.view.frame)
        self.view.addSubview(self.sceneView)
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        
        // Create a new scene
        let scene = SCNScene()

        
        
        
        
        let statusAction = SCNText(string: "action", extrusionDepth: 2.0)
        let materialSA = SCNMaterial()
        materialSA.diffuse.contents = UIColor.magenta
        statusAction.materials = [materialSA]
        statusAction.font = UIFont (name: "Arial", size: 30)
        
        
        statusActionNode = SCNNode(geometry: statusAction)
        statusActionNode.position = SCNVector3(1, 0.7, -2)
        statusActionNode.scale = SCNVector3(0.01, 0.01, 0.01)
        statusActionNode.eulerAngles.y = 0.0
        
        let statusTypOfCard = SCNText(string: "TypOfCard", extrusionDepth: 2.0)
        let materialTOC = SCNMaterial()
        materialTOC.diffuse.contents = UIColor.red
        statusTypOfCard.materials = [materialTOC]
        statusTypOfCard.font = UIFont (name: "Arial", size: 30)
        
        
        statusTypOfCardNode = SCNNode(geometry: statusTypOfCard)
        statusTypOfCardNode.position = SCNVector3(1, 1.0, -2)
        statusTypOfCardNode.scale = SCNVector3(0.01, 0.01, 0.01)
        statusTypOfCardNode.eulerAngles.y = 0.0
        
           
        
        
        
        //Monster Field
        
             let box1 = SCNBox(width:0.8,height: 1, length: 0.01, chamferRadius: 0)
             let material = SCNMaterial()
             material.diffuse.contents = UIImage(named:"action,EmptyBack")
             box1.materials = [material]
             box1Node = SCNNode(geometry: box1)
             box1Node.position = SCNVector3(2.0,-0.8,-2.0)
             box1Node.eulerAngles.x = 30.0
             
             let box2 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius:0)
             let material2 = SCNMaterial()
             material2.diffuse.contents = UIImage(named:"action,EmptyBack")
             box2.materials = [material2]
             box2Node = SCNNode(geometry: box2)
             box2Node.position = SCNVector3(1.0,-0.8,-2.0)
             box2Node.eulerAngles.x = 30.0
             
             let box3 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius: 0)
             let material3 = SCNMaterial()
             material3.diffuse.contents = UIImage(named:"action,EmptyBack")
             box3.materials = [material3]
             box3Node = SCNNode(geometry: box3)
             box3Node.position = SCNVector3(0.0,-0.8,-2.0)
             box3Node.eulerAngles.x = 30.0
             
             let box4 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius: 0)
             let material4 = SCNMaterial()
             material4.diffuse.contents = UIImage(named:"action,EmptyBack")
             box4.materials = [material4]
             box4Node = SCNNode(geometry: box4)
             box4Node.position = SCNVector3(-1.0,-0.8,-2.0)
             box4Node.eulerAngles.x = 30.0
             
             let box5 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius: 0)
             let material5 = SCNMaterial()
             material5.diffuse.contents = UIImage(named:"action,EmptyBack")
             box5.materials = [material5]
             box5Node = SCNNode(geometry: box5)
             box5Node.position = SCNVector3(-2.0,-0.8,-2.0)
             box5Node.eulerAngles.x = 30.0
            
             let box6 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius: 0)
             let material6 = SCNMaterial()
             material6.diffuse.contents = UIImage(named:"action,EmptyBack")
             box6.materials = [material6]
             box6Node = SCNNode(geometry: box6)
             box6Node.position = SCNVector3(-3.0,-0.8,-2.0)
             box6Node.eulerAngles.x = 30.0
            
            
        
        //Trap & Magic Field
       
             let box7 = SCNBox(width:0.8,height: 1, length: 0.01, chamferRadius: 0)
             let material7 = SCNMaterial()
             material7.diffuse.contents = UIImage(named:"action,EmptyBack")
             box7.materials = [material]
             box7Node = SCNNode(geometry: box7)
             box7Node.position = SCNVector3(2.0,-0.8,-3.5)
             box7Node.eulerAngles.x = 30.0
             
             let box8 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius:0)
             let material8 = SCNMaterial()
             material8.diffuse.contents = UIImage(named:"action,EmptyBack")
             box8.materials = [material8]
             box8Node = SCNNode(geometry: box8)
             box8Node.position = SCNVector3(1.0,-0.8,-3.5)
             box8Node.eulerAngles.x = 30.0
             
             let box9 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius: 0)
             let material9 = SCNMaterial()
             material9.diffuse.contents = UIImage(named:"action,EmptyBack")
             box9.materials = [material9]
             box9Node = SCNNode(geometry: box9)
             box9Node.position = SCNVector3(0.0,-0.8,-3.5)
             box9Node.eulerAngles.x = 30.0
             
             let box10 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius: 0)
             let material10 = SCNMaterial()
             material10.diffuse.contents = UIImage(named:"action,EmptyBack")
             box10.materials = [material10]
             box10Node = SCNNode(geometry: box10)
             box10Node.position = SCNVector3(-1.0,-0.8,-3.5)
             box10Node.eulerAngles.x = 30.0
             
             let box11 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius: 0)
             let material11 = SCNMaterial()
             material11.diffuse.contents = UIImage(named:"action,EmptyBack")
             box11.materials = [material11]
             box11Node = SCNNode(geometry: box11)
             box11Node.position = SCNVector3(-2.0,-0.8,-3.5)
             box11Node.eulerAngles.x = 30.0
            
             let box12 = SCNBox(width: 0.8, height: 1, length: 0.01, chamferRadius: 0)
             let material12 = SCNMaterial()
             material12.diffuse.contents = UIImage(named:"action,EmptyBack")
             box12.materials = [material12]
             box12Node = SCNNode(geometry: box12)
             box12Node.position = SCNVector3(-3.0,-0.8,-3.5)
             box12Node.eulerAngles.x = 30.0
            
            
        
        // AddChildNode
       
            scene.rootNode.addChildNode(box1Node)
            scene.rootNode.addChildNode(box2Node)
            scene.rootNode.addChildNode(box3Node)
            scene.rootNode.addChildNode(box4Node)
            scene.rootNode.addChildNode(box5Node)
            scene.rootNode.addChildNode(box6Node)
            scene.rootNode.addChildNode(box7Node)
            scene.rootNode.addChildNode(box8Node)
            scene.rootNode.addChildNode(box9Node)
            scene.rootNode.addChildNode(box10Node)
            scene.rootNode.addChildNode(box11Node)
            scene.rootNode.addChildNode(box12Node)
            scene.rootNode.addChildNode(statusTypOfCardNode)
            scene.rootNode.addChildNode(statusActionNode)
       
        
        
        
        
  
        // Set the scene to the view
        sceneView.scene = scene
        
        
        chooseM = 0
        chooseT = 6
        ALLOWdetect = false
        tempAction = "test"
        
        
        
    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor)
    {
            
                var targetName : String!
                let targetMaterial = SCNMaterial()
                var TypOfCard : String!
                var TempActionInside: String!
                var TempTargetName: String!
        
        
        // I Karte erkennen und Daten vorbereiten!
            if let imageAnchor = anchor as? ARImageAnchor
            {
                    targetName = imageAnchor.referenceImage.name
                let TargetNameArr = targetName.split(separator: ",", maxSplits: 1, omittingEmptySubsequences: false)
                    
                    targetName += ".jpg"
                    targetMaterial.diffuse.contents = UIImage(named: targetName)
                    
                // Monster Xor Magic/Trap Card
                TypOfCard = String(TargetNameArr[0])
                TempTargetName = String(TargetNameArr[1])
                
                if (1==1)
                {
                print("REgister CARD")
                //print(TempActionInside!)
                print(TypOfCard!)
                print(targetName!)
                print(chooseM!)
                print(chooseT!)
                print(ALLOWdetect!)
                }
            }
         
        // II Wenn die Karte eine Actionskarte ist: Nächste Mo/Tr/Ma Karte AR
            if(TypOfCard == "action")
            {
                ALLOWdetect = true
                tempAction = String(targetName)
                   
                if (1==1)
                   {
                    print("SET ACCES TO ACTION")
                    //print(TempActionInside!)
                    print(TypOfCard!)
                    print(targetName!)
                    print(chooseM!)
                    print(chooseT!)
                    print(ALLOWdetect!)
                    }
            }
        // II + Action speichern
            TempActionInside = tempAction
        
        // nur Konsolen überprüfungen
        if(1==1)
        {
            print("CHECK DATA")
            print(TempActionInside!)
            print(TypOfCard!)
            print(targetName!)
            print(chooseM!)
            print(chooseT!)
            print(ALLOWdetect!)
            
            print("TEST EmptyOr")
            for i in 0...11
            {
                if(EmptyOr[i] != "Empty" )
                {
                 print(i)
                 print(EmptyOr[i])
                }
            }
        }
                
            statusTypOfCard = SCNText(string: TypOfCard, extrusionDepth: 0.0)
            statusTypOfCardNode.geometry? = statusTypOfCard
        
            statusAction = SCNText(string: TempTargetName, extrusionDepth: 0.0)
            statusActionNode.geometry? = statusAction
        
        
            
        
        
        // III wenn Aktionskarte -> mach nichts
        //     wenn Mo/Tr/Ma && Aktion ist erlaubt -> gehe in IF
        if ((ALLOWdetect == true) && (TypOfCard == "Monster" || TypOfCard == "TRAP" || TypOfCard == "MAGIC"))
        {
            if(1==1)
            {
            print("READY TO RUMBLE")
            print(TempActionInside!)
            print(TypOfCard!)
            print(targetName!)
            print(chooseM!)
            print(chooseT!)
            print(ALLOWdetect!)
            }
            
            
            let AllBoxNode = [box1Node, box2Node, box3Node, box4Node, box5Node, box6Node,box7Node, box8Node,box9Node, box10Node, box11Node, box12Node]
            
            
            if (TempActionInside == "action,SUMMON.jpg" && TypOfCard == "Monster")
            {
                if (chooseM < 6)
                {
                    EmptyOr[chooseM] = targetName
                    AllBoxNode[chooseM]?.eulerAngles.x = 0.0
                    AllBoxNode[chooseM]?.position.y = -0.4
                    AllBoxNode[chooseM]?.position.z = -1.3
                    
                    targetMaterial.diffuse.contents = UIImage(named: targetName)
                    AllBoxNode[chooseM]?.geometry?.materials = [targetMaterial]
                    
                    chooseM += 1
                    
                    print("what Happens SUMMON MONSTER:")
                    print(TempActionInside!)
                    print(TypOfCard!)
                    print(targetName!)
                    print(chooseM!)
                    print(chooseT!)
                    print(ALLOWdetect!)
                    
                }else
                {
                    print("all fields are occupied")
                    chooseM = 0
                    
                }
            
              ALLOWdetect = false
            
            }
            
            if (TempActionInside == "action,SET.jpg" && (TypOfCard == "Monster" || TypOfCard == "TRAP" || TypOfCard == "MAGIC"))
            {
                if((TypOfCard == "TRAP" || TypOfCard == "MAGIC") && ( chooseT < 12))
                {
                    EmptyOr[chooseT] = targetName
                    AllBoxNode[chooseT]?.eulerAngles.x = 30.0
                    AllBoxNode[chooseT]?.position.y = -0.8
                    AllBoxNode[chooseT]?.position.z = -3.5
                    
                    targetMaterial.diffuse.contents = UIImage(named: "action,back")
                    AllBoxNode[chooseT]?.geometry?.materials = [targetMaterial]
                    
                    chooseT += 1
                    print("what Happens SET TRAP|MAGIC:")
                    print(TempActionInside!)
                    print(TypOfCard!)
                    print(targetName!)
                    print(chooseM!)
                    print(chooseT!)
                    print(ALLOWdetect!)
                    print(EmptyOr[chooseT])
                    
                    ALLOWdetect = false
                    
                    
                }else if(chooseT > 11)
                {
                print("all fields are occupied")
                chooseM = 6
                }
                

                
                if((TypOfCard == "Monster") && (chooseM < 6))
                {
                    EmptyOr[chooseM] = targetName
                    AllBoxNode[chooseM]?.eulerAngles.x = 30.0
                    AllBoxNode[chooseM]?.position.y = -0.8
                    AllBoxNode[chooseM]?.position.z = -2.0
                    
                    targetMaterial.diffuse.contents = UIImage(named: "action,back")
                    AllBoxNode[chooseM]?.geometry?.materials = [targetMaterial]
                    chooseM += 1
  
                    print("what Happens SET MONSTER:")
                    print(TempActionInside!)
                    print(TypOfCard!)
                    print(targetName!)
                    print(chooseM!)
                    print(chooseT!)
                    print(ALLOWdetect!)
                    print(EmptyOr[chooseT])
                    
                }else if (chooseM > 5)
                {
                    print("all fields are occupied")
                    chooseM = 0
                    
                }
                
                ALLOWdetect = false
                
            }
            
            
            if ((TempActionInside == "action,DESTROY.jpg") && (TypOfCard == "Monster" || TypOfCard == "TRAP" || TypOfCard == "MAGIC"))
            {
                
                
                var FOUND = false
                var FoundNode: Int!
                
                // Check if Card is on the MONSTERField
                for i in 0...11
                {   print(i)
                    print(EmptyOr[i])
                    
                    if (EmptyOr[i] == targetName)
                    {
                        FoundNode = i
                        print("TEST if index i is right1")
                        print(FoundNode!)
                        FOUND = true
                    }
                }
                if(FOUND == true)
                {
                    if (FoundNode < 6)
                    {
                        AllBoxNode[FoundNode]?.eulerAngles.x = 30.0
                        AllBoxNode[FoundNode]?.position.y = (-0.8)
                        AllBoxNode[FoundNode]?.position.z = (-2.0)
                        
                    }else
                    {
                        AllBoxNode[FoundNode]?.eulerAngles.x = 30.0
                        AllBoxNode[FoundNode]?.position.y = -0.8
                        AllBoxNode[FoundNode]?.position.z = -3.5
                    }
                    
                    targetMaterial.diffuse.contents = UIImage(named: "action,EmptyBack")
                    AllBoxNode[FoundNode]?.geometry?.materials = [targetMaterial]
                    EmptyOr[FoundNode] = "empty"
                    
                    print("what Happens DESTORY MONSTER|TRAP|MAGIC:")
                    print(TempActionInside!)
                    print(TypOfCard!)
                    print(targetName!)
                    print(chooseM!)
                    print(chooseT!)
                    print(ALLOWdetect!)
                    print(EmptyOr[FoundNode])
                    
                    
                } else {print("CARD NOT FOUND")}
                
                ALLOWdetect = false
            }
            
            if ((TempActionInside == "action,ACTIVATE.jpg") && (TypOfCard == "Monster" || TypOfCard == "TRAP" || TypOfCard == "MAGIC"))
            {
                var FOUND = false
                var FoundNode: Int!
                
                // Check if Card is on the MONSTERField
                for i in 0...11
                {   print(i)
                    print(EmptyOr[i])
                    
                    if (EmptyOr[i] == targetName)
                    {
                        FoundNode = i
                        print("TEST if index i is right1")
                        print(FoundNode!)
                        FOUND = true
                    }
                }
                
                
                if(FOUND == true)
                {
                    if (FoundNode < 6)
                    {
                        AllBoxNode[FoundNode]?.eulerAngles.x = 0.0
                        AllBoxNode[FoundNode]?.position.y = (-0.4)
                        AllBoxNode[FoundNode]?.position.z = (-1.3)
                        
                    }else
                    {
                        AllBoxNode[FoundNode]?.eulerAngles.x = 0.0
                        AllBoxNode[FoundNode]?.position.y = -0.4
                        AllBoxNode[FoundNode]?.position.z = -3.5
                    }
                    
                    
                    targetMaterial.diffuse.contents = UIImage(named: targetName)
                    AllBoxNode[FoundNode]?.geometry?.materials = [targetMaterial]
                    EmptyOr[FoundNode] = "empty"
                    
                    print("what Happens Activate MONSTER|TRAP|MAGIC:")
                    print(TempActionInside!)
                    print(TypOfCard!)
                    print(targetName!)
                    print(chooseM!)
                    print(chooseT!)
                    print(ALLOWdetect!)
                    print(EmptyOr[FoundNode])
                    
                } else if ( FOUND == false && TypOfCard == "MAGIC")
                {
                    EmptyOr[chooseT] = targetName
                    AllBoxNode[chooseT]?.eulerAngles.x = 0.0
                    AllBoxNode[chooseT]?.position.y = -0.4
                    AllBoxNode[chooseT]?.position.z = -3.0
                    targetMaterial.diffuse.contents = UIImage(named: targetName)
                    AllBoxNode[chooseT]?.geometry?.materials = [targetMaterial]
                    chooseT += 1
                    
                }
                FoundNode = 11
                ALLOWdetect = false
                print("what Happens Activate2 MONSTER|TRAP|MAGIC:")
                print(TempActionInside!)
                print(TypOfCard!)
                print(targetName!)
                print(chooseM!)
                print(chooseT!)
                print(ALLOWdetect!)
                print(EmptyOr[FoundNode])
                print(FOUND)
                print(FoundNode!)
                FoundNode = 0
                
                
            }
            
        }
        
        if(1==1)
        {
        print("Ende")
        print("Gregory:")
        print(TempActionInside!)
        print(TypOfCard!)
        print(targetName!)
        print(chooseM!)
        print(chooseT!)
        print(ALLOWdetect!)
        }
        return
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources-1", bundle: nil) else {
            fatalError("Missing expected asset catalog resources.")
        }
        
        // Create a session configuration
        let configuration = ARImageTrackingConfiguration()
        configuration.trackingImages = referenceImages
        configuration.maximumNumberOfTrackedImages = 1

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
  
}
