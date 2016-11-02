//
//  TodayGoodModel.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 俞阳. All rights reserved.


import UIKit
import SwiftyJSON
let path="/Users/jerremy/Desktop/俞阳/菜谱_1607yy/caipu_yy1607/caipu_yy1607/classes/common(公共)/最新佳作.json"
var data2=NSData(contentsOfFile: path)!


class TodayGoodModel: NSObject {

    
    var data:TDataModel?
    class func paraseData(data:NSData)->TodayGoodModel{
    
        let json=JSON(data:data)
        let model=TodayGoodModel()
        model.data=TDataModel.paraseJson(json["data"])
        
        return model
   
    }
    
}

class TDataModel:NSObject{

    var todayData:todayDataModel?
    class func paraseJson(json:JSON)->TDataModel{
    
        let model=TDataModel()
        model.todayData=todayDataModel.paraseJson(json["todayData"])
        return model
    
    }
    
}



class todayDataModel:NSObject{

    var todayDataArray:[todayDataDetailModel]?
    
    class func paraseJson(json:JSON)->todayDataModel{
        let model=todayDataModel()
        var array:[todayDataDetailModel]=[]
    
        for (_,subjson):(String,JSON) in json{
        
            let model=todayDataDetailModel.paraseJson(subjson)
            array.append(model)
        }
        model.todayDataArray=array
        
        return model
        
        
    }
    
    
}


class todayDataDetailModel:NSObject{

    var code:NSNumber?
    var customers:customersModel?
    var dishTaste:String?
    var img:String?
    var name:String?
    var timeShowV43:String?
    
    class func paraseJson(json:JSON)->todayDataDetailModel{
    
        let model=todayDataDetailModel()
        model.code=json["code"].number
        model.customers=customersModel.paraseJson(json["customers"])
        model.dishTaste=json["dishTaste"].string
        model.img=json["img"].string
        model.name=json["name"].string
        model.timeShowV43=json["timeShowV43"].string
        return model
    }
}


class customersModel:NSObject{

    
    var code:NSNumber?
    var img:String?
    var isGourmet:NSNumber?
    var nickName:String?
    
    class func paraseJson(json:JSON)->customersModel{
    
        let model=customersModel()
        model.code=json["code"].number
        model.img=json["img"].string
        model.isGourmet=json["isGourmet"].number
        model.nickName=json["nickName"].string
        return model
    }
}
