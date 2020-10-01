//
//  Normalizar.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/30/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//
import Foundation


public extension StringProtocol {
    var firstUppercased: String { prefix(1).uppercased() + dropFirst() }
    var firstCapitalized: String { prefix(1).capitalized + dropFirst() }
}

public class Normalizar {
    
public let playgroundSharedDatDirectory = URL(fileURLWithPath: "~/Documents/Shared Playground Data")
public var filename = "palavras.txt"
public var filenameToNormalize = "palavras_normalizadas.txt"
public var toSave = "resultado_palavras.json"

    var fileURL: URL {   get {return playgroundSharedDatDirectory.appendingPathComponent(filename)}
    }
    var fileToSave: URL { get { return playgroundSharedDatDirectory.appendingPathComponent(toSave) } }
    var fileToNormalize: URL { get { playgroundSharedDatDirectory.appendingPathComponent(filenameToNormalize) } }
    
 func normalizar(words: [String.SubSequence]) -> [String] {
    var newArray = [String]()
    words.forEach { word in
        if !word.contains("-") {
            let palavra = String(word).firstUppercased
            newArray.append(palavra)
        }
    }
    return newArray
}
    


 func generateFileNormalized() throws {
    let allWordsFile = try String(contentsOf: fileURL, encoding: .utf8)
    let wordsArray = allWordsFile.split(separator: "\n")
    let str = normalizar(words: wordsArray)
    
    let data = try JSONSerialization.data(withJSONObject: str, options: .prettyPrinted)
    try data.write(to: fileToNormalize, options: .atomic)
   // try str.write(to: fileToNormalize, atomically: true, encoding: .utf8)
}
    
}
