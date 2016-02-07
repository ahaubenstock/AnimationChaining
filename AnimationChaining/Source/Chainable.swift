//
//  Chainable.swift
//  AnimationChaining
//
//  Created by Adam E. Haubenstock on 2/7/16.
//  Copyright © 2016 Adam E. Haubenstock. All rights reserved.
//

import Foundation

public protocol Chainable {
    func afterDelay(seconds delay : AnimationDuration, animateWithDuration duration : AnimationDuration, animations : AnimationBlock) -> Chainable
    
    func addDelayedAnimation(delay delay : AnimationDuration, duration : AnimationDuration, animations : AnimationBlock) -> Chainable
    
    func thenAnimateWithDuration(duration : AnimationDuration, animations : AnimationBlock) -> Chainable
    
    func addSubsequentAnimation(duration duration : AnimationDuration, animations : AnimationBlock) -> Chainable
    
    func uponCompletion(completionBlock : CompletionBlock)
}
