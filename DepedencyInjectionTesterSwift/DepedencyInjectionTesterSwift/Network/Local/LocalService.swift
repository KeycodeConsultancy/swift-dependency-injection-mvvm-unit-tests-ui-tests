import Foundation

class MockService: WebServiceProtocol {
    public var jsonFileName: String?

    func load<T: Codable>(_ resource: Resource<T>) async throws -> [T] {
        let fileName = String(describing: T.self)
        guard let path = Bundle.main.path(forResource: fileName.lowercased(), ofType: "json") else {
            fatalError("Resource file not found")
        }
        let data = try Data(contentsOf: URL(fileURLWithPath: path))
        let model = try JSONDecoder().decode([T].self, from: data)
        return model
    }
}
