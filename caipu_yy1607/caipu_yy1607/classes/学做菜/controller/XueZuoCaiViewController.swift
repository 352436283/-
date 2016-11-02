//
//  XueZuoCaiViewController.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit
import SwiftyJSON
class XueZuoCaiViewController: BaseViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.purpleColor()
        createView()
        downloadData()
        downloadData1()
        
        // Do any additional setup after loading the view.
    }
    
    var xuezuocaiView:XueZuoCaiView?
    
    func createView(){
        
        
        xuezuocaiView=XueZuoCaiView()
        xuezuocaiView!.userInteractionEnabled=true
        view.addSubview(xuezuocaiView!)
        xuezuocaiView!.snp_makeConstraints(closure: {
            
            [weak self] (make) in
            make.edges.equalTo((self?.view)!).inset(UIEdgeInsetsMake(0, 0, 49, 0))
            
            })
        
        
        xuezuocaiView!.jumpClosure={
            
            (url) in
            print(url)
        }
        
        xuezuocaiView!.viewClosure={
            
            (view) in
            self.navigationController?.pushViewController(view as! UIViewController, animated: true)
        }
        
    }
    
    func downloadData(){
        
        let downloader=Downloader()
        downloader.delegate=self
        downloader.type = .StudyModel
        let url=NSURL(string: "http://api.xiangha.com/main6/index/baseData?type=v2")
        downloader.downloadWithUrl(url!)
        
        
        
        
        
        
        
    }
    
    func downloadData1(){
        
        let downloader1=Downloader()
        downloader1.delegate=self
        downloader1.type = .StudyCaiPuModel
        let url1=NSURL(string: "http://api.xiangha.com/main5/home/getAppData?type=newData")
        downloader1.downloadWithUrl(url1!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension XueZuoCaiViewController:DownloadDelegate{
    
    
    func download(downloader: Downloader, didFinishedWitnData data: NSData?) {
        
        
        
        if downloader.type == .StudyModel{
            if let tmpData=data{
                let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
                
                let model2=TodayGoodModel.paraseData(data2)
                let model=StudyModel.parseData(tmpData)
                //print(model)
                
                xuezuocaiView!.model=model
                xuezuocaiView!.model2=model2
                
            }
            
            
            
            
        }else if downloader.type == .StudyCaiPuModel{
            
            let model=StudyCaiPuModel.paraseData(data!)
            xuezuocaiView?.model1=model
        }
        
    }
    
    func download(downloader: Downloader, didFailedWitnError error: NSError?) {
        
    }
}

