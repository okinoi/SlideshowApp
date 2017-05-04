//
//  PhotoViewController.swift
//  SlideshowApp
//
//  Created by 沖井広行 on 2017/05/02.
//  Copyright © 2017年 hiroyuki.okinoi. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    
    @IBOutlet weak var fullphotoview: UIImageView!
    var page=0
    var images:[UIImage]=[]

    override func viewDidLoad() {
    
        super.viewDidLoad()
        images.append(UIImage.init(named: "007a.jpg")!)
        images.append(UIImage.init(named: "009a.jpg")!)
        images.append(UIImage.init(named: "012a.jpg")!)
        
        fullphotoview.image=images[self.page]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
