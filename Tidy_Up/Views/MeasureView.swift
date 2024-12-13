//
//  Untitled.swift
//  Tidy_Up
//
//  Created by Gina Saviano on 09/12/24.
//

import SwiftUI
import ARKit
import RealityKit

struct MeasureView: View {
    @State var distance: Float = 0.0
    @State var positions: [SIMD3<Float>] = []
    @State var anchors: [AnchorEntity] = [] // Track anchors
    @EnvironmentObject var shelfViewModel: ShelfViewModel // Call the Model
    @State var shelfLength: Double = 0.0
  
    @State var fittingBooks: [BookModel] = []
    
    @State var showResultView: Bool = false
    
    
    
    var body: some View {
        ZStack {
            // Ensure AR view covers the entire screen
            ARViewContainer(distance: $distance, positions: $positions, anchors: $anchors)
                .edgesIgnoringSafeArea(.all)
            
            // Centered Distance Display
            VStack {
                Spacer()
                
                HStack {
                    VStack {
                        Text("Distance")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(.bottom, 2)
                        
                        Text("\(String(format: "%.2f", distance)) m")
                            .font(.largeTitle)
                            .bold()
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.4))
                            )
                            .padding(.bottom, 50)
                    }//END OF THE DISTANCE SHOWER
                    
                    Spacer()
                    
                    //Button that triggers the calc and goes to the last View
                    Button(action: {
                        fittingBooks = calculateBooksThatFit(shelfLength: shelfLength, books: shelfViewModel.books)
                        showResultView = true
                    }) {
                        Text("Calculate")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.accentColor.opacity(0.9))
                            )
                    }
                    
                }
            }.padding(.horizontal)
                .sheet(isPresented: $showResultView) {
                    BooksFitView(fittingBooks: fittingBooks)
                        .environmentObject(shelfViewModel)
                }
            
            // Optional Crosshair Overlay
            Image(systemName: "plus")
                .foregroundStyle(.accent)
                .font(.title)
            
            
            
            // Bottom Toolbar
            HStack {
                Spacer()
                VStack {
                    HStack {
                        Button(action: {
                            resetMeasurements()
                        }) {
                            HStack {
                                Image(systemName: "arrow.counterclockwise")
                                Text("Reset")
                            }
                            .font(.headline)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color.black.opacity(0.6))
                            )
                            .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                .padding()
            }
        }
        
    }
    
    private func resetMeasurements() {
        positions.removeAll() // Clear the positions
        distance = 0 // Reset the measure "reader" to zero
        anchors.removeAll() // Clear tracked anchors
    }
    
    // Calculation of how many books fit in the shelf
    func calculateBooksThatFit(shelfLength: Double, books: [BookModel]) -> [BookModel] {
        
        self.shelfLength = Double(distance)
        let shelfLengthInCm = shelfLength * 100
        var remainingLength = shelfLengthInCm
        fittingBooks = []
        
        for book in books {
            if remainingLength >= book.thickness {
                fittingBooks.append(book)
                remainingLength -= book.thickness
            } else {
                break
            }
        }
        return fittingBooks
    }
}

//MARK: AR View Container: to call easily the AR tool inside the UI
struct ARViewContainer: UIViewRepresentable {
    @Binding var distance: Float
    @Binding var positions: [SIMD3<Float>]
    @Binding var anchors: [AnchorEntity] // Track anchors
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = [.horizontal, .vertical]
        config.environmentTexturing = .automatic
        arView.session.run(config)
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        
        arView.addGestureRecognizer(tapGesture)
        
        return arView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        // Remove all anchor points if they are cleared
        if anchors.isEmpty {
            uiView.scene.anchors.removeAll()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(distance: $distance, positions: $positions, anchors: $anchors)
    }
}

//MARK: Class containing the function to calculate the distance between points
class Coordinator: NSObject {
    @Binding var distance: Float
    @Binding var positions: [SIMD3<Float>]
    @Binding var anchors: [AnchorEntity] // Track anchors
    
    init(distance: Binding<Float>, positions: Binding<[SIMD3<Float>]>, anchors: Binding<[AnchorEntity]>){
        _distance = distance
        _positions = positions
        _anchors = anchors
    }
    
    func distanceBetweenPoints(_ point1: SIMD3<Float>, _ point2: SIMD3<Float>) -> Float {
        let deltaX = point2.x - point1.x
        let deltaY = point2.y - point1.y
        let deltaZ = point2.z - point1.z
        
        //Formula to calculate the distance between the points
        let distance = sqrt(deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ)
        return distance
    }
    
    //MARK: Returning the view of the gesture recognizer
    @objc func handleTap(_ gestureRecognizer: UITapGestureRecognizer){
        guard let arView = gestureRecognizer.view as? ARView else { return }
        let touchLocation = gestureRecognizer.location(in: arView)
        
        //Performs a ray cast, where a ray is cast into the scene from the center of the camera through a point in the view, and the results are immediately returned. From our touched point.
        if let hitTestResult = arView.raycast(from: touchLocation, allowing: .estimatedPlane, alignment: .any).first {
            let worldTransform = hitTestResult.worldTransform
            let position = SIMD3<Float>(worldTransform.columns.3.x,
                                        worldTransform.columns.3.y,
                                        worldTransform.columns.3.z)
            
            positions.append(position)
            if (positions.count>=2) {
                distance = distanceBetweenPoints(positions[positions.count-2], positions[positions.count-1])
            }
            
            let pointAnchor = AnchorEntity(world: position) //the actual point
            let pointEntity = ModelEntity(mesh: .generateSphere(radius: 0.005),
                                          materials: [SimpleMaterial(color: .systemTeal, isMetallic: true)]) //the figure you're gonna see
            
            pointAnchor.addChild(pointEntity)
            arView.scene.addAnchor(pointAnchor)
            
            anchors.append(pointAnchor) // Add anchor to tracking list
        }
        
    }
}

//MARK: PREVIEW
#Preview {
    MeasureView()
}

