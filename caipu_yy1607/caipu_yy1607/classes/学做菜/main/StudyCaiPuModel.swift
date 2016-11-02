//
//  StudyCaiPuModel.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit
import SwiftyJSON

class StudyCaiPuModel: NSObject {
    var data:DataModel?
    var res:NSNumber?
    
    class func paraseData(data:NSData)->StudyCaiPuModel{
    
        let model=StudyCaiPuModel()
        let json=JSON(data:data)
        model.data=DataModel.paraseModel(json["data"])
        model.res=json["res'"].number
        return model
    }

}

class DataModel:NSObject{

    var caipu:CaiPuModel?
    var jiankang:JianKangModel?
    
    class func paraseModel(json:JSON)->DataModel{
    
        let model=DataModel()
        model.caipu=CaiPuModel.paraseModel(json["caipu"])
        model.jiankang=JianKangModel.paraseModel(json["jiankang"])
        return model
    }
    
}

class CaiPuModel:NSObject{

    var CaiPuArray:[CaiPuDetailModel]?
    class func paraseModel(json:JSON)->CaiPuModel{
    
        let model=CaiPuModel()
        var array:[CaiPuDetailModel]=[]
        for (_,subjson):(String,JSON) in json{
        
            let model=CaiPuDetailModel.paraseModel(subjson)
            array.append(model)
        }
        model.CaiPuArray=array
        return model
    }
}

class CaiPuDetailModel: NSObject {
    var name:String?
    var tags:TagsModel?
    
    class func paraseModel(json:JSON)->CaiPuDetailModel{
    
        let model=CaiPuDetailModel()
        model.name=json["name"].string
        model.tags=TagsModel.paraseModel(json["tags"])
        return model
    }
}

class TagsModel:NSObject{
    var array:[TagsDetailModel]?
    class func paraseModel(json:JSON)->TagsModel{
    
        let model=TagsModel()
        var array:[TagsDetailModel]=[]
        for(_,subjson):(String,JSON) in json{
            
        
            
            let model=TagsDetailModel.paraseModel(subjson)
            array.append(model)
            
        }
        model.array=array
        return model
    }

    
}

class TagsDetailModel:NSObject{
    var data:TagsDataModel?
    var name:String?
    class func paraseModel(json:JSON)->TagsDetailModel{
    
        let model=TagsDetailModel()
        model.data=TagsDataModel.paraseModel(json["data"])
        model.name=json["name"].string
        return model
    }

 
}

class TagsDataModel:NSObject{
    var array:[TagsDataDetailModel]?
    class func paraseModel(json:JSON)->TagsDataModel{
    
        var array:[TagsDataDetailModel]=[]
        let model=TagsDataModel()
        for (_,subjson):(String,JSON) in json{
        
            let model=TagsDataDetailModel.paraseModel(subjson)
            array.append(model)
        }
        model.array=array
        return model
        
    }

    
}

class TagsDataDetailModel:NSObject{

    var name:String?
    var url:String?
    class func paraseModel(json:JSON)->TagsDataDetailModel{
    
        let model=TagsDataDetailModel()
        model.name=json["name"].string
        model.url=json["url"].string
        return model
    }
}


class JianKangModel:NSObject{

    var array:[JianKangDetailModel]?
    class func paraseModel(json:JSON)->JianKangModel{
    
        var array:[JianKangDetailModel]=[]
        let model=JianKangModel()
        for (_,subjson):(String,JSON) in json{
        
            let model=JianKangDetailModel.paraseModel(subjson)
            array.append(model)
        }
        model.array=array
        return model
    }
}

class JianKangDetailModel:NSObject{

    var name:String?
    var tags:JianKangTagsModel?
    class func paraseModel(json:JSON)->JianKangDetailModel{
    
        let model=JianKangDetailModel()
        model.name=json["name"].string
        model.tags=JianKangTagsModel.paraseModel(json["tags"])
        return model
        
    }
}


class JianKangTagsModel:NSObject{
    var array:[JianKangTagsDetailModel]?
    
    class func paraseModel(json:JSON)->JianKangTagsModel{
    
        let model=JianKangTagsModel()
        var array:[JianKangTagsDetailModel]=[]
        for (_,subjson):(String,JSON) in json{
        
            let model=JianKangTagsDetailModel.paraseModel(subjson)
            array.append(model)
        }
        model.array=array
        return model
        
    }

    
    
}

class JianKangTagsDetailModel:NSObject{

    var data:JianKangTagDataModel?
    var name:String?
    
    class func paraseModel(json:JSON)->JianKangTagsDetailModel{
    
        let model=JianKangTagsDetailModel()
        model.data=JianKangTagDataModel.paraseModel(json["data"])
        model.name=json["name"].string
        return model
    }
}

class JianKangTagDataModel:NSObject{
    var array:[JianKangTagDataDetailModel]?
    
    class func paraseModel(json:JSON)->JianKangTagDataModel{
    
        let model=JianKangTagDataModel()
        var array:[JianKangTagDataDetailModel]=[]
        for (_,subjson):(String,JSON) in json{
            let model=JianKangTagDataDetailModel.paraseModel(subjson)
            array.append(model)
        
            
        }
        model.array=array
        return model
    }

    
}

class JianKangTagDataDetailModel:NSObject{

    
    var name:String?
    var url:String?
    
    class func paraseModel(json:JSON)->JianKangTagDataDetailModel{
    
        let model=JianKangTagDataDetailModel()
        model.name=json["name"].string
        model.url=json["url"].string
        return model
    }
}


