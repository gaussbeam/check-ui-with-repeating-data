//
//  ContentView.swift
//  check-ui-with-repeating-data
//
//  Created by HANYU, Koji on 2023/09/08.
//

import SwiftUI

struct ContentView: View {
    var list: [ListItemData]

    var body: some View {
        List {
            ForEach(list, id: \.title, content: { data in
                listItem(listItemData: data)
            })
        }
    }
    
    private func listItem(listItemData: ListItemData) -> some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading) {
                Text(listItemData.title)
                    .font(.title3).bold()
                    .lineLimit(2)
                    .foregroundColor(.primary)
                Text(listItemData.description)
                    .font(.callout)
                    .lineLimit(1)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(listItemData.value)
                .font(.callout)
                .lineLimit(1)
                .foregroundColor(.primary)
        }
    }
}

struct ListItemData {
    var title: String
    var description: String
    var value: String
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(list: previewList)
    }
    
    static var previewList: [ListItemData] {
        var list = [ListItemData]()
        for i in 0..<9 {
            let data = ListItemData(
                title: String(repeating: "this is title", count: i),
                description: String(repeating: "description", count: i),
                value: "\(pow(10, i))"
            )
            list.append(data)
        }
        
        return list
    }
}
