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
//                Text(listItemData.date)
//                    .font(.callout)
//                    .lineLimit(1)
//                    .foregroundColor(.secondary)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(listItemData.value)
                    .font(.callout)
                    .lineLimit(1)
                    .foregroundColor(.primary)
//                Color.blue
//                    .frame(width: 40.0, height: listItemData.height)
//                    .cornerRadius(4.0)
//                    .opacity(listItemData.opacity)
            }
        }
    }
}

struct ListItemData {
    var title: String
    var description: String
    var value: String
    var date: String
    var height: CGFloat
    var opacity: Double
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(list: previewList)
    }
    
    static var previewList: [ListItemData] {
        var list = [ListItemData]()
        let formatter = DateFormatter()
        formatter.timeStyle = .none
        formatter.dateStyle = .medium
        let length = 10
        for i in 0...length {
            let date = Date(timeIntervalSinceNow: TimeInterval(60*60*24*28*i))
            let data = ListItemData(
                title: String(repeating: "this is title", count: i),
                description: String(repeating: "description", count: i),
                value: "\(pow(10, i))",
                date: formatter.string(from: date),
                height: CGFloat(i),
//                height: CGFloat(i*4%20+8),
                opacity: 1.0
//                opacity: Double(i)/Double(length)
//                opacity: Double(i%4)/Double(4)
            )
            list.append(data)
        }
        
        return list
    }
}
