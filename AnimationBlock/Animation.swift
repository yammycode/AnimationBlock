//
//  Animation.swift
//  AnimationBlock
//
//  Created by Anton Saltykov on 13.09.2022.
//

import SpringAnimation
import Foundation

struct Animation {
    let preset: AnimationPreset
    let curve: AnimationCurve
    let force: Double
    let duration: Double
    let delay: Double

    var description: String {
        """
preset: \(preset)
curve: \(curve)
force: \(force)
duration: \(duration)
delay: \(delay)
"""
    }

    static func getAnimation() -> Animation? {
        guard let animationPreset = AnimationPreset.allCases.shuffled().first,
              let animetionCurve = AnimationCurve.allCases.shuffled().first else { return nil }

        return Animation(preset: animationPreset,
                         curve: animetionCurve,
                         force: getRandomDouble(between: 0, and: 1),
                         duration: getRandomDouble(between: 0, and: 2),
                         delay: getRandomDouble(between: 0, and: 1))
    }

    private static func getRandomDouble(between min: Double, and max: Double) -> Double {
        let randomValue = Double.random(in: min...max)
        return Double(round(100 * randomValue) / 100)
    }
}
