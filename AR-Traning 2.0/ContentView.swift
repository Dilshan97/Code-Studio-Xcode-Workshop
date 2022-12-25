//
//  ContentView.swift
//  AR-Traning 2.0
//
//  Created by Dilshan Ramesh on 2022-12-24.
//

import SwiftUI
import RealityKit // import the readlity kit lib
import Combine
import AVFoundation

struct ContentView: View {
    var body: some View {
        ARViewContainer().ignoresSafeArea()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}


struct ARViewContainer : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some ARView {
        let arView = ARView(frame: .zero)
//        arView.addGestureRecognizer(UITapGestureRecognizer(
//            target: context.coordinator,
//            action: #selector(Coordinator.tapARView(sender:)))
//        )
        context.coordinator.arView = arView
//        context.coordinator.loadModelAsync()
//        context.coordinator.loadModelonImage()
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> ARCoordinator {
        return ARCoordinator()
    }
    
}

class ARCoordinator : NSObject {
    
    var arView: ARView?
    
    var bag : AnyCancellable?
    
    var iPad: AnyCancellable?
    
//    @objc func tapARView(sender: UITapGestureRecognizer) {
//
//        guard let view = arView else { return }
//
//        let tapLocation = sender.location(in: view)
//
//        let racast = view.raycast(
//            from: tapLocation,
//            allowing: .estimatedPlane,
//            alignment: .horizontal
//        )
//
//        if let place = racast.first{
//
//            let placeAnchor = AnchorEntity(raycastResult: place)
//
//            let box = ModelEntity(
//                mesh: .generateBox(size: 0.05),
//                materials: [SimpleMaterial(
//                    color: .systemRed,
//                    isMetallic: true
//                )]
//            )
//
//            placeAnchor.addChild(box)
//
//            view.scene.addAnchor(placeAnchor)
//        }
//    }
    
//   @objc func loadMoel () {
//
//        guard let view = arView else { return }
//
//        let anchor = AnchorEntity(
//            plane: .horizontal
//        )
//
//       if let model = try? ModelEntity.loadModel(named: "mei") {
//           anchor.addChild(model)
//           view.scene.addAnchor(anchor)
//       }
//
//
//    }
    
//     func loadModelAsync() {
//
//        guard let view = arView else { return }
//
//        let anchor = AnchorEntity(plane: .horizontal)
//
//        bag =  ModelEntity.loadAsync(named: "sophia").sink { compleation in
//
//        } receiveValue: { model in
//
//            anchor.addChild(model)
//
//            for animation in model.availableAnimations {
//                model.playAnimation(
//                    animation.repeat(duration: .infinity),
//                    transitionDuration: 1,
//                    startsPaused: false
//                )
//            }
//        }
//
//        view.scene.addAnchor(anchor)
//    }
    
    func loadModelonImage() {
        
        guard let view = arView else { return }
        
        let anchor = AnchorEntity(.image(
            group: "ARAssets",
            name: "macbook")
        )
                                  
        bag =  ModelEntity.loadAsync(named: "dog").sink(receiveCompletion: { compleation in
            
        },
        receiveValue:{ model in
//            model.generateCollisionShapes(recursive: true)
            anchor.addChild(model)
//            view.installGestures(for: model)
        })
        
        view.scene.addAnchor(anchor)
        
    }
    
//    func playARVideo() {
//
//        guard let view = arView else { return }
//
//        guard let videoURL = Bundle.main.url(
//            forResource: "filename",
//            withExtension: "mp4"
//        ) else {
//            return
//        }
//
//        let player = AVPlayer(url: videoURL)
//
//        let videoMaterial = VideoMaterial(avPlayer: player)
//
//        let anchor = AnchorEntity(.image(group: "ARAssets", name: "QR"))
//
//        let plainModel = ModelEntity(mesh: MeshResource.generatePlane(width: 0.5, depth: 0.5), materials: [videoMaterial])
//
//        anchor.addChild(plainModel)
//
//        view.scene.addAnchor(anchor)
//
//        player.play()
//
//
//    }
    
}



