//
//  TempConverter.swift
//  TempConverter
//
//  Created by gil on 02/11/2017.
//  Copyright © 2017 Gilles Vanwormhoudt. All rights reserved.
//

import Foundation


class TempConverter {
    
    
    public func convertFtoC(value:Float) -> Float {
        return ((value - 32) * 5 / 9);
    }
    
    public func convertCtoF(value:Float) -> Float {
        return ((value * 9) / 5) + 32
    }

    
}
