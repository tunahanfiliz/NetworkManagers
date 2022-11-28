//
//  ViewController.swift
//  NetworkManager
//
//  Created by Ios Developer on 28.11.2022.
//

import UIKit

class PostViewController: UIViewController {

    let viewModel = PostViewModel()
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.getPost { errorMessage in
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

    func reloadData(){
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

}

extension PostViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.postItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = viewModel.postItems[indexPath.row].title
        cell.textLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = viewModel.postItems[indexPath.row].body
        cell.detailTextLabel?.numberOfLines = 0
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        /*
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(CommentViewController.self)") as! CommentViewController
        controller.viewModel.postId = viewModel.postItems[indexPath.row].id ?? 0
        show(controller, sender: nil)*/
        
        
        
        let vc = CommentViewController()
        vc.viewModel.postId = viewModel.postItems[indexPath.row].id 
        //show(vc, sender: nil) alttakinin bi değişik modeli
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
}
