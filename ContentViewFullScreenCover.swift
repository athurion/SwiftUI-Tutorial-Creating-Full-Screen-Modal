//
//  ContentView.swift
//  SwiftUI Tutorial: Creating Full Screen Modal
//
//  Created by Alvin Sosangyo on 08/13/22.
//

import SwiftUI


struct ContentView: View {

    @State private var mainText: String = ""
    @State private var isPresented: Bool = false

    var body: some View {

        ZStack(alignment: .bottom) {

            ScrollView {
                
                Text(mainText)
                    .padding()
                
            }
            
            NewNoteButton {
                isPresented.toggle()
            }

        } //ZStack
        .fullScreenCover(isPresented: $isPresented) {
            FullScreenModalView(mainText: $mainText)
        }

    } //body

} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

/// Best practice: This part should be written on a separate swift file.
struct FullScreenModalView: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var mainText: String
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                Spacer()
                
                Button(action: {
                    dismiss()
                }) {
                    Text("Done")
                        .foregroundColor(Color.white)
                }
                .padding()
                
            } // HStack
            .background(Color.blue)
            
            TextEditor(text: $mainText)
                .padding(.horizontal)
            
        } // VStack
        
    } // body
    
} // FullScreenModalView

/// Best practice: This part should be written on a separate swift file.
struct NewNoteButton: View {
    
    var action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Image(systemName: "square.and.pencil")
                .resizable()
                .scaledToFill()
                .frame(width: 50, height: 50)
                .padding(30)
        }
        .background(.blue)
        .foregroundColor(.white)
        .cornerRadius(.infinity)
        .padding()
        
    } // body
    
} // newNoteButton
