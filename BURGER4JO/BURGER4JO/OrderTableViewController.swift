//
//  OrderTableViewController.swift
//  BURGER4JO
//
//  Created by t2023-m0041 on 12/28/23.
//

import Foundation
import UIKit

// 임시 구조체
struct Menu {
    let name: String
    let price: Int
    var quantity: Int
}

class OrderTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    //임시 메뉴 세팅
    var menuItems: [Menu] = [
        Menu(name: "불고기 버거", price: 2500, quantity: 0),
        Menu(name: "치즈 버거", price: 3000, quantity: 0),
        Menu(name: "사이다", price: 1500, quantity: 0)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "menuCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath)
        
        let menuItem = menuItems[indexPath.row]
        cell.textLabel?.text = "\(menuItem.name) | $\(menuItem.price) | 수량: \(menuItem.quantity)"
        cell.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        cell.textLabel?.textColor = .black

        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            menuItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        quantityAlert(for: indexPath)
    }
    
    func quantityAlert(for indexPath: IndexPath) {
        let alertController = UIAlertController(title: "수량 변경", message: "수량을 입력하세요.", preferredStyle: .alert)
        
        alertController.addTextField { textField in
            textField.placeholder = "수량"
            textField.keyboardType = .numberPad
        }
        
        let confirmAction = UIAlertAction(title: "확인", style: .default) { [weak self] _ in
            guard let quantityString = alertController.textFields?.first?.text,
                  let quantity = Int(quantityString) else { return }
            
            self?.menuItems[indexPath.row].quantity = quantity
            self?.tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        present(alertController, animated: true, completion: nil)
    }
}
