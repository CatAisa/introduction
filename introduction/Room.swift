//
//  Room.swift
//  introduction
//

import Foundation
struct Room : Identifiable {
    var id = UUID()
    var name: String
    var capacity: Int
    var hasVideo: Bool = false
    
    var thumbnailName: String { return name }
    var imageName: String { return name }
}

#if DEBUG
let testData = [
    Room(name: "test1", capacity: 1, hasVideo: true),
    Room(name: "test2", capacity: 2, hasVideo: false),
    Room(name: "test3", capacity: 3, hasVideo: true),
    Room(name: "test4", capacity: 4, hasVideo: true),
//    Room(name: "test5", capacity: 5, hasVideo: false),
//    Room(name: "test6", capacity: 6, hasVideo: false),
//    Room(name: "test7", capacity: 7, hasVideo: true),
//    Room(name: "test8", capacity: 8, hasVideo: false),
//    Room(name: "test9", capacity: 9, hasVideo: false),
]
#endif
