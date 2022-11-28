//
//  CommentViewController.swift
//  NetworkManager
//
//  Created by Ios Developer on 28.11.2022.
//

import UIKit

class CommentViewController: UIViewController {

    let viewModel = PostViewModel()
    private let tableView: UITableView = {
       let talbe = UITableView()
        talbe.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return talbe
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.getComment { errorMessage in
            if let errorMessage = errorMessage{
                print(errorMessage)
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
     
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    

  
}
extension CommentViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.commentItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.commentItems[indexPath.row].body
        cell.detailTextLabel?.text = ""
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
}
