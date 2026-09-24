//
//  ContentView.swift
//  SwiftUI-Assignment-3
//
//  Created by NikoDanelia on 21/09/2026.
//

import SwiftUI


struct BookListView: View {
    let books = sampleBooks
    @Binding var path: [Book] // 👈

    var body: some View {
        List {
           
            Section {
                Button(action: {
                    if let randomBook = books.randomElement() {
                        path.append(randomBook) //  ამატებს წიგნს ნავიგაციაში
                    }
                }) {
                    HStack {
                        Image(systemName: "dice.fill")
                            .foregroundColor(.orange)
                        Text("შემთხვევითი წიგნი")
                            .bold()
                            .foregroundColor(.orange)
                    }
                }
            }
            
            // წიგნების სია
            Section("ყველა წიგნი") {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack(spacing: 15) {
                            Text(book.emoji)
                                .font(.title)
                            
                            Text(book.title)
                                .font(.body)
                                .fontWeight(.medium)
                        }
                        .padding(.vertical, 4)
                    }
                }
            }
        }
        .navigationTitle("ჩემი წიგნები")
        .navigationDestination(for: Book.self) { selectedBook in
            BookDetailView(book: selectedBook)
        }
    }
}

// ჩემ შესახებ ეკრანი
struct AboutMeView: View {
    var body: some View {
        VStack(spacing: 15) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
            
            Text("ძანნ კაცის პროფილი")
                .font(.title)
                .bold()
            
            Text("ეს აპლიკაცია შექმნილია ძან კაცის მიერ.")
                .font(.subheadline)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }
}

// მთავარი RootView ტაბბარითა
struct ContentView: View {
    @State private var path: [Book] = []

    var body: some View {
        TabView {
            NavigationStack(path: $path) {
                BookListView(path: $path)
            }
            .tabItem {
                Label("წიგნები", systemImage: "books.vertical.fill")
            }
            
            AboutMeView()
                .tabItem {
                    Label("ჩემ შესახებ", systemImage: "person.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}
