//
//  ViewController.swift
//  madNameScrollView
//
//  Created by 王绵峰 on 2018/5/16.
//  Copyright © 2018年 王绵峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    private let datas = ["基础篇","进阶篇"];
    
  private lazy var tableView: UITableView = {
    let tableView:UITableView  = UITableView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height), style: .plain)
    tableView .register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "cellId")
    tableView.delegate = self
    tableView.dataSource = self
    return tableView;
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.yellow
        self.title = "首页"
        view .addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TableViewCell.init(style:.default, reuseIdentifier: "cellId");
        cell.textLabel?.text = datas[indexPath.row]
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controllers = [OneViewController(),TwoViewController()]
        pushVC(VC: controllers[indexPath.row], index: indexPath.row)
    }

    func pushVC(VC:UIViewController,index:Int) -> Void {
        VC.title = datas[index]
        self.navigationController?.pushViewController(VC, animated: true)
    }

}

