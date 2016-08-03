//
//  MuluViewController.swift
//  古典名著品读
//
//  Created by 申克 on 16/4/25.
//  Copyright © 2016年 shang_hongzhi. All rights reserved.
//

import UIKit

class MuluViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var titles : NSArray!
    var subTitles: NSArray!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clearColor()
        self.title = "古典名著品读"
        // Do any additional setup after loading the view.
        self.addDataSource()
        self.addTableView()
        
    }
    func addDataSource(){
        let namePath = NSBundle.mainBundle().pathForResource("BookName", ofType: "plist")
        let subTitle = NSBundle.mainBundle().pathForResource("SubTitle", ofType: "plist")
        titles = NSArray.init(contentsOfFile: namePath!)
        subTitles = NSArray.init(contentsOfFile: subTitle!)
    }
    func addTableView(){
        let myTableView = UITableView.init(frame: self.view.frame)
        myTableView.backgroundColor = UIColor.whiteColor()
        myTableView.delegate = self
        myTableView.dataSource = self
        myTableView.registerNib(UINib(nibName:"TitleCell",bundle: NSBundle.mainBundle()), forCellReuseIdentifier: "TitleCell")
        self.view .addSubview(myTableView)
        myTableView.tableFooterView = UIView.init()
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TitleCell", forIndexPath: indexPath)as! TitleCell
        let cellbg  = UIImageView.init(frame: cell.contentView.frame)
        cellbg.image = UIImage.init(named: "bg_purple_x.png")
        cell.backgroundView = cellbg
        cell.cellTitle.text = titles[indexPath.row]as? String
        cell.titleLabel.text = subTitles[indexPath.row] as? String
        cell.selectionStyle = UITableViewCellSelectionStyle.None
        return cell
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let read = ReadViewController()
        read.bgImageTag = indexPath.row
        read.title = titles[indexPath.row] as? String
        self.navigationController!.pushViewController(read, animated: true)
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
