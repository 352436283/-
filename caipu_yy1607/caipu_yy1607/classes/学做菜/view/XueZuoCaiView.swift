//
//  XueZuoCaiView.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/28.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit

public typealias IngreJumpClosure = (AnyObject -> Void)

class XueZuoCaiView: UIView {
    var jumpClosure: IngreJumpClosure?
    var viewClosure:(AnyObject -> Void)?
    var model:StudyModel?{
        
        didSet{
            
            if model != nil{
                tbv?.reloadData()
                
            }
        }
    }
    var model1:StudyCaiPuModel?{
        didSet{
            
            
            if model1 != nil{
                tbv?.reloadData()
            }
        }
        
        
    }
    var count:Int=0
    
    var model2:TodayGoodModel?{
        
        didSet{
            
            if model2 != nil{
                tbv?.reloadData()
                count=(model2?.data?.todayData?.todayDataArray?.count)!
                
            }
        }
    }
    
    private var tbv:UITableView?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        tbv=UITableView(frame: CGRectZero, style: .Plain)
        tbv?.delegate=self
        tbv?.dataSource=self
        addSubview(tbv!)
        tbv?.snp_makeConstraints(closure: {
            
            [weak self] (make) in
            make.edges.equalTo(self!)
            })
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension XueZuoCaiView:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 || section==1{
            return 1
        }else if section==2{
            return 3
        }else if section==3{
            
            
            return count
            
        }else{
            
            return 0
        }
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section==0{
            return 200
        }else if indexPath.section==1{
            
            return 50
        }else if indexPath.section==2 {
            return  150
        }else{
            
            return 220
        }
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section==0{
            
            let cell=RecommendCell.createCellFor(tableView, atIndexPath: indexPath, bannerArray:model?.data?.recommend )
            cell.jumpClosure=jumpClosure
            return cell
        }else if indexPath.section==1{
            
            let cell=SecondCell.createCellFor(tableView, atIndexPath: indexPath, caiPuArray: model1?.data?.caipu)
            cell.viewClosure=viewClosure
            return cell
        }else if indexPath.section==2{
            let topic=model?.data?.topic?.topic![indexPath.row]
            
            let cell=TopicCell.createCellFor(tableView, atIndexPath: indexPath, topic: topic)
            cell.jumpClosure=jumpClosure
            return cell
        }else if indexPath.section==3{
            
            let model=model2?.data?.todayData?.todayDataArray![indexPath.row]
            let cell=TodayGoodCell.createTodayGoodCellFor(tableView, atIndexPath: indexPath, model: model)
            cell.model=model
            cell.jumpClosure=jumpClosure
            
            return cell
            
        }
        return UITableViewCell()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("我被选中了")
    }
}
