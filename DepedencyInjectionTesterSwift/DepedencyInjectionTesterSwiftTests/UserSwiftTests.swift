import XCTest

final class UserSwiftTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetFirstUser() async  {
        do {
            var userListViewModel: UserListViewModel?
            let factory = WebServiceFactory()
            userListViewModel = UserListViewModel(webService: factory.create())
            try await userListViewModel?.localService()
            XCTAssertEqual(userListViewModel?.user[0].id, 1)
            XCTAssertEqual(userListViewModel?.user[0].name, "Leanne Graham")
            XCTAssertEqual(userListViewModel?.user[0].username,"Bret")
            
        } catch {
            print(error.localizedDescription.description)
        }
    }
    
    func testUsersArrayCount() async  {
        do {
            var userListViewModel: UserListViewModel?
            let factory = WebServiceFactory()
            userListViewModel = UserListViewModel(webService: factory.create())
            try await userListViewModel?.localService()
            XCTAssertEqual(userListViewModel?.user.count, 10)
        } catch {
            print(error.localizedDescription.description)
        }
    }
}
