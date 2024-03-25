//
//  ExchangeDTO.swift
//
//
//  Created by 남유성 on 3/25/24.
//

import Foundation

struct ExchangeFromKoreanEximDTO: Codable {
    
    /// 조회결과) 1 : 성공, 2 : DATA코드 오류, 3 : 인증코드 오류, 4 : 일일제한횟수 마감
    let result: Int?
    
    /// 통화코드
    let curUnit: String?
    
    /// 국가/통화명
    let curNm: String?
    
    /// 전신환(송금) 받으실때
    let ttb: String?
    
    /// 전신환(송금) 보내실때
    let tts: String?
    
    /// 매매 기준율
    let dealBasR: String?
    
    /// 장부가격
    let bkpr: String?
    
    /// 년환가료율
    let yyEfeeR: String?
    
    /// 10일환가료율
    let tenDDEfeeR: String?
    
    /// 서울외국환중개 매매기준율
    let kftcBkpr: String?
    
    /// 서울외국환중개 장부가격
    let kftcDealBasR: String?
    
    enum CodingKeys: String, CodingKey {
        case result
        case curUnit = "cur_unit"
        case ttb, tts
        case dealBasR = "deal_bas_r"
        case bkpr
        case yyEfeeR = "yy_efee_r"
        case tenDDEfeeR = "ten_dd_efee_r"
        case kftcBkpr = "kftc_bkpr"
        case kftcDealBasR = "kftc_deal_bas_r"
        case curNm = "cur_nm"
    }
    
    func toCurrency() -> Currency {
        Currency(
            unit: curUnit ?? "",
            unitInKorean: curNm?.components(separatedBy: " ").last ?? "",
            exchangeRate: Double(tts ?? "0") ?? 0
        )
    }
}
