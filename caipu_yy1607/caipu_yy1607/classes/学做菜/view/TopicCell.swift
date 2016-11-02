//
//  TopicCell.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/29.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit

class TopicCell: UITableViewCell {
    
    var topic:topicDetailModel?{
    
        didSet{
            if topic != nil{
            showData()
            }
            
           
            
        }
    }
    var jumpClosure:IngreJumpClosure?
    
    func showData(){
        
    
        topicImageView.userInteractionEnabled=true
        contentView.userInteractionEnabled=true
        topicLabel2.userInteractionEnabled=true
        topicLabel1.userInteractionEnabled=true
        topicImageView.kf_setImageWithURL(NSURL(string:(topic?.imgs)!), placeholderImage: nil, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        topicLabel1.text=topic?.subtitle
        topicLabel2.text=topic?.title
        let g=UIGestureRecognizer(target: self, action: #selector(tapImage))
        addGestureRecognizer(g)
        
        
        
        
    }
    
    func tapImage(){
    
        print("1")
        //jumpClosure!((topic?.url)!)
        
    }
    
 
    

    @IBOutlet weak var topicLabel2: UILabel!
    @IBOutlet weak var topicLabel1: UILabel!
    @IBOutlet weak var topicImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func createCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,topic:topicDetailModel?)->TopicCell{
    
        let cellId="topicCellId"
        var cell=tableView.dequeueReusableCellWithIdentifier(cellId) as? TopicCell
        if nil==cell{
        
            cell=NSBundle.mainBundle().loadNibNamed("TopicCell", owner: nil, options: nil).last as? TopicCell
        }
        
        cell?.topic=topic
        //print(cell?.topic?.title)
        return cell!
        
    }
    
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
