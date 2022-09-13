//
//  MainViewController.swift
//  AnimationBlock
//
//  Created by Anton Saltykov on 13.09.2022.
//

import UIKit
import SpringAnimation

final class MainViewController: UIViewController {


    @IBOutlet var blockView: SpringView!
    @IBOutlet var animationInfoLabel: UILabel!
    
    private var currentAnimation: Animation?
    private var nextAnimation: Animation!

    override func viewDidLoad() {
        setNextAnimation()
    }


    @IBAction func animateBlock(_ sender: UIButton) {
        currentAnimation = nextAnimation
        animationInfoLabel.text = currentAnimation?.description ?? ""
        setNextAnimation()
        sender.setTitle(nextAnimation.preset.rawValue, for: .normal)
        runAnimation()
    }

    private func setNextAnimation() {
        guard let animation = Animation.getAnimation() else { return }
        nextAnimation = animation
    }

    private func runAnimation() {

        blockView.animation = currentAnimation?.preset.rawValue ?? ""
        blockView.curve = currentAnimation?.curve.rawValue ?? ""
        blockView.force = CGFloat(currentAnimation?.force ?? 0)
        blockView.duration = CGFloat(currentAnimation?.duration ?? 0)
        blockView.delay = CGFloat(currentAnimation?.delay ?? 0)
        blockView.animate()
    }
    
}
