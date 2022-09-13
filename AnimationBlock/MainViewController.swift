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
        sender.setTitle(nextAnimation.preset, for: .normal)
        runAnimation()
    }

    private func setNextAnimation() {
        guard let animation = getAnimation() else { return }
        nextAnimation = animation
    }

    private func runAnimation() {

        blockView.animation = currentAnimation?.preset ?? ""
        blockView.curve = currentAnimation?.curve ?? ""
        blockView.force = CGFloat(currentAnimation?.force ?? 0)
        blockView.duration = CGFloat(currentAnimation?.duration ?? 0)
        blockView.delay = CGFloat(currentAnimation?.delay ?? 0)
        blockView.animate()
    }

    private func getAnimation() -> Animation? {
        guard let animationPreset = AnimationPreset.allCases.shuffled().first,
              let animetionCurve = AnimationCurve.allCases.shuffled().first else { return nil }

        return Animation(preset: animationPreset.rawValue,
                         curve: animetionCurve.rawValue,
                         force: getRandomDouble(between: 0, and: 1),
                         duration: getRandomDouble(between: 0, and: 2),
                         delay: getRandomDouble(between: 0, and: 1))
    }

    private func getRandomDouble(between min: Double, and max: Double) -> Double {
        let randomValue = Double.random(in: min...max)
        return Double(round(100 * randomValue) / 100)
    }
    
}
