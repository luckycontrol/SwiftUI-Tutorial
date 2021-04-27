//
//  ContentView.swift
//  Project11
//
//  Created by 조종운 on 2021/04/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(entity: Book.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Book.rating, ascending: false)
    ]) var books: FetchedResults<Book>

    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(books, id: \.self) { book in
                    NavigationLink(destination: DetailView(book: book)) {
                        EmojiRatingView(rating: book.rating)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text(book.title ?? "Unknown Title")
                                .font(.headline)
                            Text(book.author ?? "Unknown Author")
                                .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: deleteBooks)
            }
            .navigationBarTitle("BookWorm")
            .navigationBarItems(trailing:
                                    Button(action: { showingAddScreen.toggle() }) {
                                        Image(systemName: "plus")
                                    }
            )
            .sheet(isPresented: $showingAddScreen) {
                AddBook()
            }
        }
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
