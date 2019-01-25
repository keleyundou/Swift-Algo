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
