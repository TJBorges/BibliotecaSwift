//
//  DetalhesViewController.swift
//  Biblioteca
//
//  Created by aluno on 19/04/21.
//  Copyright © 2021 Cesar School. All rights reserved.
//

import UIKit
import Nuke

class DetalhesViewController: UIViewController {
    
    var livro: Livro? = nil
    var authors: String = ""
    var categories: String = ""
    var date: Date? = nil
    
    
    @IBOutlet weak var imgCover: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    @IBOutlet weak var lbAuthor: UILabel!
    @IBOutlet weak var lbISBN: UILabel!
    @IBOutlet weak var lbPublished: UILabel!
    @IBOutlet weak var lbPags: UILabel!
    @IBOutlet weak var lbCategories: UILabel!
    @IBOutlet weak var lbDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = livro!.thumbnailUrl {
            Nuke.loadImage(with: url, into: imgCover)
        }
        
        self.lbTitle.text = livro!.title
        
        for author in livro!.authors {
            self.authors = authors == "" ? author : authors + ", " + author
        }
        self.lbAuthor.text = self.authors
        
        self.lbISBN.text = livro!.isbn
        
        self.date = livro!.publishedDate
        let formate = getFormattedDate((date)!, "dd/MMM/yyyy")
        self.lbPublished.text = formate
        
        self.lbPags.text = String(livro!.pageCount)
        
        for category in livro!.categories {
            self.categories = categories == "" ? category : categories + ", " + category
        }
        self.lbCategories.text = categories
        
        self.lbDescription.text = livro!.shortDescription
        
    }
    
    func getFormattedDate(_ date: Date, _ format: String) -> String {
            let dateformat = DateFormatter()
            dateformat.dateStyle = .medium
            dateformat.timeStyle = .none
            dateformat.locale = Locale(identifier: "pt_BR")
            return dateformat.string(from: date)
        }
}
