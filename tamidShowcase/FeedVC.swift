//
//  FeedVC.swift
//  tamidShowcase
//
//  Created by H on 5/31/16.
//  Copyright © 2016 H. All rights reserved.
//

import UIKit
import Firebase

class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // anytime data is changed or added app will sync automatically
        
        DataService.ds.REF_POSTS.observeEventType(.Value, withBlock: {snapshot in
            print(snapshot.value)
            
            self.posts = []
            
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                
                for snap in snapshots {
                    print("SNAP: \(snap)")
                    
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let post = Post(postKey: key, dictionary: postDict)
                        self.posts.append(post)
                    }
                }
            }
            
            self.tableView.reloadData() //reload anytime there is new data
        })
        
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row] // for each post let there be another cell
        print(post.postDescription)
        
        
        return tableView.dequeueReusableCellWithIdentifier("PostCell") as! PostCell
    }
    
}
