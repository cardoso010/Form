//
//  ContentView.swift
//  Form
//
//  Created by Gabriel Cardoso on 26/01/21.
//

import SwiftUI

struct ContentView: View {
    @State var titleBook = ""
    @State var author = ""
    @State var isExchange: Bool = true
    @State var description = "This book is about.."
    @State var price = ""
    @State private var date = Date()
    
    @State private var categoryIndex = 0
    
    var categorySelection = ["Action", "Classic", "Comic Book", "Fantasy", "Historical", "Literary Fiction", "Biographies", "Essyas"]
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("General")) {
                    TextField("Title", text: $titleBook)
                    TextField("Author", text: $author)
                    Toggle(isOn: $isExchange) {
                        Text("I'm interested in a exhange")
                    }
                }
                
                Section(){
                    Picker(selection: $categoryIndex, label: Text("Categories")) {
                        ForEach(0 ..< categorySelection.count) {
                            Text(self.categorySelection[$0])
                        }
                    }
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $description)
                }
                
                Section(header: Text("Price")) {
                    TextField("$0.00", text: $price)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("DatePicker")) {
                    DatePicker("Date Now", selection: $date, displayedComponents: [.date])
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
                
                Section {
                    Button(action: {
                        print("submitted ..")
                    }) {
                        Text("Publish now")
                    }
                }
                
                
            }.navigationTitle("Publish")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11 Pro Max")
            
    }
}
