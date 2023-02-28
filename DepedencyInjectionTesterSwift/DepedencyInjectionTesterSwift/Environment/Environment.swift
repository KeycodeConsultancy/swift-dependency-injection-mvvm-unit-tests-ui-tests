import Foundation

enum Environment: String {
    case development = "DEVELOPMENT"
    case production = "Production"
    case none = "None"
}
 var environment: Environment = .none
