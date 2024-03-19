import Foundation

var songsList : [Songs] = []

class Songs {
    var name : String
    var author : String
    var imgName : String
    var songTitle : String
    
    init(name: String, author: String, imgName: String, songTitle: String) {
        self.name = name
        self.author = author
        self.imgName = imgName
        self.songTitle = songTitle
    }
}
