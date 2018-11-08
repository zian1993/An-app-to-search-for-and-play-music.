//
//  String.swift
//  App 4_HK
//
//  Created by Hassan Khan on 11/1/18.
//  Copyright © 2018 Hassan Khan. All rights reserved.
//

import Foundation

extension String
{
    func substring(start: Int, end: Int) -> String
    {
        if (start == end || self.length() == 0)
        {
            return ""
        }
        let startIndex = self.index(self.startIndex, offsetBy: start)
        let endIndex = self.index(self.startIndex, offsetBy: end)
        return self[startIndex..<endIndex]
    }
    
    func length() -> Int
    {
        return self.characters.count
    }
    
    func index(of string: String) -> Index?
    {
        let options: CompareOptions = .caseInsensitive
        return range(of: string, options: options)?.lowerBound
    }
    func endIndex(of string: String) -> Index?
    {
        let options: CompareOptions = .caseInsensitive
        return range(of: string, options: options)?.upperBound
    }
    func indexes(of string: String) -> [Index]
    {
        let options: CompareOptions = .caseInsensitive
        var result: [Index] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range.lowerBound)
            start = range.upperBound
        }
        return result
    }
    func ranges(of string: String, options: CompareOptions = .literal) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var start = startIndex
        while let range = range(of: string, options: options, range: start..<endIndex) {
            result.append(range)
            start = range.upperBound
        }
        return result
    }
    
}
