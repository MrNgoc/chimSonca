//
//  ViewController.swift
//  chimSonca
//
//  Created by Admin on 6/1/16.
//  Copyright © 2016 MrNgoc. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var bird = UIImageView()
    var audio = AVAudioPlayer()
    override func viewDidLoad() {
        super.viewDidLoad()
        drawjungle()
        addbird()
        flyUpAndDown()
        play()
    
    }
    func drawjungle() {
    
        let background = UIImageView(image: UIImage(named:"jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .ScaleAspectFill
        self.view.addSubview(background)
        
    }
 
    func addbird() {
        bird = UIImageView(frame: CGRectMake(0, 0, 110 , 68))
        bird.animationImages = [UIImage(named:"bird0.png")!, UIImage(named:"bird1.png")!, UIImage(named:"bird2.png")!,UIImage(named:"bird3.png")!, UIImage(named:"bird4.png")!, UIImage(named:"bird5.png")!]
        
        
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
        
        
        
    }
    func flyUpAndDown() {
        
        self.bird.transform = CGAffineTransformIdentity
        self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, 1, 1),CGAffineTransformMakeRotation(CGFloat(M_PI_4)))
        
        UIView.animateWithDuration(2, animations: {

            self.bird.center = CGPointMake(self.view.bounds.size.width - 25 , self.view.bounds.size.height - 25)
            
        }) {(finished) in
            
            self.bird.transform = CGAffineTransformIdentity
            self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, -1, 1),CGAffineTransformMakeRotation(15 / 180 * CGFloat(M_PI)))
            
            UIView.animateWithDuration(2, animations: {
                self.bird.center = CGPointMake( 25 ,self.view.bounds.size.height - 25)
                
            }) { (finished) in
                
                self.bird.transform = CGAffineTransformIdentity
                self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform, 1, 1),CGAffineTransformMakeRotation(CGFloat(-M_PI_4)))
                
                UIView.animateWithDuration(2, animations: {
                    self.bird.center = CGPointMake(self.view.bounds.size.width - 25, 25)
                    
                })  { (finished) in
                    
                    self.bird.transform = CGAffineTransformIdentity
                    self.bird.transform = CGAffineTransformConcat(CGAffineTransformScale(self.bird.transform,-1, 1),CGAffineTransformMakeRotation(15 / 180 * CGFloat(M_PI)))
                    
                    UIView.animateWithDuration(2, animations: {
                        self.bird.center = CGPointMake( 25 , 25)
                        
                        
                    }) {(finished) in
                        
                        self.flyUpAndDown()
                        
                    
                    }
                    
                    
                }
            }}
        
        
    }
    func play() {
        let filePath = NSBundle.mainBundle().pathForResource("A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = NSURL(fileURLWithPath: filePath!)
        audio = try!AVAudioPlayer(contentsOfURL: url)
        audio.prepareToPlay()
        audio.play()
    }
    
    
}