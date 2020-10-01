//
//  CreateJson.swift
//  Xiritori
//
//  Created by Gilberto Magno on 9/30/20.
//  Copyright © 2020 Academy IFCE. All rights reserved.
//

import Foundation

class CreateJson {
    var palavra: String = ""
    let resultFileURL = Bundle.main.url(forResource: "resultado_palavras", withExtension: "json")!
//    let resultFileURL = Normalizar().playgroundSharedDatDirectory.appendingPathComponent("resultado_palavras.json")
    
    var data: Data { get {do {
        return try Data(contentsOf: resultFileURL, options: .alwaysMapped) }catch {return Data()}} }
    var results: [ResultWords] { get {do { return try JSONDecoder().decode([ResultWords].self, from: data)} catch {return []} } }

    init() {
        let auxAlphabet = "A B C D E F G H I J K L M N O P Q R S T U V W X Y Z"
        let array = auxAlphabet.split {
            !$0.isUppercase
        }
        let auxRandomIndex = Int.random(in: 1...25)
        getRandomWord(initiaLetter: String(array[auxRandomIndex]), completion: {_ in })

    }
    
    
    func getRandomWord(initiaLetter: String, completion: @escaping (String) -> Void) {
        
        if let startWith = results.first(where: {$0.firstCharacter == initiaLetter }) {
            let randomWord = startWith.words[Int.random(in: 0..<startWith.words.count)]
            self.palavra = randomWord.word
            print(self.palavra)
            completion(palavra)
            
        }
        
    }

}
