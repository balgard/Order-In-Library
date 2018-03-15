//
//  Book.swift
//  Order In Library
//
//  Created by Balgard on 3/14/18.
//  Copyright © 2018 Balgard. All rights reserved.
//

import UIKit

class Book: UIView
{
    var color = ""
    var id = ""
    var child = UIView()
    
    func setup(color: String, id: String, child: UIView)
    {
        self.color = color
        self.id = id
        self.child = child
    }
    
    //dev test changes
    

}
