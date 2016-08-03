//
//  ReadViewController.swift
//  古典名著品读
//
//  Created by 申克 on 16/4/25.
//  Copyright © 2016年 shang_hongzhi. All rights reserved.
//

import UIKit

class ReadViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let sanGuoTitle = NSBundle.mainBundle().pathForResource("sanGuo", ofType: "plist")
    let shuiHuTitle = NSBundle.mainBundle().pathForResource("shuihu", ofType: "plist")
    let xiYouTitle = NSBundle.mainBundle().pathForResource("xiyou", ofType: "plist")
    let hongLouTitle = NSBundle.mainBundle().pathForResource("honglou", ofType: "plist")
    let sunZiTitle = NSBundle.mainBundle().pathForResource("sunzi", ofType: "plist")
    let shiJiTitle = NSBundle.mainBundle().pathForResource("shiji", ofType: "plist")
    let sanShiTitle = NSBundle.mainBundle().pathForResource("sanshi", ofType: "plist")
    let sunBinTitle = NSBundle.mainBundle().pathForResource("sunbin", ofType: "plist")
    let zhenGuanTitle = NSBundle.mainBundle().pathForResource("zhenguan", ofType: "plist")
    
    
    let look = LookViewController()
    var bgImageTag :Int!
    var titlesMark :Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.redColor()
        self.navigationItem.leftBarButtonItem  = UIBarButtonItem.init(image:UIImage.init(named: "navBar_back@2x.png"), style: UIBarButtonItemStyle.Plain, target: self, action:#selector(ReadViewController.returnMulu))
        self .addTableView()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func returnMulu(){
        self.navigationController!.popViewControllerAnimated(true)
    }
    func addTableView(){
        let myTableView = UITableView.init(frame: self.view.frame)
        myTableView.delegate = self
        myTableView.dataSource = self
        self.view .addSubview(myTableView)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch bgImageTag {
        case 0:
            let titleArray =  NSArray.init(contentsOfFile: sanGuoTitle!)
            titlesMark = titleArray?.count
            return (titleArray?.count)!
        case 1:
            let titleArray =  NSArray.init(contentsOfFile: shuiHuTitle!)
            titlesMark = titleArray?.count
            return (titleArray?.count)!
        case 2:
            let titleArray =  NSArray.init(contentsOfFile: xiYouTitle!)
            titlesMark = titleArray?.count
            return (titleArray?.count)!
        case 3:
            let titleArray =  NSArray.init(contentsOfFile: hongLouTitle!)
            titlesMark = titleArray?.count
            return (titleArray?.count)!
        case 4:
            let titleArray =  NSArray.init(contentsOfFile: shiJiTitle!)
            titlesMark = titleArray?.count
            return (titleArray?.count)!
        case 5:
            let titleArray =  NSArray.init(contentsOfFile: sunZiTitle!)
            titlesMark = titleArray?.count
            return (titleArray?.count)!
        case 6:
            let titleArray =  NSArray.init(contentsOfFile: sunBinTitle!)
            titlesMark = titleArray?.count
            return (titleArray?.count)!
        case 7:
            let titleArray =  NSArray.init(contentsOfFile: sanShiTitle!)
            titlesMark = titleArray?.count
            return (titleArray?.count)!
        case 8:
            let titleArray =  NSArray.init(contentsOfFile: zhenGuanTitle!)
            titlesMark = titleArray?.count
            return (titleArray?.count)!
        default:break
        }
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell.init(style: UITableViewCellStyle.Default, reuseIdentifier: "cell")
        cell.textLabel?.font = UIFont.systemFontOfSize(14)
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        let cellbg  = UIImageView.init(frame: cell.contentView.frame)
        cellbg.image = UIImage.init(named: "bg_green_an.png")
        cell.backgroundView = cellbg
        switch bgImageTag {
        case 0:
            let titleArray =  NSArray.init(contentsOfFile: sanGuoTitle!)
            cell.textLabel?.text = titleArray![indexPath.row]as? String
        case 1:
            let titleArray =  NSArray.init(contentsOfFile: shuiHuTitle!)
            cell.textLabel?.text = titleArray![indexPath.row]as? String
        case 2:
            let titleArray =  NSArray.init(contentsOfFile: xiYouTitle!)
            cell.textLabel?.text = titleArray![indexPath.row]as? String
        case 3:
            let titleArray =  NSArray.init(contentsOfFile: hongLouTitle!)
            cell.textLabel?.text = titleArray![indexPath.row]as? String
        case 4:
            let titleArray =  NSArray.init(contentsOfFile: shiJiTitle!)
            cell.textLabel?.text = titleArray![indexPath.row]as? String
        case 5:
            let titleArray =  NSArray.init(contentsOfFile: sunZiTitle!)
            cell.textLabel?.text = titleArray![indexPath.row]as? String
        case 6:
            let titleArray =  NSArray.init(contentsOfFile: sunBinTitle!)
            cell.textLabel?.text = titleArray![indexPath.row]as? String
        case 7:
            let titleArray =  NSArray.init(contentsOfFile: sanShiTitle!)
            cell.textLabel?.text = titleArray![indexPath.row]as? String
        case 8:
            let titleArray =  NSArray.init(contentsOfFile: zhenGuanTitle!)
            cell.textLabel?.text = titleArray![indexPath.row]as? String
        default: break
            
        }
        return cell
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        look.mark = indexPath.row+1
        look.bgImageTag = bgImageTag
        look.titlesMark = titlesMark
        look.title = String.init(format: "第%d篇", look.mark)
        self.navigationController?.pushViewController(look, animated: true)
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
