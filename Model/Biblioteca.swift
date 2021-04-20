//
//  Biblioteca.swift
//  Biblioteca
//
//  Created by aluno on 13/04/21.
//  Copyright © 2021 Cesar School. All rights reserved.
//

import Foundation

class Biblioteca {
    static var shared = Biblioteca()
    private init() {}

    var livros: [Livro] = {
        let contents = try! Data(contentsOf: Bundle.main.url(forResource: "books", withExtension: "json")!)
        let decoder = JSONDecoder()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        let books = try! decoder.decode([Livro].self, from: contents)
        return books
    }()
}
