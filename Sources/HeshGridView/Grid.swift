//
//  Grid.swift
//  Memorize
//
//  Created by Heshan Yodagama on 10/4/20.
//  Copyright © 2020 Heshan Yodagama. All rights reserved.
//

import SwiftUI

@available(iOS 13, *)
struct Grid<Item ,ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var itemView: (Item) -> ItemView
    
    init(_ item: [Item], itemView: @escaping (Item) -> ItemView) {
        self.items = item
        self.itemView = itemView
    }
    
    var body: some View {
        GeometryReader { (proxy) in
            body(for: GridLayout(itemCount: items.count, in: proxy.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { (item)  in
            body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View{
        let index = items.firstIndex(matching: item)!
        return itemView(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
}
