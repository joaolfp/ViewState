//
//  JSONHelper.swift
//  SampleTests
//
//  Created by Joao Lucas on 21/11/20.
//

import Foundation

private class BundleTestClass {}

enum JSONHelper {

    static func load<Element: Decodable>(withFile fileName: String) -> Element? {
        var jsonData: Element?
        if let url = Bundle(for: BundleTestClass.self).url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                jsonData = try decoder.decode(Element.self, from: data)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return jsonData
    }

    static func loadData(withFile fileName: String) -> Data? {
        var data: Data?
        if let url = Bundle(for: BundleTestClass.self).url(forResource: fileName, withExtension: "json") {
            do {
                data = try Data(contentsOf: url)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return data
    }
}
