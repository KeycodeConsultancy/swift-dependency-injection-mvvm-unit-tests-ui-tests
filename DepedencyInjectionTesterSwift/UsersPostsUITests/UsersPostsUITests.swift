import XCTest

final class UsersPostsUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_User_Table_View_Row_Count_Equals_10() {
        let app = XCUIApplication()
        app.launch()
        
        let table = app.tables.element
        let rowCount = table.cells.count
        XCTAssertEqual(rowCount, 10)
        
        for i in 0..<rowCount {
            let cell = table.cells.element(boundBy: i)
            XCTAssertTrue(cell.exists)
        }
    }
    
    func test_Click_On_First_Row_In_User_TableView() {
        let app = XCUIApplication()
        app.launch()
        let firstCell = app.tables.cells.element(boundBy: 0)
        firstCell.tap()
        sleep(5)
    }
    
    func test_Count_The_Amount_Of_Post_For_The_First_User() {
        let app = XCUIApplication()
        app.launch()
        
        let firstCell = app.tables.cells.element(boundBy: 0)
        firstCell.tap()
        
        let table = app.tables.element
        let rowCount = table.cells.count
        XCTAssertEqual(rowCount, 5)
        
        for i in 0..<rowCount {
            let cell = table.cells.element(boundBy: i)
            XCTAssertTrue(cell.exists)
        }
        sleep(5)
    }
    
    func test_Get_First_Record_From_Users_TableView() {
        let app = XCUIApplication()
        app.launch()
        let tableView = app.tables["userTable"]
        let firstCell = tableView.cells.element(boundBy: 0)
        let userNameLabel = firstCell.staticTexts["userNameLabel"]
        let nameLabel = firstCell.staticTexts["nameLabel"]
        let userName = userNameLabel.label
        let name = nameLabel.label
        XCTAssertEqual(userName, "Bret")
        XCTAssertEqual(name, "Leanne Graham")
    }
}
