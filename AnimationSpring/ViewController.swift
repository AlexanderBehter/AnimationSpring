//
//  ViewController.swift
//  AnimationSpring
//
//  Created by Александр Бехтер on 18.06.2020.
//  Copyright © 2020 Alexander Bekhter. All rights reserved.
//

import Spring

class ViewController: UIViewController {
    @IBOutlet var springView: SpringView!
    @IBOutlet var nameAnimationLabel: UILabel!
    @IBOutlet var buttonAnimate: UIButton!
    
    let animations = Model.getListAnimation()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        springView.customView()
        buttonAnimate.customButton()
        
    }

    @IBAction func actionSpringView(_ sender: SpringButton) {

        sender.animation = "flipX"
        sender.curve = "easeIn"
        sender.duration = 1
        sender.animate()
        
        index += 1
        changedTitleLabel()
        changedAnimations()
        changedTitleButton()
        resetCounter()
    }
    
    func changedTitleLabel() {
        nameAnimationLabel.text = animations[index].name.capitalized
    }
    
    func changedTitleButton() {
        resetCounter()
        buttonAnimate.setTitle(animations[index + 1].name.capitalized, for: .normal)
    }
    
    func changedAnimations() {
        springView.animation = animations[index].name
        springView.curve = animations[index].curve
        springView.force = CGFloat(animations[index].force)
        springView.duration = CGFloat(animations[index].duration)
        springView.animate()
    }
    
     func resetCounter() {
        if animations.count == index + 1 {
            index = 0
        }
    }
}

extension UIView {
    func customView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.shadowOpacity = 2
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    }
}
extension UIButton {
    func customButton() {
        self.layer.cornerRadius = self.frame.width / 10
        self.layer.shadowOpacity = 3
        self.layer.shadowRadius = 20
        self.layer.shadowOffset = CGSize(width: 0.0, height: 6.0)
    }
}
