//
//  LookViewController.swift
//  古典名著品读
//
//  Created by 申克 on 16/4/25.
//  Copyright © 2016年 shang_hongzhi. All rights reserved.
//

import UIKit


class LookViewController: UIViewController{
    
    var mark:NSInteger = 0
    var textString = NSString()
    var refreshControl:ZJRefreshControl!
    var mainTextView = UITextView()
    var _table:UITableView!
    var fontText:Int!
    var userDef:NSUserDefaults!
    var bgImageTag :Int!
    var titlesMark :Int!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem.init(image:UIImage.init(named: "navBar_back@2x.png"), style: UIBarButtonItemStyle.Plain, target: self, action:#selector(LookViewController.returnMulu))
        self.automaticallyAdjustsScrollViewInsets = false
        self .addTextView()
        self.refreshView()
    }
    func returnMulu(){
        self.navigationController!.popViewControllerAnimated(true)
    }
    func addTextView(){
        mainTextView = UITextView.init(frame:CGRectMake(0, 64, UIScreen.mainScreen().bounds.width, UIScreen.mainScreen().bounds.height-64))
        mainTextView.editable = false
        mainTextView.text = self.addText(mark-1) as String
        mainTextView.layoutManager.allowsNonContiguousLayout = false
        mainTextView.backgroundColor = UIColor.init(red: 90/255, green: 200/255, blue: 140/255, alpha: 1)
        mainTextView.textColor = UIColor.blackColor()
        mainTextView.font = UIFont.systemFontOfSize(19)
        self.view .addSubview(mainTextView)


    }
    func refreshView(){
        refreshControl = ZJRefreshControl.init(scrollView: mainTextView, refreshBlock: {
            if(self.mark>1){
                self.mark -= 1
                self.title = NSString.init(format: "第%d篇", self.mark) as String
                self.mainTextView.text = self.addText(self.mark-1)as String
                self.mainTextView.contentOffset.y = 0
                self.refreshControl.endRefreshing()
            }else{
                let alertControl = UIAlertController.init(title: "我很想有东西，可惜只有开头", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                let cancleAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil)
                alertControl.addAction(cancleAction)
                self.presentViewController(alertControl, animated: true, completion: nil)
                self.refreshControl.endRefreshing()
            }
            }, loadmoreBlock: {
                if (self.mark < self.titlesMark){
                    print(self.titlesMark)
                    self.mark += 1
                    self.title = NSString.init(format: "第%d篇", self.mark)as String
                    self.mainTextView.text = self.addText(self.mark-1)as String
                    self.mainTextView.contentOffset.y = 0
                    self.refreshControl.endLoadingmore()
                }else{
                    let alertControl = UIAlertController.init(title: "知道你看的不过瘾，但是已经结局了", message: "", preferredStyle: UIAlertControllerStyle.Alert)
                    let cancleAction = UIAlertAction.init(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil)
                    alertControl.addAction(cancleAction)
                    self.presentViewController(alertControl, animated: true, completion: nil)
                    self.refreshControl.endLoadingmore()
                }
        })
    }
    func addText(Mark:NSInteger) ->NSString {
        switch bgImageTag {
        case 0:
            let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(String.init(format: "sanguo%d", Mark), ofType: "txt")!)
            let str = NSString (data: data!, encoding: NSUTF8StringEncoding)as! String
            return str
        case 1:
            let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(String.init(format: "shuihu%d", Mark), ofType: "txt")!)
            let str = NSString (data: data!, encoding: NSUTF8StringEncoding)as! String
            return str
        case 2:
            let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(String.init(format: "xiyou%d", Mark), ofType: "txt")!)
            let str = NSString (data: data!, encoding: NSUTF8StringEncoding)as! String
            return str
        case 3:
            let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(String.init(format: "honglou%d", Mark), ofType: "txt")!)
            let str = NSString (data: data!, encoding: NSUTF8StringEncoding)as! String
            return str
        case 4:
            let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(String.init(format: "shiji%d", Mark), ofType: "txt")!)
            let str = NSString (data: data!, encoding: NSUTF8StringEncoding)as! String
            return str
        case 5:
            let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(String.init(format: "sunzi%d", Mark), ofType: "txt")!)
            let str = NSString (data: data!, encoding: NSUTF8StringEncoding)as! String
            return str
        case 6:
            let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(String.init(format: "sunbin%d", Mark), ofType: "txt")!)
            let str = NSString (data: data!, encoding: NSUTF8StringEncoding)as! String
            return str
        case 7:
            let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(String.init(format: "sanshi%d", Mark), ofType: "txt")!)
            let str = NSString (data: data!, encoding: NSUTF8StringEncoding)as! String
            return str
        case 8:
            let data = NSData(contentsOfFile: NSBundle.mainBundle().pathForResource(String.init(format: "zhenguan%d", Mark), ofType: "txt")!)
            let str = NSString (data: data!, encoding: NSUTF8StringEncoding)as! String
            return str

        default:break
        }
        let str = ""
        return str
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(animated: Bool) {
        mainTextView.removeFromSuperview()
        self.addTextView()
        self.refreshView()
    }
    
}
