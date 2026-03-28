import SwiftUI

struct EmojiItem: Identifiable {
    let id = UUID()
    let emoji: String
    var count: Int
}

struct ContentView: View {
    @State private var counters: [EmojiItem] = [
        EmojiItem(emoji: "😀", count: 3),
        EmojiItem(emoji: "🔥", count: -2),
        EmojiItem(emoji: "🚀", count: 2),
        EmojiItem(emoji: "🍎", count: 1),
        EmojiItem(emoji: "😎", count: -1)
    ]
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                
                List {
                    ForEach($counters) { $item in
                        HStack {
                            Text(item.emoji)
                                .font(.title2)
                            
                            Text("Counter: \(item.count)")
                                .foregroundColor(item.count < 0 ? .red : .primary)
                            
                            Spacer()
                            
                            HStack(spacing: 10) {
                                Button {
                                    item.count += 1
                                } label: {
                                    Text("+")
                                        .frame(width: 28, height: 28)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 6)
                                                .stroke(Color.red, lineWidth: 1)
                                        )
                                }
                                .buttonStyle(.borderless)
                                
                                Button {
                                    item.count -= 1
                                } label: {
                                    Text("-")
                                        .frame(width: 28, height: 28)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 6)
                                                .stroke(Color.red, lineWidth: 1)
                                        )
                                }
                                .buttonStyle(.borderless)
                            }
                            .foregroundColor(.red)
                        }
                        .padding(.vertical, 8)
                        .listRowBackground(Color.white)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            }
            .navigationTitle("Emoji Counter")
        }
    }
}

#Preview {
    ContentView()
}
