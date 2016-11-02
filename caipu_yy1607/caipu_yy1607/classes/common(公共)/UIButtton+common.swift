//
//  UIButtton+common.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{

    
    class func createBtn(title: String?, bgImageName: String?, highlightImageName: String?, selectImageName: String?,target: AnyObject?, action:Selector)->UIButton{
    
        let btn=UIButton(type: .Custom)
        if let tmpTitle=title{
        
            btn.setTitle(tmpTitle, forState: .Normal)
            
        }
        if let tmpBg=bgImageName{
        
            btn.setImage(UIImage(named: tmpBg), forState: .Normal)
        }
        if let tmpH=highlightImageName{
        
            btn.setImage(UIImage(named: tmpH), forState: .Highlighted)
        }
        
        if let tmpS=selectImageName{
        
            btn.setImage(UIImage(named: tmpS), forState: .Selected)
        }
        
        if target != nil && action != nil{
        
            btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        }
        
        
        return btn
    }
}