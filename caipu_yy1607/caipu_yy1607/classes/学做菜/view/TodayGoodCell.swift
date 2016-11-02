//
//  TodayGoodCell.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/31.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit

class TodayGoodCell: UITableViewCell {
    
    var model:todayDataDetailModel?{
    
        didSet{
        
            showData()
        }
    }
    
    var jumpClosure:IngreJumpClosure?
    
    
    func showData(){
        
        todayImageView.kf_setImageWithURL(NSURL(string:(model?.img)!))
        todayImageView.userInteractionEnabled=true
        nameLabel.text=model?.name
        descLabel.text=model?.dishTaste
        timeLabel.text="今天"
        customerLabel.text=model?.customers?.nickName
        let g=UIGestureRecognizer(target: self, action: #selector(tapImage))
        addGestureRecognizer(g)
        
        
        
    
        
    }
    
    
    @IBOutlet weak var todayImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var customerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
        
        // Initialization code
    }
    
    class func createTodayGoodCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,model:todayDataDetailModel?)->TodayGoodCell{
    
        let cellId="todayGoodCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? TodayGoodCell
        if cell==nil{
        
            cell=NSBundle.mainBundle().loadNibNamed("TodayGoodCell", owner: nil, options: nil).last as? TodayGoodCell
        }
        cell?.model=model
        return cell!
    }
    
    func tapImage(){
        
        print("1")
        jumpClosure!((model?.code)!)
        
    }


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



