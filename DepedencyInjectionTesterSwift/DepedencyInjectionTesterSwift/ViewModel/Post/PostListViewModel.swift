import Foundation

class PostListViewModel {
    var webService: WebServiceProtocol?
    var localService: MockService?
    var post: [PostViewModel] = []
    
    init(){}
    
    init(webService: WebServiceProtocol) {
        self.webService = webService
    }
    
    init(localService: MockService) {
        self.localService = localService
    }
    
    func remoteService(id: Int) async throws  {
        do {
            let posts = try await self.webService?.load(Post.getPostByID(id: id ))
            self.post = posts?.map(PostViewModel.init) ?? []
        } catch {
            print(error)
        }
    }
    
    func localService() async throws  {
        do {
            let fakeLoadService = MockService()
            let posts = try await fakeLoadService.load(Post.getPostByID(id: 1))
            self.post = posts.map(PostViewModel.init)
        } catch {
            print(error)
        }
    }
}
