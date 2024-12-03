import Foundation
import Domain

public final class RemoteAddAccount: AddAccount {
    public let url: URL
    public let httpPostClient: HttpPostClient
    
    public init(url: URL, httpPostClient: HttpPostClient) {
        self.url = url
        self.httpPostClient = httpPostClient
    }
    
    public func add(addAccountModel: AddAccountModel, completion: @escaping (Result<AccountModel, DomainError>) -> Void ) {
        httpPostClient.post(to: url, with: addAccountModel.toData()) { result in
            completion(.failure(.unexpected))
        }
    }
}
