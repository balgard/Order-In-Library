//
//  Book.swift
//  Order In Library
//
//  Created by Balgard on 3/14/18.
//  Copyright © 2018 Balgard. All rights reserved.
//

import UIKit

class Book: UILabel
{
    var color = ""
    var id = ""
    
    func setup(color: String, id: String)
    {
        self.color = color
        self.id = id
    }
    
    func update(newID: String)
    {
        id = newID
        self.text = newID
    }
    
    //dev test changes
}
