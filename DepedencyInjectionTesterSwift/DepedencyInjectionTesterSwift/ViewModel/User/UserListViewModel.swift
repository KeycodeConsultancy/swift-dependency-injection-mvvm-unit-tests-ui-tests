import Foundation

class UserListViewModel {
    
    var webService: WebServiceProtocol?
    var localService: MockService?
    var user: [UserViewModel] = []
    
    init(){}
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    init(localService: MockService) {
        self.localService = localService
    }
    
    func getUsers() async throws  {
        do {
            let users = try await self.webService?.load(User.getUsers())
            self.user = users?.map(UserViewModel.init) ?? []
        } catch {
            print(error)
        }
    }
    
    func localService() async throws  {
        do {
            let fakeLoadService = MockService()
            let users = try await fakeLoadService.load(User.getUsers())
            self.user = users.map(UserViewModel.init)
        } catch {
            print(error)
        }
    }
    
    func filterUsers(for searchText: String) -> [UserViewModel]? {
        let filteredItems = user.filter { object in
            return object.username.lowercased().contains(searchText.lowercased()) || object.name.lowercased().contains(searchText.lowercased())
        }
        return filteredItems
    }
}
