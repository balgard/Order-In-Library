//
//  SortingViewController.swift
//  Order In Library
//
//  Created by Student on 3/12/18.
//  Copyright © 2018 Balgard. All rights reserved.
//

var sortingCompleted = BooleanLiteralType()

import UIKit

class SortingViewController: UIViewController
{
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var bookOneLabel: UILabel!
    @IBOutlet weak var bookTwoLabel: UILabel!
    @IBOutlet weak var bookThreeLabel: UILabel!
    @IBOutlet weak var bookFourLabel: UILabel!
    @IBOutlet weak var bookFiveLabel: UILabel!
    @IBOutlet weak var bookSixLabel: UILabel!
    @IBOutlet weak var bookForSorting: Book!
    
    var bookTitles = [String]()
    var currentPosition = 0
    var boxesArray = [UILabel]()
    var wrongAnswers = 0
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setup()
        
    }
    
    func setup()//level:String)
    {
        //fixed text for boxes
        bookOneLabel.text = "F"
        bookFourLabel.text = "B"
        bookTwoLabel.text = "500"
        bookThreeLabel.text = "400"
        bookFiveLabel.text = "800"
        bookSixLabel.text = "900"
        
        boxesArray.append(bookOneLabel)
        boxesArray.append(bookTwoLabel)
        boxesArray.append(bookThreeLabel)
        boxesArray.append(bookFourLabel)
        boxesArray.append(bookFiveLabel)
        boxesArray.append(bookSixLabel)
        
        //fixed names for books
        bookTitles.append("F\nOAK")
        bookTitles.append("B\nBRE")
        bookTitles.append("538.9\nEIS")
        bookTitles.append("830.6\nBOC")
        bookTitles.append("950.8\nPON")
        bookTitles.append("407.1\nRON")
        bookTitles.append("501\nKAM")
        bookTitles.append("B\nELL")
        bookTitles.append("F\nMON")
        bookTitles.append("450.7\nLAM")
        
        bookForSorting.update(newID: bookTitles[0])
    }
    
    
    @IBAction func whenTapped(_ sender: UITapGestureRecognizer)
    {
        for box in boxesArray
        {
            if box.frame.contains(sender.location(in: backgroundView))
            {
                var boxText = String(box.text!.prefix(1))
                var bookText =  String(bookTitles[currentPosition].prefix(1))
                if boxText == bookText
                {
                    if currentPosition == 9
                    {
                        if wrongAnswers <= 3
                        {
                            let alert = UIAlertController(title: firstName + " " + lastName + " is Certified!", message: nil, preferredStyle: .alert)
                            let alertMessage = UIAlertAction(title: "new game", style: .default)
                            {
                                (action) -> Void in self.performSegue(withIdentifier: "unwindToLevel", sender: self)
                            }
                            alert.addAction(alertMessage)
                            sortingCompleted = true
                            present(alert, animated: true, completion: nil)
                        }
                        else
                        {
                            let alert = UIAlertController(title: "Try Again", message: nil, preferredStyle: .alert)
                            let alertMessage = UIAlertAction(title: "Restart", style: .default)
                            {
                                (action) -> Void in self.restartGame()
                            }
                            
                            let alertMes = UIAlertAction(title: "New Game", style: .default)
                            {
                                (action) -> Void in self.performSegue(withIdentifier: "unwindToLevel", sender: self)
                            }
                            alert.addAction(alertMessage)
                            alert.addAction(alertMes)
                            sortingCompleted = false
                            present(alert, animated: true, completion: nil)
                        }
                    }
                    else
                    {
                        tapHelper()
                    }
                }
                else
                {
                    wrongAnswers += 1
                }
            }
        }
        
        
        /*var selectedPoint = sender.location(in: self.view)
         if bookOneLabel.frame.contains(selectedPoint)
         {
         if (bookForSorting.id == bookOneLabel.text)
         {
         bookOneLabel.text = "One"
         }
         }
         else if bookTwoLabel.frame.contains(selectedPoint)
         {
         bookTwoLabel.text = "Two"
         }
         else if bookThreeLabel.frame.contains(selectedPoint)
         {
         bookThreeLabel.text = "Three"
         }
         else if bookFourLabel.frame.contains(selectedPoint)
         {
         bookFourLabel.text = "Four"
         }
         else if bookFiveLabel.frame.contains(selectedPoint)
         {
         bookFiveLabel.text = "Five"
         }
         else if bookSixLabel.frame.contains(selectedPoint)
         {
         bookSixLabel.text = "Six"
         }*/
    }
    
    func tapHelper()
    {
        currentPosition = currentPosition + 1
        bookForSorting.update(newID: bookTitles[currentPosition])
        
    }
    
    func restartGame()
    {
        currentPosition = 0
        wrongAnswers = 0
    }
    
}
