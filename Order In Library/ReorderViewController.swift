//

//  ViewController.swift

//  Order in the Library Test

//

//  Created by Student on 4/17/18.

//  Copyright © 2018 Reed. All rights reserved.

//



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
    
    var firstBook = UILabel()
    
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
        fillBookArray()
    }
    
    func fillBookArray()
    {
        //take all book objects and randomize their order, add to books array, move the book to correct position
        var i = 5
        while (i > 0)
        {
            var randomInt = Int(arc4random_uniform(UInt32(i)))
            print(randomInt)
            tempArray.append(books[randomInt])
            books.remove(at: randomInt)
            i -= 1
        }
        books = tempArray
    }
    
    func createBookNames()
    {
        
        //Create Alphabet Array, use Random number generator to decide letter, add to title, repeat X2
        //Do this for every book
    }
    
    @IBAction func checkButton(_ sender: UIButton)
        
    {
        var i = 0
        //optimize with loops
        //arrayCreated = [bookZero.text!, bookOne.text!, bookTwo.text!, bookThree.text!, bookFour.text!]
        //remove arrayCreated when fillBookArray is finished
        for book in books
        {
            if (book.id == books[i].id)
            {
               book.backgroundColor = .green
            }
            i += 1
        }
        
        /*
        if (array[0] == arrayCreated[0])
        {
            bookZero.backgroundColor = .green
        }
        
        if (array[1] == arrayCreated[1])
            
        {
            
            bookOne.backgroundColor = .green
            
        }
        
        if (array[2] == arrayCreated[2])
            
        {
            
            bookTwo.backgroundColor = .green
            
        }
        
        if (array[3] == arrayCreated[3])
            
        {
            
            bookThree.backgroundColor = .green
            
        }
        
        if (array[4] == arrayCreated[4])
            
        {
            
            bookFour.backgroundColor = .green
            
        }
 */
        
    }
    
    
    
    @IBAction func onTapped(_ sender: UITapGestureRecognizer)
        
    {
        
        var selectedPoint = sender.location(in: self.view)
        
        //update order of books in array when moved 
        
        if (firstTap == false)
            
        {
            
            if (bookZero.frame.contains(selectedPoint))
                
            {
                
                firstString = bookZero.text!
                
                bookTapped = 0
                
                bookZero.backgroundColor = .blue
                
                firstBook = bookZero
                
                firstTap = true
                
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
                firstBook.backgroundColor = .red
                firstTap = false
            }
            else if (bookOne.frame.contains(selectedPoint))
            {
                firstBook.text = bookOne.text
                bookOne.text = firstString
                firstBook.backgroundColor = .red
                firstTap = false
            }
            else if (bookTwo.frame.contains(selectedPoint))
            {
                firstBook.text = bookTwo.text
                bookTwo.text = firstString
                firstBook.backgroundColor = .red
                firstTap = false
            }
            else if (bookThree.frame.contains(selectedPoint))
            {
                firstBook.text = bookThree.text
                bookThree.text = firstString
                firstBook.backgroundColor = .red
                firstTap = false
            }
            else if (bookFour.frame.contains(selectedPoint))
            {
                firstBook.text = bookFour.text
                bookFour.text = firstString
                firstBook.backgroundColor = .red
                firstTap = false
            }
        }
    }
    @IBAction func goBackTapped(_ sender: UIButton)
    {
        performSegue(withIdentifier: "unwindToLevel", sender: self)
    }
    
    
    
    
}


