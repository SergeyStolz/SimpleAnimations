//
//  ViewController.swift
//  Simple Animations
//
//  Created by mac on 20.09.2021.
//
import UIKit

class AnimationViewController: UIViewController {
    // MARK: - Propeties
    private var serialNumberLabelCount = 0
    // MARK: - Views
    private lazy var squareView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var serialNumberLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func  setupView() {
        for i in 0...9 {
            for a in 0...4 {
                squareView = UIView(frame: CGRect(x: 10 + 75 * a,
                                                  y: 50 + 75 * i,
                                                  width: 70,
                                                  height: 70)
                )
                serialNumberLabel = UILabel(frame: CGRect(x: 0,
                                                          y: 0,
                                                          width: 70,
                                                          height: 70)
                )
                squareView.backgroundColor = .orange
                serialNumberLabel.textColor = .random()
                serialNumberLabel.textAlignment = NSTextAlignment.center
                serialNumberLabelCount += 1
                serialNumberLabel.text = "\(serialNumberLabelCount)"
                squareView.tag = serialNumberLabelCount
                
                self.view.addSubview(squareView)
                squareView.addSubview(serialNumberLabel)
            }
        }
    }
    
    open override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        for touch in touches {
            print("touch.view.tag = \(touch.view!.tag)")
            for view in view.subviews {
                if view.tag == touch.view?.tag && view.tag != 0 {
                    print("view.tag = \(view.tag)")
                    UIView.animate(withDuration: 1) {
                        view.transform = CGAffineTransform(scaleX: 2, y: 2)
                        view.backgroundColor = .random()
                    }
                    squareView.superview?.bringSubviewToFront(view)
                } else if view.tag != touch.view?.tag && view.tag != 0 {
                    UIView.animate(withDuration: 1) {
                        view.transform = CGAffineTransform(scaleX: 1, y: 1)
                        view.backgroundColor = .orange
                    }
                }
            }
        }
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
}


