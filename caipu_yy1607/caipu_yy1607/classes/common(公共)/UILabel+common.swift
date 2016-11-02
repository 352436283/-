//
//  UILabel+common.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import Foundation
import UIKit

extension UILabel{

    class func createLabel(title:String?,Aligent:NSTextAlignment?,font:UIFont?)->UILabel{
    
        let label=UILabel()
        if let tmpTitle=title{
        label.text=tmpTitle
        }
        if let tmpA=Aligent{
        
            label.textAlignment=tmpA
        }
        if let tmpF=font{
        
            label.font=tmpF
        }
        return label
    }
}