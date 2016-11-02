//
//  RecommendCell.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/28.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit

class RecommendCell: UITableViewCell {
    var jumpClosure: IngreJumpClosure?
    
    var recommendArray:recommendModel?{
    
        didSet{
        
            showData()
            
        }
    }

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageCtl: UIPageControl!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func fieldClick(sender: AnyObject) {
        
    }
    private func showData(){
        for sub in scrollView.subviews {
            sub.removeFromSuperview()
        }
        let cnt=recommendArray?.recommend?.count
        if cnt>0{
        
            let containView=UIView.createView()
            scrollView!.pagingEnabled = true
            scrollView.addSubview(containView)
            containView.snp_makeConstraints(closure: {
            
                [weak self] (make) in
                make.top.bottom.left.right.equalTo(self!.scrollView)
                make.height.equalTo((self?.scrollView)!)
                
                
            })
            
            var lastView:UIView?=nil
            for i in 0..<cnt!{
            
                let model=recommendArray!.recommend![i]
                
                let tmpView=UIImageView()
                let url=NSURL(string: model.img!)
                tmpView.kf_setImageWithURL(url!)
                containView.addSubview(tmpView)
                titleLabel.text=model.title
                tmpView.addSubview(titleLabel)
                
                //添加点击事件
                tmpView.userInteractionEnabled = true
                tmpView.tag = 200+i
                let g = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
                tmpView.addGestureRecognizer(g)
                
                //图片的约束
                tmpView.snp_makeConstraints(closure: {
                    (make) in
                    make.top.bottom.equalTo(containView)
                    make.width.equalTo(scrollView)
                    if lastView == nil {
                        make.left.equalTo(containView)
                    }else{
                        make.left.equalTo((lastView?.snp_right)!)
                    }
                })
                
                
                lastView = tmpView


                
                
            }
            
            //3.修改container的宽度
            containView.snp_makeConstraints(closure: {
                (make) in
                make.right.equalTo(lastView!)
            })
            
            //分页控件
            pageCtl.numberOfPages = cnt!

        }

    
        
    }
    
    
    func tapImage(g: UIGestureRecognizer) {
        
        let index = (g.view?.tag)! - 200
        let i=recommendArray?.recommend![index]
        
        if jumpClosure != nil  && i?.url != nil {
            jumpClosure!((i?.url)!)
        }

        

        
        
        
    }
    
    class func createCellFor(tableView: UITableView,atIndexPath indexPath:NSIndexPath,bannerArray: recommendModel?) -> RecommendCell {
        
        //重用标志
        let cellId = "recommendCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? RecommendCell
        if nil == cell {
            //IngreBannerCell.xib
            cell = NSBundle.mainBundle().loadNibNamed("RecommendCell", owner: nil, options: nil).last as? RecommendCell
        }
        
        //显示数据
        cell?.recommendArray = bannerArray
        
        return cell!
    }


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension RecommendCell:UIScrollViewDelegate{

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x/scrollView.bounds.size.width
        
        pageCtl.currentPage = Int(index)
    }
}
