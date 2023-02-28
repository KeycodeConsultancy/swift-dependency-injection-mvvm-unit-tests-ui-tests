import XCTest

final class UserCommentsRelationship: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testUserCommentsRelationship() async {
        
        do {
            
            var userListViewModel: UserListViewModel?
            var factory = WebServiceFactory()
            userListViewModel = UserListViewModel(webService: factory.create())
            try await userListViewModel?.localService()
        
            
            var postListViewModel: PostListViewModel?
            factory = WebServiceFactory()
            postListViewModel = PostListViewModel(webService: factory.create())
            try await postListViewModel?.localService()
            
            XCTAssertEqual(userListViewModel?.user[0].id, postListViewModel?.post[0].id )
            XCTAssertEqual(userListViewModel?.user[0].id, 1)
            XCTAssertEqual(userListViewModel?.user[0].name, "Leanne Graham")
            XCTAssertEqual(userListViewModel?.user[0].username,"Bret")
            
            XCTAssertEqual(postListViewModel?.post[0].body,"laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
            XCTAssertEqual(postListViewModel?.post[1].body,"est natus enim nihil est dolore omnis voluptatem numquam\net omnis occaecati quod ullam at\nvoluptatem error expedita pariatur\nnihil sint nostrum voluptatem reiciendis et")
            XCTAssertEqual(postListViewModel?.post[2].body,"quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione")
            XCTAssertEqual(postListViewModel?.post[3].body,"non et atque\noccaecati deserunt quas accusantium unde odit nobis qui voluptatem\nquia voluptas consequuntur itaque dolor\net qui rerum deleniti ut occaecati")
            XCTAssertEqual(postListViewModel?.post[4].body,"harum non quasi et ratione\ntempore iure ex voluptates in ratione\nharum architecto fugit inventore cupiditate\nvoluptates magni quo et")
            
            XCTAssertEqual(postListViewModel?.post.count, 5)
            
        } catch {
            print(error.localizedDescription.description)
        }
    }
}
