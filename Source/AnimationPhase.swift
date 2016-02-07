//
//  AnimationPhase.swift
//  iOS_Sandbox_Swift
//
//  Created by Adam E. Haubenstock on 2/5/16.
//  Copyright © 2016 Adam E. Haubenstock. All rights reserved.
//

import UIKit

class AnimationPhase : Chainable {
    
    private let duration : D
    private let animations : A
    private var delayedPhases : [DelayedAnimationPhase]
    private var subsequentPhases : [AnimationPhase]
    private var completionBlock : C?
    
    init(duration : D, animations : A) {
        self.duration = duration
        self.animations = animations
        self.subsequentPhases = []
        self.delayedPhases = []
    }
    
    func execute() {
        self.executeDelayedPhases()
        UIView.animateWithDuration(self.duration, animations: self.animations) {
            _ in
            // Upon completion
            self.executeSubsequentPhases()
            self.completionBlock?()
        }
    }
    
    /// Appends AnimationBlock delayed operation to the animation phase then returns the new operation
    func afterDelay(seconds delay : AnimationDuration, animateWithDuration duration : AnimationDuration, animations : AnimationBlock) -> Chainable {
        let delayedPhase = DelayedAnimationPhase(delay: delay, duration: duration, animations: animations)
        self.appendDelayedPhase(delayedPhase)
        return delayedPhase
    }
    
    /// Appends AnimationBlock delayed operation to the animation phase then returns the phase
    func addDelayedAnimation(delay delay : AnimationDuration, duration : AnimationDuration, animations : AnimationBlock) -> Chainable {
        let delayedPhase = DelayedAnimationPhase(delay: delay, duration: duration, animations: animations)
        self.appendDelayedPhase(delayedPhase)
        return self
    }
    
    /// Appends AnimationBlock subsequent operation to the animation phase then returns the new operation
    func thenAnimateWithDuration(duration : AnimationDuration, animations : AnimationBlock) -> Chainable {
        let subsequentPhase = AnimationPhase(duration: duration, animations: animations)
        self.appendSubsequentPhase(subsequentPhase)
        return subsequentPhase
    }
    
    /// Appends AnimationBlock subsequent operation to the animation phase then returns the phase
    func addSubsequentAnimation(duration duration : AnimationDuration, animations : AnimationBlock) -> Chainable {
        let subsequentPhase = AnimationPhase(duration: duration, animations: animations)
        self.appendSubsequentPhase(subsequentPhase)
        return self
    }
    
    func uponCompletion(completionBlock : CompletionBlock) {
        self.completionBlock = completionBlock
    }
    
    private func appendDelayedPhase(phase : DelayedAnimationPhase) {
        delayedPhases.append(phase)
    }
    
    private func appendSubsequentPhase(phase : AnimationPhase) {
        subsequentPhases.append(phase)
    }
    
    private func executeDelayedPhases() {
        for phase in self.delayedPhases {
            phase.execute()
        }
    }
    
    private func executeSubsequentPhases() {
        for phase in self.subsequentPhases {
            phase.execute()
        }
    }
}

