//
//  SortingViewController.swift
//  Order In Library
//
//  Created by Student on 3/12/18.
//  Copyright © 2018 Balgard. All rights reserved.
//

import UIKit

class SortingViewController: UIViewController
{
    @IBOutlet weak var bookOneLabel: UILabel!
    @IBOutlet weak var bookTwoLabel: UILabel!
    @IBOutlet weak var bookThreeLabel: UILabel!
    @IBOutlet weak var bookFourLabel: UILabel!
    @IBOutlet weak var bookFiveLabel: UILabel!
    @IBOutlet weak var bookSixLabel: UILabel!
    @IBOutlet weak var bookForSorting: Book!
    
    var bookTitles = [String]()
    
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
        var selectedPoint = sender.location(in: self.view)
        if bookOneLabel.frame.contains(selectedPoint)
        {
            bookOneLabel.text = "One"
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
        }
    }
}
