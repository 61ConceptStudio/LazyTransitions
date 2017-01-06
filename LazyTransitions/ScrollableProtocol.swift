//
//  ScrollableProtocol.swift
//  Wadi
//
//  Created by Serghei Catraniuc on 1/2/17.
//  Copyright © 2017 YOPESO. All rights reserved.
//

import Foundation

public protocol Scrollable: class {
    var isAtTop: Bool { get }
    var isAtBottom: Bool { get }
    var isAtLeftEdge: Bool { get }
    var isAtRightEdge: Bool { get }
    var isSomeWhereInVerticalMiddle: Bool { get }
    var isSomeWhereInHorizontalMiddle: Bool { get }
    var bounces: Bool { get set }
}

extension Scrollable {
    public var possibleVerticalOrientation: TransitionOrientation {
        return isAtTop ? .topToBottom : .bottomToTop
    }
    
    public var possibleHorizontalOrientation: TransitionOrientation {
        return isAtLeftEdge ? .leftToRight : .rightToLeft
    }
    
    public var scrollsHorizontally: Bool {
        return !(isAtRightEdge && isAtLeftEdge)
    }
    
    public var scrollsVertically: Bool {
        return !(isAtTop && isAtBottom)
    }
}