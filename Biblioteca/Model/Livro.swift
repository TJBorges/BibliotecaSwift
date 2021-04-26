//
//  Livro.swift
//  Biblioteca
//
//  Created by aluno on 13/04/21.
//  Copyright © 2021 Cesar School. All rights reserved.
//

import Foundation

struct Livro: Codable {
    var title: String = ""
    var isbn: String?
    var pageCount: Int = 0
    var thumbnailUrl: URL?
    var shortDescription: String?
    var longDescription: String?
    var authors: [String] = [""]
    var categories: [String] = [""]
    var publishedDate: Date?
    var quantity: Int = 0
    
    init() {
    }
}


