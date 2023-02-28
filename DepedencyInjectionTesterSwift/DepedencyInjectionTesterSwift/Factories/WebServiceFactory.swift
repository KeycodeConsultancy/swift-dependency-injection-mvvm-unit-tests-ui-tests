import Foundation

class  WebServiceFactory {
    func create() -> WebServiceProtocol {
        #if PRODUCTION
            environment = .production
            return WebService()
        #else
            environment = .development
        return MockService()
        #endif
    }
}
