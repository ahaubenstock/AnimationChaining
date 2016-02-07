//
//  AnimationChain.swift
//  AnimationChaining
//
//  Created by Adam E. Haubenstock on 2/7/16.
//  Copyright © 2016 Adam E. Haubenstock. All rights reserved.
//

import Foundation

public class AnimationChain {
    
    private let initialPhase : AnimationPhase
    public var asChainable : Chainable {
        return initialPhase
    }
    
    public init(duration : AnimationDuration, animations : AnimationBlock) {
        initialPhase = AnimationPhase(duration: duration, animations: animations)
    }
    
    public func execute() {
        initialPhase.execute()
    }
}