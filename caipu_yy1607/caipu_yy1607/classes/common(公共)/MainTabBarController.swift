//
//  MainTabBarController.swift
//  caipu_yy1607
//
//  Created by qianfeng on 16/10/26.
//  Copyright © 2016年 俞阳. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    private var bgView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        createViewControllers()

        
    }
    
    func createMyTabBar(){
        
        bgView=UIView.createView()
        bgView?.backgroundColor=UIColor.init(white: 0.9, alpha: 1.0)
        view.addSubview(bgView!)
        bgView?.snp_makeConstraints(closure: {
        [weak self]
            (make) in
            make.left.right.bottom.equalTo(self!.view)
            make.height.equalTo(49)
        })
        
        let imageNames=["z_home_menu_ico_caipu_22x22_","z_home_menu_ico_surprise_22x22_","z_home_menu_ico_quan_22x22_","z_home_menu_ico_message_22x22_","z_home_menu_ico_me_22x22_"]
        
        let selImageNames=["z_home_menu_ico_caipu_active_22x22_","z_home_menu_ico_surprise_active_22x22_","z_home_menu_ico_quan_post_55x33_","z_home_menu_ico_message_active_22x22_","z_home_menu_ico_me_active_22x22_"]
        let titles=["学做菜","头条","美食圈","消息","我的"]
        var lastBtn:UIButton?
        for i in 0..<titles.count{
        
            let btn=UIButton.createBtn(nil, bgImageName: imageNames[i], highlightImageName: nil, selectImageName: selImageNames[i], target: self, action: #selector(btnClick(_:)))
            btn.tag=300+i
            bgView?.addSubview(btn)
            let label=UILabel.createLabel(titles[i], Aligent: .Center, font: UIFont.systemFontOfSize(10))
            label.textColor=UIColor.lightGrayColor()
            label.tag=400
            btn.addSubview(label)
            btn.snp_makeConstraints(closure: {
            [weak self]
                (make) in
                make.top.bottom.equalTo(self!.bgView!)
                if i==0{
                make.left.equalTo(self!.bgView!)
                }else{
                make.left.equalTo((lastBtn?.snp_right)!)
                    make.width.equalTo(lastBtn!)
                
                }
                if i==4{
                make.right.equalTo(self!.bgView!)
                }
                
            })
            label.snp_makeConstraints(closure: {
            
                 (make) in
                make.left.right.bottom.equalTo(btn)
                make.height.equalTo(10)
            })
            lastBtn=btn
            //默认选中第一个按钮
            if i == 0 {
                btn.selected = true
                label.textColor = UIColor.brownColor()
                
            }

        }
        
        
 
        
    }
    
    func btnClick(btn:UIButton){
        let index=btn.tag-300
        if selectedIndex != index{
            
        
            let lastBtn=bgView?.viewWithTag(300+selectedIndex) as! UIButton
            lastBtn.selected=false
            lastBtn.userInteractionEnabled=true
            let lastLabel=lastBtn.viewWithTag(400) as! UILabel
            lastLabel.textColor=UIColor.lightGrayColor()
            
            btn.selected=true
            btn.userInteractionEnabled=false
            let curLabel=btn.viewWithTag(400) as! UILabel
            curLabel.textColor=UIColor.brownColor()
            
            selectedIndex=index
        }
    
        
    }
    
    func createViewControllers(){
        
    
        let nameArray=["XueZuoCaiViewController","TouTiaoViewController","MeiShiQuanViewController","MessageViewController","MyViewController"]
        var ctlArray:[UIViewController]=[]
        for i in 0..<nameArray.count{
        
            let name="caipu_yy1607."+nameArray[i]
            let ctl=NSClassFromString(name) as! UIViewController.Type
            let vc=ctl.init()
            var nav:UIViewController?
            if  i==4{
            
                nav=vc
            }else{
            nav=UINavigationController(rootViewController: vc)
            }
            
            ctlArray.append(nav!)
        }
        
        viewControllers=ctlArray
        
        
        tabBar.hidden=true
        createMyTabBar()
        
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
