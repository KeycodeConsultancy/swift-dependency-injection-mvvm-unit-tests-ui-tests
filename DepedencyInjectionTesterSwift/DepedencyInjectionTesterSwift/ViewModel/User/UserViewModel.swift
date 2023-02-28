import Foundation

struct UserViewModel {
    fileprivate var user: User
    
    init(user: User) {
        self.user = user
    }
        
    var id: Int {
        self.user.id ?? 0
    }
    
    var username: String {
        self.user.username ?? Text.userName.rawValue
    }
    
    var name: String {
        self.user.name ??  Text.name.rawValue
    }
}
