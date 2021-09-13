//
//  MakeDropDown.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 13.09.2021.
//

import Foundation
import UIKit


protocol MakeDropDownDataSourceProtocol{
    func getDataToDropDown(cell: UITableViewCell, indexPos: Int, makeDropDownIdentifier: String)
    func numberOfRows(makeDropDownIdentifier: String) -> Int
    
    func selectItemInDropDown(indexPos: Int, makeDropDownIdentifier: String)
}

extension MakeDropDownDataSourceProtocol{
    func selectItemInDropDown(indexPos: Int, makeDropDownIdentifier: String) {}
}

class MakeDropDown: UIView{
    
    var makeDropDownIdentifier: String = "DROP_DOWN"
    var cellReusableIdentifier: String = "DROP_DOWN_CELL"
    var dropDownTableView: UITableView?
    var width: CGFloat = 0
    var offset:CGFloat = 0
    var makeDropDownDataSourceProtocol: MakeDropDownDataSourceProtocol?
    var nib: UINib?{
        didSet{
            dropDownTableView?.register(nib, forCellReuseIdentifier: self.cellReusableIdentifier)
        }
    }
  
    var viewPositionRef: CGRect?
    var isDropDownPresent: Bool = false
   
    
    func setUpDropDown(viewPositionReference: CGRect,  offset: CGFloat){
        self.frame = CGRect(x: viewPositionReference.minX, y: viewPositionReference.minY + offset, width: 0, height: 0)
        dropDownTableView = UITableView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: 0, height: 0))
        self.width = viewPositionReference.width
        self.offset = offset
        self.viewPositionRef = viewPositionReference
        dropDownTableView?.showsVerticalScrollIndicator = false
        dropDownTableView?.showsHorizontalScrollIndicator = false
        dropDownTableView?.backgroundColor = .white
        dropDownTableView?.separatorStyle = .singleLine
        dropDownTableView?.separatorColor = .white
        dropDownTableView?.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        dropDownTableView?.delegate = self
        dropDownTableView?.dataSource = self
        dropDownTableView?.allowsSelection = true
        dropDownTableView?.isUserInteractionEnabled = true
        dropDownTableView?.tableFooterView = UIView()
        self.addSubview(dropDownTableView!)
        
    }
    

    func showDropDown(height: CGFloat){
        if isDropDownPresent{
            self.hideDropDown()
        }else{
            isDropDownPresent = true
            self.frame = CGRect(x: (self.viewPositionRef?.minX)!, y: (self.viewPositionRef?.maxY)! + self.offset, width: width, height: 0)
            self.dropDownTableView?.frame = CGRect(x: 0, y: 0, width: width, height: 0)
            self.dropDownTableView?.reloadData()
            
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.05, options: .curveLinear
                , animations: {
                self.frame.size = CGSize(width: self.width, height: height)
                self.dropDownTableView?.frame.size = CGSize(width: self.width, height: height)
            })
        }
        
    }
    

    func reloadDropDown(height: CGFloat){
        self.frame = CGRect(x: (self.viewPositionRef?.minX)!, y: (self.viewPositionRef?.maxY)!
            + self.offset, width: width, height: 0)
        self.dropDownTableView?.frame = CGRect(x: 0, y: 0, width: width, height: 0)
        self.dropDownTableView?.reloadData()
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.05, options: .curveLinear
            , animations: {
            self.frame.size = CGSize(width: self.width, height: height)
            self.dropDownTableView?.frame.size = CGSize(width: self.width, height: height)
        })
    }
    

    func setRowHeight(height: CGFloat){
        self.dropDownTableView?.rowHeight = height
        self.dropDownTableView?.estimatedRowHeight = height
    }
    

    func hideDropDown(){
        isDropDownPresent = false
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveLinear
            , animations: {
            self.frame.size = CGSize(width: self.width, height: 0)
            self.dropDownTableView?.frame.size = CGSize(width: self.width, height: 0)
        })
    }
    func removeDropDown(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.3, options: .curveLinear
            , animations: {
            self.dropDownTableView?.frame.size = CGSize(width: 0, height: 0)
        }) { (_) in
            self.removeFromSuperview()
            self.dropDownTableView?.removeFromSuperview()
        }
    }
    
}

// MARK: - Table View Methods
extension MakeDropDown: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (makeDropDownDataSourceProtocol?.numberOfRows(makeDropDownIdentifier: self.makeDropDownIdentifier) ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = (dropDownTableView?.dequeueReusableCell(withIdentifier: self.cellReusableIdentifier) ?? UITableViewCell())
        makeDropDownDataSourceProtocol?.getDataToDropDown(cell: cell, indexPos: indexPath.row, makeDropDownIdentifier: self.makeDropDownIdentifier)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        makeDropDownDataSourceProtocol?.selectItemInDropDown(indexPos: indexPath.row, makeDropDownIdentifier: self.makeDropDownIdentifier)
    }
    
}
