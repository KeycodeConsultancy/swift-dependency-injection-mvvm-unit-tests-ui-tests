import Foundation

struct Post: Codable {
    var postID, id: Int?
    let name, email, body: String?
    
    enum CodingKeys: String, CodingKey {
        case postID = "postId"
        case id, name, email, body
    }
}
