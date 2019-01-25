// Copyright © 2019 OrganizationX.
// All rights reserved.
/**********************************************************\
 * PROJECTNAME:  Algo
 * FILENAME:     BestTimeToBuyAndSellStock.swift
 * AUTHER:       ColaBean
 * CREATE TIME:  2019/1/25
 * MODIFY TIME:
 * DES: https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock/
 \**********************************************************/
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    guard !prices.isEmpty else {
        return 0
    }
    
    var max = 0
    for i in 0..<prices.count-1 {
        for j in i+1..<prices.count {
                let m = prices[j] - prices[i]
                if max < m {
                    max = m
                }
        }
    }
    return max
}

func maxProfit2(_ prices: [Int]) -> Int {
    var minprice = Int.max
    var maxprofit = 0
    for price in prices {
        if price < minprice {
            minprice = price
        } else if price - minprice > maxprofit {
            maxprofit = price - minprice
        }
        
    }
    return maxprofit
}

func maxProfit3(_ prices: [Int]) -> Int {
    return calculate(prices: prices, s: 0)
}

private func calculate(prices: [Int], s: Int) -> Int {
    guard s < prices.count else {
        return 0
    }
    var max = 0
    for start in s..<prices.count {
        var maxProfit = 0
        for i in start+1..<prices.count {
            if prices[start] < prices[i] {
                let profit = calculate(prices: prices, s: i+1) + (prices[i] - prices[start])
                if profit > maxProfit {
                    maxProfit = profit
                }
            }
        }
        if maxProfit > max {
            max = maxProfit
        }
    }
    
    return max
}

func maxProfit4(_ prices: [Int]) -> Int {
    var i = 0
    var valley = prices.first
    var peak = prices.first
    var maxProfit = 0
    while i < prices.count - 1 {
        while i < prices.count - 1 && prices[i] >= prices[i+1] {
            i += 1
        }
        valley = prices[i]
        while i < prices.count - 1 && prices[i] <= prices[i+1] {
            i += 1
        }
        peak = prices[i]
        maxProfit += (peak! - valley!)
    }
    
    return maxProfit
    
}

func maxProfit5(_ prices: [Int]) -> Int {
    var max = 0
    for i in 1..<prices.count {
        if prices[i] > prices[i-1] {
            max += prices[i] - prices[i-1]
        }
    }
    
    return max
}
