//
//  StudyModel.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/27.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class StudyModel: NSObject {

    
    var data:dataModel?
    var res:NSNumber?
    
    class func parseData(data:NSData)->StudyModel{
    
        let json=JSON(data: data)
        //print(json)
        let model=StudyModel()
        model.res=json["res"].number
        model.data=dataModel.paraseModel(json["data"])
        
        
        return model
    }
}


class dataModel:NSObject{

    var nonus:nonusModel?
    var recommend:recommendModel?
    var topic:topicModel?

    class func paraseModel(json:JSON)->dataModel{
    
        let model=dataModel()
        model.nonus=nonusModel.paraseModel(json)
        model.recommend=recommendModel.paraseModel(json)
        model.topic=topicModel.paraseModel(json)
        return model
        
    }
    
    
}


class nonusModel:NSObject{
    var nonusArray:[nonusDetailModel]?
    class func paraseModel(json:JSON)->nonusModel{

        let model=nonusModel()
        var array:[nonusDetailModel]=[]
        for (_,subJson):(String,JSON) in json["nonus"]{
        
            let nonusmodel=nonusDetailModel.ParaseModel(subJson)
            array.append(nonusmodel)
        }
        model.nonusArray=array
        return model
    }

    
    
    
}

class nonusDetailModel: NSObject {
    var allClick:String?
    var classifyname:String?
    var code:NSNumber?
    var commentCount:NSNumber?
    var img:String?
    var isUrl:String?
    var title:String?
    
    class func ParaseModel(json:JSON)->nonusDetailModel{
    
        let model=nonusDetailModel()
        model.allClick=json["allClick"].string
        model.classifyname=json["classifyname"].string
        model.code=json["code"].number
        model.commentCount=json["commentCount"].number
        model.img=json["img"].string
        model.isUrl=json["isUrl"].string
        model.title=json["title"].string
        return model
    }
}

class recommendModel:NSObject{

    var recommend:[recommendDetailModel]?
    
    class func paraseModel(json:JSON)->recommendModel{
        let recommendmodel=recommendModel()
        var array:[recommendDetailModel]=[]
        for (_,subjson):(String,JSON) in json["recommend"]{
        
            let model=recommendDetailModel.paraseModel(subjson)
            array.append(model)
        }
    recommendmodel.recommend=array
        return recommendmodel
        
    }
    
}

class recommendDetailModel:NSObject{

    var date:String?
    var img:String?
    var list:[listDetailModel]?
    var time:String?
    var title:String?
    var type:NSNumber?
    var url:String?
    
    class func paraseModel(json:JSON)->recommendDetailModel{
    
        let model=recommendDetailModel()
        model.date=json["date"].string
        model.img=json["img"].string
        model.time=json["time"].string
        model.title=json["title"].string
        model.type=json["type"].number
        model.url=json["url"].string
        var array:[listDetailModel]=[]
        for (_,subjson):(String,JSON) in json["list"]{
        
            
            let model=listDetailModel.paraseModel(subjson)
            array.append(model)
        }
        model.list=array
        return model
        
    }
    
}


class listDetailModel:NSObject{

    var hasVideo:String?
    var img:String?
    
    class func paraseModel(json:JSON)->listDetailModel{
    
        let model=listDetailModel()
        model.hasVideo=json["hasVideo"].string
        model.img=json["img"].string
        return model
        
    }
    
}


class topicModel:NSObject{

    var topic:[topicDetailModel]?
    
    class func paraseModel(json:JSON)->topicModel{
    let topicmodel=topicModel()
        var array:[topicDetailModel]=[]
        for (_,subjson):(String,JSON) in json["topic"]{
        
            let model=topicDetailModel.paraseModel(subjson)
            array.append(model)
            
        }
        topicmodel.topic=array
        return topicmodel
        
    }
}


class topicDetailModel:NSObject{

    var desc:String?
    var imgs:String?
    var subtitle:String?
    var title:String?
    var url:String?
    
    class func paraseModel(json:JSON)->topicDetailModel{
    
        let model=topicDetailModel()
        model.desc=json["desc"].string
        model.imgs=json["imgs"].string
        model.subtitle=json["subtitle"].string
        model.title=json["title"].string
        model.url=json["ulr"].string
        return model
        
        
    }
    
}









