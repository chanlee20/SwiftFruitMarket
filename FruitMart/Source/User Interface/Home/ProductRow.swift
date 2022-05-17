//
//  ProductRow.swift
//  FruitMart
//
//  Created by 이찬 on 5/17/22.
//  Copyright © 2022 Giftbot. All rights reserved.
//

import SwiftUI

struct Product{
    let name: String
    let imageName: String
    let price: Int
    let description: String
    var isFavorite: Bool = false
}

let productSamples = [
    Product(name: "나는야 무화과", imageName: "fig", price: 3100, description: "소화가 잘되고 변비에 좋은 달달한 국내산 무화과에요. 고기와 찰떡궁합!"),
    Product(name: "유기농 아보카도", imageName: "avocado", price: 2900, description: "미네랄도 풍부하고, 요리 장식과 소스로도 좋은 아보카도"),
    Product(name: "나는야 바나나", imageName:  "banana", price: 2400, description: "달콤한 맛의 바나나. 이렇게 맛있으니 내가 바나나 안 바나나?", isFavorite: true)
]



struct ProductRow: View {
    let product: Product
    var body: some View {
                HStack{
                    productImage
                    productDescription
                }
                .frame(height:150)
                .background(Color.primary.colorInvert())
                .cornerRadius(6)
                .padding(.vertical, 8)
            }
    var productImage: some View{
        Image(product.imageName)
        .resizable()
            .scaledToFill()
            .frame(width: 140)
            .clipped()
    }
    var footerView: some View {
        HStack(spacing: 0){
            Text("$").font(.footnote)
            + Text("\(product.price)").font(.headline)
            Spacer()
            
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundColor((Color.peach))
                .frame(width: 32, height: 32)
            Image(systemName: "cart")
                .imageScale(.large)
                .foregroundColor((Color.peach))
                .frame(width: 32, height: 32)
        }
    }

    var productDescription: some View{
        VStack(alignment: .leading){
            Text(product.name)
                .font(.headline)
                .fontWeight(.medium)
                .padding(.bottom, 6)
            
            Text(product.description)
                .font(.footnote)
                .foregroundColor(.secondary)
            Spacer()
            
            footerView
        }
        .padding([.leading, .bottom], 12)
        .padding([.top, .trailing])
    }
    
    }




struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
        ProductRow(product: productSamples[0])
       
    }
}

