//
//  DelayedAnimationPhase.swift
//  iOS_Sandbox_Swift
//
//  Created by Adam E. Haubenstock on 2/5/16.
//  Copyright © 2016 Adam E. Haubenstock. All rights reserved.
//

import Foundation

class DelayedAnimationPhase : AnimationPhase {
    
    private let delay : D
    private var delayAsNanoseconds : Int64 {
        return Int64( self.delay * D(NSEC_PER_SEC) )
    }
    
    init(delay : D, duration : D, animations : A) {
        self.delay = delay
        super.init(duration: duration, animations: animations)
    }
    
    override func execute() {
        let dispatchTime = dispatch_time(DISPATCH_TIME_NOW, delayAsNanoseconds)
        dispatch_after(dispatchTime, dispatch_get_main_queue()) {
            super.execute()
        }
    }
}