import Foundation

public struct ResultWords: Codable {
    public var firstCharacter: String = ""
    public var words: [Word] = []
    
    public init() {}
}

