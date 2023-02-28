import Foundation

extension User {
    static func getUsers() -> Resource<User> {
        let url = URL(string:"https://jsonplaceholder.typicode.com/users")
        return Resource(url: url!)
    }
}

extension Post {
    static func getPostByID(id: Int) -> Resource<Post> {
        let url = URL(string:"https://jsonplaceholder.typicode.com/posts/\(id)/comments")
        return Resource(url: url!)
    }
}
