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
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if(sortingCompleted == true)
        {
            noviceSortCheck.backgroundColor = .green
        }
        else if(sortingCompleted == false)
        {
            noviceSortCheck.backgroundColor = .red
        }
        

    }


}
