import XCTest

final class CommentsTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Get_First_Post() async  {
        do {
            var postListViewModel: PostListViewModel?
            let factory = WebServiceFactory()
            
            postListViewModel = PostListViewModel(webService: factory.create())
            try await postListViewModel?.localService()
            XCTAssertEqual(postListViewModel?.post[0].id, 1)
            XCTAssertEqual(postListViewModel?.post[0].body, "laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium")
        } catch {
            print(error.localizedDescription.description)
        }
    }
    
    func test_Post_Array_Count() async  {
        do {
            var postListViewModel: PostListViewModel?
            let factory = WebServiceFactory()
            postListViewModel = PostListViewModel(webService: factory.create())
            try await postListViewModel?.localService()
            XCTAssertEqual(postListViewModel?.post.count, 5)
        } catch {
            print(error.localizedDescription.description)
        }
    }
}
