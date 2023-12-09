//
//  ContentView.swift
//  signatureArea
//
//  Created by N0m4d on 09/12/23.
//  instagram: @nomada.dev
//  github: https://github.com/n0m4da
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
    @State private var canvasView = PencilKitRepresentable()
    let imgRect = CGRect(x: .infinity, y: .infinity, width: 400.0, height: 200)
    
    func saveSignature() {
        let image = canvasView.canvas.drawing.image(from: imgRect, scale: 1.0)
        
        //MARK: - do what you need!
    }
    
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Text ("Sign here:")
            canvasView.frame(height: 200)
                .border(Color.gray, width: 5)
            Button(action: {
            
                self.saveSignature()
            }) {
                Text("Save Signature")
            }
            
            Button("Clear"){
                canvasView.canvas.drawing = PKDrawing()
            }
        }
    }
}
#Preview {
    ContentView()
}
