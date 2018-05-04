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
       // fillBookArray()
        createBookNames()
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
            //tempArray.last?.id = books[randomInt].text!
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
            let startingLetterNumber =  Int(arc4random_uniform(26))
            let startingLetter = alphArray[startingLetterNumber]
            
            var alphaLabel = ""
            var j = 6
            var temp = ""
            
            while j > 1
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
                
                if(j == 6)
                {
                    bookZero.update(newID: startingLetter + alphaLabel)
                }
                
                if(j == 5)
                {
                    bookOne.update(newID: startingLetter + alphaLabel)
                }
                if(j == 4)
                {
                    bookTwo.update(newID: startingLetter + alphaLabel)
                }
                if(j == 3)
                {
                    bookThree.update(newID: startingLetter + alphaLabel)
                }
                if(j == 2)
                {
                    bookFour.update(newID: startingLetter + alphaLabel)
                }
                
                j -= 1
            }
            decide = false
            
        }
        else if (decide == false)//Dewey Decimal
        {
            let startingNum = String(Int(arc4random_uniform(999)))
            var decLabel = ""
            var tempDec = ""
            
            
            var j = 6
            
            while (j > 1)
            {
                var i = 3
                while (i > 1)
                {
                    tempDec += String(arc4random_uniform(9))
                    i -= 1
                }
                decLabel = tempDec
                tempDec = ""
                if(j == 6)
                {
                    bookZero.update(newID: startingNum + "." + decLabel)
                }
                
                if(j == 5)
                {
                    bookOne.update(newID: startingNum + "." + decLabel)
                }
                if(j == 4)
                {
                    bookTwo.update(newID: startingNum + "." + decLabel)
                }
                if(j == 3)
                {
                    bookThree.update(newID: startingNum + "." + decLabel)
                }
                if(j == 2)
                {
                    bookFour.update(newID: startingNum + "." + decLabel)
                }
                
                j -= 1
                
                
            }
            decide = true
        }
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


