import UIKit

class UsersTableViewController: UITableViewController {
    var filteredItems: [UserViewModel]?
    var userListViewModel: UserListViewModel?
    var selectedUser: UserViewModel?
    let searchController = UISearchController(searchResultsController: nil)
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        let factory = WebServiceFactory()
        self.userListViewModel = UserListViewModel(webService: factory.create())
        
        Task {
            await getUsers()
        }
    }
    
    override func viewDidLoad()  {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        tableView.accessibilityIdentifier = "userTable"
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
    }
    
    private func getUsers() async  {
        do {
            try await self.userListViewModel?.getUsers()
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
        if isFiltering() {
            return filteredItems?.count ?? 0
        } else {
            return userListViewModel?.user.count ?? 0
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFiltering() {
            let filteredRecords = filteredItems?[indexPath.row]
            self.selectedUser = filteredRecords
        } else {
            let selectedRecord = userListViewModel?.user[indexPath.row]
            self.selectedUser = selectedRecord
        }
        performSegue(withIdentifier: "postTableViewController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let postTableViewController = segue.destination as? PostTableViewController {
            postTableViewController.userViewModel = selectedUser
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        var user: UserViewModel?
        if isFiltering() {
            user = filteredItems?[indexPath.row]
        } else {
            user = userListViewModel?.user[indexPath.row]
        }
        
        cell.detailTextLabel?.text = String(user?.username ?? Text.userName.rawValue)
        cell.detailTextLabel?.accessibilityIdentifier = "userNameLabel"
        cell.textLabel?.accessibilityIdentifier = "nameLabel"
        cell.textLabel?.text = String(user?.name ?? Text.name.rawValue)
        return cell
    }
}

extension UsersTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        filteredItems = userListViewModel?.filterUsers(for: searchText)
        tableView.reloadData()
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool {
        return searchController.searchBar.text?.isEmpty ?? true
    }
}
