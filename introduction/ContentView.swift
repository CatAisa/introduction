//
//  ContentView.swift
//  introduction
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var store = RoomStore()
    @State var addNum = 5
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button(action: addRoom) {
                        Text("Add Room")
                    }
                }
                Section {
                    ForEach(store.rooms) { room in
                        RoomCell(room: room)
                    }
                    .onDelete(perform: delete)
                    .onMove(perform: move)
                }
            }
            .navigationBarTitle(Text("Rooms"))
            .navigationBarItems(trailing: EditButton())
            .listStyle(GroupedListStyle())
        }
    }
    
    func addRoom() {
        store.rooms.append(Room(name: "test\(addNum)", capacity: addNum))
        addNum += 1
        if addNum > 9 {
            addNum = 1
        }
    }
    
    func delete(at offsets: IndexSet) {
        store.rooms.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        store.rooms.move(fromOffsets: source, toOffset: destination)
    }
}

#if DEBUG
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            Group {
                ContentView(store: RoomStore(rooms: testData))
                
                ContentView(store: RoomStore(rooms: testData))
                    .environment(\.sizeCategory, .extraExtraExtraLarge)
                
                ContentView(store: RoomStore(rooms: testData))
                    .environment(\.colorScheme, .dark)
                
                ContentView(store: RoomStore(rooms: testData))
                    .environment(\.locale, Locale(identifier: "ja"))
            }
        }
    }
#endif

struct RoomCell: View {
    let room: Room
    
    var body: some View {
        return NavigationLink(destination: RoomDetail(room: room)) {
            Image(room.thumbnailName)
                .resizable()
                .frame(width: 80.0, height: 60.0)
                .cornerRadius(10)
            VStack(alignment: .leading) {
                Text(room.name)
                Text("\(room.capacity) people")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
