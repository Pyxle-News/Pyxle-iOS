//
//  ContentView.swift
//  Pyxle News
//
//  Created by Muhammad Shah on 19/11/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var store = BlogPostsStore()
    @State private var selected = 0
    let markdownText: LocalizedStringKey = "* This is **bold** text, this is *italic* text, and this is ***bold, italic*** text."
    var body: some View {
        MainView()
            .environmentObject(store)
           }
    }



struct FloatingTabbar : View {
    
    @Binding var selected : Int
    @State var expand = true
    
    
    var body : some View{
        GeometryReader { geometry in
            HStack{
                Spacer(minLength: 0)
                if #available(iOS 15.0, *) {
                    HStack{
                        if !self.expand{
                            
                            Button(action: {
                                self.expand.toggle()
                            }) {
                                Image(systemName: "arrow.left").foregroundColor(.green).padding()
                            }
                        }
                        else{
                            Button(action: {
                                self.selected = 0
                            }) {
                                Image(systemName: "clock.fill").foregroundColor(self.selected == 0 ? .init("b") : .primary).padding(.horizontal).font(.system(size: 18))
                            }
                            
                            Spacer(minLength: 10)
                            
                            Button(action: {
                                self.selected = 1
                            }) {
                                Image(systemName: "book.fill").foregroundColor(self.selected == 1 ? .init("b") : .primary).padding(.horizontal).font(.system(size: 18))
                            }
                            
                            Spacer(minLength: 10)
                            
                            Button(action: {
                                self.selected = 2
                            }) {
                                Image(systemName: "location.circle.fill").foregroundColor(self.selected == 2 ? .init("b") : .primary).padding(.horizontal) .font(.system(size: 18))
                            }
                            Spacer(minLength: 10)
                            
                            Button(action: {
                                self.selected = 4
                            }) {
                                Image(systemName: "rectangle.3.offgrid.fill").foregroundColor(self.selected == 4 ? .init("b") : .primary).padding(.horizontal).font(.system(size: 18))
                            }
                        }
                    }.padding(.vertical,self.expand ? 20 : 8)
                        .padding(.horizontal,self.expand ? 15 : 8)
                        .background(Color.accentColor)
                        .cornerRadius(15)
                        .padding(22)
                        .offset(y: 3)
                        .onLongPressGesture {
                            
                            self.expand.toggle()
                        }

                }
                
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height-(geometry.size.height*0.03))
        }
        
    }
}
