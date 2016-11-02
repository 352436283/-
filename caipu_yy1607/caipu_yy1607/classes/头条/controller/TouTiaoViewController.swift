//
//  TouTiaoViewController.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit
import SwiftyXMLParser

class TouTiaoViewController: BaseViewController {
    var webView:UIWebView?

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.whiteColor()
        self.automaticallyAdjustsScrollViewInsets=false
        webView=UIWebView(frame: CGRect(x: 0, y: 64, width: self.view.frame.size.width, height: self.view.frame.size.height-64))
        view.addSubview(webView!)
        let url=NSURL(string: "http://api.xiangha.com/main6/zhishi/getNousList?page=1&type=new")
        let request=NSURLRequest(URL: url!)
        webView?.loadRequest(request)
        
        
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension TouTiaoViewController:DownloadDelegate{

    
    func download(downloader: Downloader, didFinishedWitnData data: NSData?) {
        if let tmpData=data{
        
            let xml=XML.parse(tmpData)
            print()
            
        }
        
    }
    
    func download(downloader: Downloader, didFailedWitnError error: NSError?) {
       
    }
}
