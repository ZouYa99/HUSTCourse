//
//  Network.swift
//  StickerCustom
//
//  Created by ljk on 2021/12/16.
//

import Foundation

/// 网络请求返回状态
enum NetworkError : Error{
    /// 读取API的配置错误
    ///
    /// subspec或者function错误，导致无法读取到API
    case badConfig
    /// 无网络
    ///
    /// Reachability失败时直接会触发这个
    case noNetWork
    /// 请求失败
    ///
    /// 与服务器通信存在问题
    case requestFail
    /// 解码失败
    ///
    /// json转结构体失败
    case decodeError
}

enum NetworkResult<T> {
    case success(T)
    case failure(NetworkError)
}

struct BackDataWrapper<T: Codable>: Codable {
    var code: Int
    var msg: String
    var data: T?

    enum CodingKeys: String, CodingKey {
        case code
        case msg
        case data
    }

    // 重写decode
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        code = try container.decode(Int.self, forKey: .code)
        msg = try container.decode(String.self, forKey: .msg)
        // data如果解析失败，仅置空即可
        data = try? container.decode(T.self, forKey: .data)
    }
}

struct CommonBackData: Codable {

}
