//
//  PostCell.swift
//  tamidShowcase
//
//  Created by H on 5/31/16.
//  Copyright © 2016 H. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var showcaseImg: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    
    }
    
    override func drawRect(rect: CGRect) {
        
        // after profile image has frame and size, make it circular 
        
        profileImg.layer.cornerRadius = profileImg.frame.size.width / 2
        
        // keep the profile img and showcase img encased within borders
        
        profileImg.clipsToBounds = true
        showcaseImg.clipsToBounds  = true
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
