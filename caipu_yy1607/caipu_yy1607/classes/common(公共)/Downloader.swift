//
//  Downloader.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/28.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser

protocol DownloadDelegate:NSObjectProtocol {
    func download(downloader:Downloader,didFailedWitnError error:NSError?)
    func download(downloader:Downloader,didFinishedWitnData data:NSData?)
}

enum downloadType:Int{
    
    case normal=1
    case StudyModel
    case StudyCaiPuModel
}
class Downloader: NSObject {
    
    var type:downloadType = .normal
    weak var delegate:DownloadDelegate?
    
    func downloadWithUrl(url:NSURL){
    
        Alamofire.request(.GET, url).responseData{
            (response) in
            switch response.result{
            
            case .Failure(let error):
                self.delegate?.download(self, didFailedWitnError: error)
                
            case .Success:
                self.delegate?.download(self, didFinishedWitnData: response.data)
                
            }
   
            
        }
    }
    
    
}
