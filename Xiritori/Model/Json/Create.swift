//
//  Create.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/30/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class Create {
var results: [Word] = []
var resultadoPalavras = [ResultWords]()

    init() {
do {
    let data = try Data(contentsOf: Normalizar().fileToNormalize, options: .alwaysMapped)
    let wordsArray = try JSONDecoder().decode([String].self, from: data)
    
//    let allWordsFile = try String(contentsOf: fileToNormalize, encoding: .utf8)
//    let wordsArray = allWordsFile.split(separator: "\n")
    
//    // Verificar e salvar
    
    var wordCollection = ResultWords()
    wordsArray.forEach { word in
        var firstCharater = String(word.first!)
        firstCharater = firstCharater.folding(options: .diacriticInsensitive, locale: .current)
        if firstCharater != wordCollection.firstCharacter {
            wordCollection.firstCharacter = firstCharater
            resultadoPalavras.append(wordCollection)
        }
        resultadoPalavras[resultadoPalavras.count - 1].words.append(Word(word: word, count: word.count))
    }

    // Saving
    let jsonData = try JSONEncoder().encode(resultadoPalavras)
    try jsonData.write(to: Normalizar().fileToSave, options: .atomic)
    
}catch {
    
}
}
}
