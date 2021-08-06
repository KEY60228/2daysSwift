//
//  OkashiData.swift
//  Okashi
//
//  Created by 山口健太 on 2021/08/06.
//

import Foundation

class OkashiData: ObservableObject {
    func searchOkashi(keyword: String) {
        print(keyword)
        
        // お菓子のキーワードをURLエンコードする
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }
        
        // リクエストURLの組み立て
        guard let req_url = URL(string: "https://sysbird.jp/toriko/api/?apikey=guest&format=json&keyword=\(keyword_encode)&max=10&order=r") else {
            return
        }
        
        print(req_url)
    }
}
