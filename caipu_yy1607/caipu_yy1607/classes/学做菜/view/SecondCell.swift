//
//  SecondCell.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit

class SecondCell: UITableViewCell {
    var array:CaiPuModel?
    var jumpClosure:IngreJumpClosure?
    var caipuView:CaiPuViewController?
    var viewClosure:(AnyObject -> Void)?
    
    @IBAction func btnClick(sender: UIButton) {
        if sender.tag==100{
            
            caipuView=CaiPuViewController()
            
            viewClosure!(caipuView!)
            caipuView!.array=array
            
            
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    class func createCellFor(tableView: UITableView,atIndexPath indexPath:NSIndexPath,caiPuArray: CaiPuModel?) -> SecondCell{
        
        let cellId="secondCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? SecondCell
        if nil == cell{
            cell = NSBundle.mainBundle().loadNibNamed("SecondCell", owner: nil, options: nil).last as? SecondCell
            
        }
        
        cell?.array=caiPuArray
        return cell!
    }
    
}
