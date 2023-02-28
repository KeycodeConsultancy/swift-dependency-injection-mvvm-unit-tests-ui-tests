import Foundation

struct PostViewModel {
    fileprivate var post: Post
    
    init(post: Post) {
        self.post = post
    }
    
    public var id: Int {
        get {
            return self.post.id ?? 1
        }
        set {
            if newValue <= 0 {
                fatalError(Text.body.rawValue)
            } else {
                self.post.id = newValue
            }
        }
    }
    
    var name: String {
        self.post.name ?? Text.name.rawValue
    }
    
    var email: String {
        self.post.email ?? Text.emailAddress.rawValue
    }
    
    var body: String {
        self.post.body ?? Text.body.rawValue
    }
}
