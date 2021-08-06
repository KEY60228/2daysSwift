//
//  OkashiData.swift
//  Okashi
//
//  Created by 山口健太 on 2021/08/06.
//

import Foundation
import UIKit

// Identifiableプロトコルを利用して、お菓子の情報をまとめる構造体
struct OkashiItem: Identifiable {
    let id = UUID()
    let name: String
    let link: URL
    let image: UIImage
}

class OkashiData: ObservableObject {
    // JSONのデータ構造
    struct ResultJson: Codable {
        struct Item: Codable {
            let name: String?
            let url: URL?
            let image: URL?
        }
        let item: [Item]?
    }

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
        
        // リクエストに必要な情報を生成
        let req = URLRequest(url: req_url)
        // データ転送を管理するためのセッションを生成
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        // リクエストをタスクとして登録
        let task = session.dataTask(with: req, completionHandler: {(data, response, error) in
            // セッションを終了
            session.finishTasksAndInvalidate()
            // do try catch エラーハンドリング
            do {
                // JSONDecorderのインスタンス取得
                let decoder = JSONDecoder()
                // 受け取ったJSONデータをパースして格納
                let json = try decoder.decode(ResultJson.self, from: data!)
                print(json)
            } catch {
                print("エラーが出ました")
            }
        })
        // ダウンロード開始
        task.resume()
        
        print(req_url)
    }
}
