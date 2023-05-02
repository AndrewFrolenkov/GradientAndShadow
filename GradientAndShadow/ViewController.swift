//
//  ViewController.swift
//  GradientAndShadow
//
//  Created by Андрей Фроленков on 2.05.23.
//

import UIKit

class ViewController: UIViewController {
  
  lazy var gradientLayer: CAGradientLayer = {
    let gradientLayer = CAGradientLayer()
    gradientLayer.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
    gradientLayer.startPoint = CGPoint(x: 0, y: 0)
    gradientLayer.endPoint = CGPoint(x: 1, y: 1)
    gradientLayer.cornerRadius = 20
    return gradientLayer
  }()
  
  lazy var verticalView: UIView = {
    let verticalView = UIView()
    verticalView.layer.cornerRadius = 20
    verticalView.layer.shadowColor = UIColor.black.cgColor
    verticalView.layer.shadowRadius = 10
    verticalView.layer.shadowOffset = CGSize.zero
    verticalView.layer.shadowOpacity = 1
    verticalView.backgroundColor = .darkGray
    verticalView.layer.addSublayer(gradientLayer)
    return verticalView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setupConstraints()
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    gradientLayer.frame = verticalView.bounds
  }
  
  func setupConstraints() {
    
    verticalView.translatesAutoresizingMaskIntoConstraints = false
    
    view.addSubview(verticalView)
    
    NSLayoutConstraint.activate([
      verticalView.widthAnchor.constraint(equalToConstant: 100),
      verticalView.heightAnchor.constraint(equalToConstant: 100),
      verticalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
      verticalView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }
  
  
}

