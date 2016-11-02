//
//  CaiPuViewController.swift
//  caipu_yy1607
//
//  Created by jerremy on 16/11/2.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit

class CaiPuViewController: UIViewController {

    var tbv:UITableView?
    var array:CaiPuModel?{
        
        didSet{
            
            tbv?.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configView()
        
    }
    
    func configView(){
        
        tbv=UITableView(frame: CGRectZero, style: .Plain)
        tbv?.delegate=self
        tbv?.dataSource=self
        self.view.addSubview(tbv!)
        tbv?.snp_makeConstraints(closure: {
            
            (make) in
            make.edges.equalTo(self.view)
        })
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

extension CaiPuViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}
