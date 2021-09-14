//
//  UICollectionView + Extension.swift
//  DAZN-CASE
//
//  Created by Devran Ates on 12.09.2021.
//

import UIKit
protocol NibLoadName: AnyObject {
    static var nibName: String { get }
}

extension NibLoadName where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}

protocol ReusableIdentifier: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableIdentifier where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self)
    }
}

protocol ReusableViews: NibLoadName, ReusableIdentifier { }

extension UICollectionView {
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableIdentifier {
        self.register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UICollectionViewCell>(_: T.Type) where T: ReusableViews {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        self.register(nib, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCells<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: ReusableIdentifier {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableIdentifier {
        self.register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func register<T: UITableViewCell>(_: T.Type) where T: ReusableViews {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        self.register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCells<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: ReusableIdentifier {
        guard let cell = dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        
        return cell
    }
}
