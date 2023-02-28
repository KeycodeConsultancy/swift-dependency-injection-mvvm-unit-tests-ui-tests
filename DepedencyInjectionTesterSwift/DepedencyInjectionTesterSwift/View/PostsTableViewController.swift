import UIKit

class PostTableViewController: UITableViewController {
    var postListViewModel: PostListViewModel?
    var postViewModel: PostViewModel?
    var userViewModel: UserViewModel?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        let factory = WebServiceFactory()
        self.postListViewModel = PostListViewModel(webService: factory.create())
        
        Task {
            await getPosts()
        }
    }
    
    override func viewDidLoad()  {
        super.viewDidLoad()
    }
    
    private func getPosts() async  {
        do {
            try await self.postListViewModel?.remoteService(id: userViewModel?.id ?? 1)        
                reloadTableView()
        } catch {
            print(error.localizedDescription.description)
        }
    }
    
    private func reloadTableView() {
        tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postListViewModel?.post.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "postCell", for: indexPath)
        var post: PostViewModel?
        post = postListViewModel?.post[indexPath.row]
        cell.detailTextLabel?.text = String(post?.body ?? "User name not supplied")
        cell.textLabel?.text = String(post?.id ?? 0)
        return cell
    }
}
