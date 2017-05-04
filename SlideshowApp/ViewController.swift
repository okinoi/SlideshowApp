//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 沖井広行 on 2017/05/01.
//  Copyright © 2017年 hiroyuki.okinoi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var AutoButton: UIButton!
    @IBOutlet weak var ModoruButton: UIButton!
    @IBOutlet weak var SusumuButton: UIButton!
    
   
    @IBOutlet weak var ForSlideShow: UIImageView!
        
    
    var page = 0;
    var images:[UIImage]=[];
    var bAuto:Bool=false;
    var timer:Timer!

    
    
    @IBAction func Tap(_ sender: Any) {
        if(bAuto){
            bAuto=false
            timer.invalidate();
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let localphotoViewController:PhotoViewController=segue.destination as! PhotoViewController
        localphotoViewController.page=self.page;
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        images.append(UIImage.init(named: "007a.jpg")!);
        images.append(UIImage.init(named: "009a.jpg")!);
        images.append(UIImage.init(named: "012a.jpg")!);
        
        ForSlideShow.image=images[page]
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Auto(_ sender: Any) {
        if(bAuto){
            bAuto=false;
            self.AutoButton.setTitle("再生", for: UIControlState.normal)
            
            self.ModoruButton.isEnabled=true
            self.SusumuButton.isEnabled=true
            timer.invalidate();
            
        }else{
            self.ModoruButton.isEnabled=false
            self.SusumuButton.isEnabled=false
            bAuto=true;
            self.AutoButton.setTitle("停止", for: UIControlState.normal)
            timer=Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
            

        }
        
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        
    }
    func updateTimer(timer: Timer) {
        subSusumu()
        
    }
    @IBAction func Modoru(_ sender: Any) {
        page-=1;
        if(page<0){
            page=images.count-1;
        }
         ForSlideShow.image=images[page];
    }
    @IBAction func Susumu(_ sender: Any) {
        subSusumu()
    }
    func subSusumu(){
        page+=1;
        if( page>=images.count){
            page=0;
        }
        ForSlideShow.image=images[page];
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

