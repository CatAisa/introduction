//  RoomStore.swift

import SwiftUI
import Combine

class RoomStore : ObservableObject {
    @Published var rooms: [Room]
    
//    var rooms: [Room] {
//        willSet { willChange.send() }
//    }
    
    init(rooms: [Room] = []) {
        self.rooms = rooms
    }
    
//    var willChange = PassthroughSubject<Void, Never>()
}
