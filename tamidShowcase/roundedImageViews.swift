//
//  roundedImageViews.swift
//  tamidShowcase
//
//  Created by Kai Munechika on 6/11/16.
//  Copyright © 2016 H. All rights reserved.
//

import Foundation
import UIKit

class roundedImageViews: UIImageView {
    
    func viewDidLayoutSubviews() {

        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.cornerRadius = self.frame.width/2
        self.clipsToBounds = true
    }
}