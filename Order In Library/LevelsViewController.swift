//
//  LevelsViewController.swift
//  Order In Library
//
//  Created by Student on 4/26/18.
//  Copyright © 2018 Balgard. All rights reserved.
//

import UIKit

class LevelsViewController: UIViewController {
    @IBOutlet weak var noviceSortCheck: UIImageView!
    @IBOutlet weak var expertSortCheck: UIImageView!
    let check = #imageLiteral(resourceName: "check")
    let xMark = #imageLiteral(resourceName: "x")
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if(sortingCompleted == true)
        {
            noviceSortCheck.image = check
        }
        else
        {
            noviceSortCheck.image = xMark
        }
        
        if(reorderingCompleted == true)
        {
            expertSortCheck.image = check
        }
        else
        {
            expertSortCheck.image = xMark
        }
        
        

    }


}
