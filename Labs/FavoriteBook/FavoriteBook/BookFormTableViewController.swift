//
//  BookFormTableViewController.swift
//  FavoriteBooks
//
//  Created by Martin Kuchar on 2020-05-12.
//

import UIKit

class BookFormTableViewController: UITableViewController {
    
    var book: Book?
    
    @IBOutlet var bookTitle: UITextField!
    @IBOutlet var bookAuthor: UITextField!
    @IBOutlet var bookGenre: UITextField!
    @IBOutlet var bookLength: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }

    @IBAction func saveTheBook(_ sender: UIButton) {
        guard let title = bookTitle.text,
           let author = bookAuthor.text,
           let genre = bookGenre.text,
           let length = bookLength.text else {
               return
        }
        book = Book(title: title, author: author, genre: genre, length: length)
        
        performSegue(withIdentifier: "toBookList", sender: self)
        print(book)
//        dismiss(animated: true, completion: nil)
    }
    
    func updateView() {
          guard let book = book else {return}
          bookTitle.text = book.title
          bookAuthor.text = book.author
          bookGenre.text = book.genre
          bookLength.text = book.length
            print("updated")
      }
}
