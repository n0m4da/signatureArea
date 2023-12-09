//
//  ContentView.swift
//  signatureArea
//
//  Created by Luis Rivera on 09/12/23.
//
import PencilKit
import SwiftUI

struct PencilKitRepresentable : UIViewRepresentable {
    let canvas = PKCanvasView(frame: .init(x: 0, y: 0, width: 400, height: 200))
        
    func makeUIView(context: Context) -> PKCanvasView {
        canvas.drawingPolicy = .anyInput
        return canvas
    }
    func updateUIView(_ uiView: PKCanvasView, context: Context) { }
}

struct ContentView: View {
    //MARK: - PROPERTIES
    let canvasView = PencilKitRepresentable()
    let imgRect = CGRect(x: .infinity, y: .infinity, width: 400.0, height: 200)
    
    func saveSignature() {
        var image = canvasView.canvas.drawing.image(from: imgRect, scale: 1.0)
    }
    
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Text ("Sign here:")
            canvasView.frame(height: 100.0)
                .border(Color.gray, width: 5)
            Button(action: {
            
                self.saveSignature()
            }) {
                Text("Save Signature")
            }
        }
    }
}
#Preview {
    ContentView()
}
