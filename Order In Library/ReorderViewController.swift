//

//  ViewController.swift

//  Order in the Library Test

//

//  Created by Student on 4/17/18.

//  Copyright © 2018 Reed. All rights reserved.

//

var decide = true

import UIKit



class ReorderViewController: UIViewController
{
    
    @IBOutlet weak var bookZero: Book!
    
    @IBOutlet weak var bookOne: Book!
    
    @IBOutlet weak var bookTwo: Book!
    
    @IBOutlet weak var bookThree: Book!
    
    @IBOutlet weak var bookFour: Book!
    
    
    var array = ["0","1","2","3","4"]
    
    var arrayCreated = [""]
    
    var firstString = ""
    
    var firstTap = false
    
    var bookTapped = -1
    
    var firstBook = Book()
    
    var books = [Book]()
    
    var tempArray = [Book]()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        books.append(bookZero)
        books.append(bookOne)
        books.append(bookTwo)
        books.append(bookThree)
        books.append(bookFour)
        //fillBookArray()
        createBookNames()
    }
    
    func fillBookArray()
    {
        //take all book objects and randomize their order, add to books array, move the book to correct position
        //might not be necessary with random name generation
        var i = 5
        while (i > 0)
        {
            var randomInt = Int(arc4random_uniform(UInt32(i)))
            tempArray.append(books[randomInt])
            books.remove(at: randomInt)
            i -= 1
        }
        books = tempArray
        for book in books
        {
            book.update(newID: book.id)
        }
    }
    
    func createBookNames()
    {
        //Create Alphabet Array, use Random number generator to decide letter, add to title, repeat X2
        //Do this for every book
        let alphArray = ["A","B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
        
        
        if (decide == true) //Alphabet
        {
            let startingLetterNumber =  Int(arc4random_uniform(UInt32(alphArray.count)))
            let startingLetter = alphArray[startingLetterNumber]
            
            var alphaLabel = ""
            var temp = ""
            for book in books
            {
                var i = 3
                while i > 1
                {
                    let nextNumber = Int(arc4random_uniform(26))
                    temp += alphArray[nextNumber]
                    i -= 1
                }
                alphaLabel = temp
                temp = ""
                book.update(newID: startingLetter + alphaLabel)
            }
            decide = false
        }
        else if (decide == false)//Dewey Decimal
        {
            let startingNum = String(Int(arc4random_uniform(999)))
            var decLabel = ""
            var tempDec = ""
            
            for book in books
            {
                var i = 3
                while (i > 1)
                {
                    tempDec += String(arc4random_uniform(9))
                    i -= 1
                }
                decLabel = tempDec
                tempDec = ""
                book.update(newID: startingNum + "." + decLabel)
            }
            decide = true
        }
    }
    
    @IBAction func checkButton(_ sender: UIButton)
    {
        var i = 0
        var sortedBooks = books
        sortedBooks.sort()
        for book in books
        {
            if (book.id == sortedBooks[i].id)
            {
                book.backgroundColor = .green
            }
            else
            {
                book.backgroundColor = .red
            }
            i += 1
        }
        firstTap = false
    }
    
    
    
    @IBAction func onTapped(_ sender: UITapGestureRecognizer)
        
    {
        var selectedPoint = sender.location(in: self.view)
        //update order of books in array when moved
        
        for book in books
        {
            if book.frame.contains(sender.location(in: self.view))
            {
                if (firstTap == false)
                {
                    firstBook = book
                    firstString = firstBook.id
                    firstBook.backgroundColor = .blue
                    firstTap = true
                }
                else
                {
                    firstBook.update(newID: book.id)
                    book.update(newID: firstString)
                    firstBook.backgroundColor = .clear
                    firstTap = false
                }
            }
        }
        /*if (firstTap == false)
         {
         
         if (bookZero.frame.contains(selectedPoint))
         
         {
         
         firstBook = bookZero
         firstBook.backgroundColor = .blue
         
         
         }
         
         else if (bookOne.frame.contains(selectedPoint))
         
         {
         
         firstString = bookOne.text!
         
         bookTapped = 1
         
         bookOne.backgroundColor = .blue
         
         firstBook = bookOne
         
         firstTap = true
         
         }
         
         else if (bookTwo.frame.contains(selectedPoint))
         
         {
         
         firstString = bookTwo.text!
         
         bookTapped = 2
         
         bookTwo.backgroundColor = .blue
         
         firstBook = bookTwo
         
         firstTap = true
         
         }
         
         else if (bookThree.frame.contains(selectedPoint))
         
         {
         firstString = bookThree.text!
         bookTapped = 3
         bookThree.backgroundColor = .blue
         firstBook = bookThree
         firstTap = true
         
         }
         
         else if (bookFour.frame.contains(selectedPoint))
         {
         firstString = bookFour.text!
         bookTapped = 4
         bookFour.backgroundColor = .blue
         firstBook = bookFour
         firstTap = true
         }
         }
         else
         {
         if (bookZero.frame.contains(selectedPoint))
         {
         firstBook.text = bookZero.text
         bookZero.text = firstString
         firstBook.backgroundColor = .clear
         firstTap = false
         }
         else if (bookOne.frame.contains(selectedPoint))
         {
         firstBook.text = bookOne.text
         bookOne.text = firstString
         firstBook.backgroundColor = .clear
         firstTap = false
         }
         else if (bookTwo.frame.contains(selectedPoint))
         {
         firstBook.text = bookTwo.text
         bookTwo.text = firstString
         firstBook.backgroundColor = .clear
         firstTap = false
         }
         else if (bookThree.frame.contains(selectedPoint))
         {
         firstBook.id = bookThree.id
         bookThree.id = firstString
         firstBook.backgroundColor = .clear
         firstTap = false
         
         }
         else if (bookFour.frame.contains(selectedPoint))
         {
         firstBook.text = bookFour.text
         bookFour.text = firstString
         firstBook.backgroundColor = .clear
         firstTap = false
         }
         }*/
    }
    @IBAction func goBackTapped(_ sender: UIButton)
    {
        performSegue(withIdentifier: "unwindToLevel", sender: self)
    }
    
    
    
    
}


