//
//  PencilKit.swift
//  Workshops
//
//  Created by Alejandra Coeto on 03/12/24.
//

import SwiftUI
import PencilKit

struct PencilKit: View {
    @State var toolPicker = PKToolPicker(toolItems: [PKToolPickerInkingItem(type: .pen, color: .red, width: 5.0), PKToolPickerEraserItem(type: .fixedWidthBitmap, width: 10.0)])
    
    @State var canvas = PKCanvasView()
    @State var drawing = PKDrawing()
    
    var body: some View {
        ZStack {
            Color(.blue)
            
            VStack {
                Text("Strokes: \(drawing.strokes)")
                CanvasView(canvas: $canvas)
            }
            .onAppear {
                toolPicker.setVisible(true, forFirstResponder: canvas)
                canvas.becomeFirstResponder()
                toolPicker.addObserver(canvas)
            }
        }
    }
}

struct CanvasView: UIViewRepresentable {
    @Binding var canvas: PKCanvasView
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //a
    }
    
    func makeUIView(context: Context) -> some UIView {
        canvas.drawingPolicy = .anyInput
        canvas.contentSize = CGSize(width: 2000, height: 2000)
        return canvas
    }
}
#Preview {
    PencilKit()
}
