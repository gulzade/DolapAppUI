//
//  Product.swift
//  DolapApp
//
//  Created by Gülzade Karataş on 25.08.2022.
//

import Foundation

class Product {
    
    var productImage: String?
    var productName:String?
    var productPrice: String?
    var productSize:String?
    
    init(productImage: String , productName:String?, productPrice: String, productSize: String) {
        self.productImage = productImage
        self.productName = productName
        self.productPrice = productPrice
        self.productSize = productSize
    }
}
