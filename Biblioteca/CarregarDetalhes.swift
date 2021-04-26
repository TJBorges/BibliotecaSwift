//
//  CarregarDetalhes.swift
//  Biblioteca
//
//  Created by aluno on 19/04/21.
//  Copyright © 2021 Cesar School. All rights reserved.
//

import Foundation

class CarregarDetalhes {
    var livro: Livro
    
    init(livro: Livro){
        self.livro = livro
        print(livro.thumbnailUrl as Any)
    }
    
}
