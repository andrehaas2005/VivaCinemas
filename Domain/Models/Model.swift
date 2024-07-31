import Foundation

public protocol Model: Codable {}

public extension Model {
    func toData() -> Data? {
        return try? JSONEncoder().encode(self)
    }
    
    func toJson() -> [String : Any]? {
        guard let data = self.toData() else {return nil}
        return try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed) as? [String : Any]
    }
}
