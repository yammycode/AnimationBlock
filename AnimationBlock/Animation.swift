//
//  Animation.swift
//  AnimationBlock
//
//  Created by Anton Saltykov on 13.09.2022.
//


struct Animation {
    let preset: String
    let curve: String
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

}
