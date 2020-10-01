import Foundation
import PlaygroundSupport


public extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}


public var filename = "palavras.txt"
public var filenameToNormalize = "palavras_normalizadas.txt"
public var toSave = "resultado_palavras.json"

public let fileURL = playgroundSharedDataDirectory.appendingPathComponent(filename)
public var fileToSave = playgroundSharedDataDirectory.appendingPathComponent(toSave)
public var fileToNormalize = playgroundSharedDataDirectory.appendingPathComponent(filenameToNormalize)

public func normalizar(words: [String.SubSequence]) -> [String] {
    var newArray = [String]()
    words.forEach { word in
        if !word.contains("-") {
            let palavra = String(word).firstUppercased
            newArray.append(palavra)
        }
    }
    return newArray
}


public func generateFileNormalized() throws {
    let allWordsFile = try String(contentsOf: fileURL, encoding: .utf8)
    let wordsArray = allWordsFile.split(separator: "\n")
    let str = normalizar(words: wordsArray)
    
    let data = try JSONSerialization.data(withJSONObject: str, options: .prettyPrinted)
    try data.write(to: fileToNormalize, options: .atomic)
   // try str.write(to: fileToNormalize, atomically: true, encoding: .utf8)
}

