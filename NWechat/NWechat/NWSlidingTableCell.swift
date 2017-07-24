//
//  NWSlidingTableCell.swift
//  NWechat
//
//  Created by 谌志伟 on 2017/7/13.
//  Copyright © 2017年 zhiwei.chen. All rights reserved.
//

import UIKit

class NWSlidingTableCell: UITableViewCell {
    
    
    @IBOutlet weak var containerViewleading: NSLayoutConstraint!
    private let deletButtonWidthConstant = kScreenWidth/7
    fileprivate let slingDistance = -3*kScreenWidth/6
    fileprivate var panGes:UIPanGestureRecognizer?
    
    @IBOutlet weak var deletButtonWidth: NSLayoutConstraint!

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var photoImgView: UIImageView!
    @IBOutlet weak var nickNamelabel: UILabel!
    @IBOutlet weak var mostNewMsglabel: UILabel!
    fileprivate var offsetX:CGFloat = 0
    fileprivate let startSlidingOffset:CGFloat = -5
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        containerViewleading.constant = 0
    }
    
    private func setupUI(){
        NotificationCenter.default.addObserver(self, selector: #selector(getContainerViewBack), name: NWNotifiCation.getSlidingCellBack.name, object: nil)
        
        deletButtonWidth.constant = deletButtonWidthConstant
        containerViewleading.constant = 0
        panGes = UIPanGestureRecognizer(target: self, action: #selector(panGesHandle(sender:)))
        panGes!.delegate = self
        containerView.addGestureRecognizer(panGes!)
        
    }
    
    @objc private func getContainerViewBack(){
        containerViewleading.constant = 0
        UIView.animate(withDuration: 0.2) { 
            self.layoutIfNeeded()
        }
        
    }
    
    
    //删除
    @IBAction func deletAction(_ sender: Any) {
        print("删除")
    }

    @IBAction func markAction(_ sender: Any) {
        print("MARK")
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: NWNotifiCation.getSlidingCellBack.name, object: nil)
        
        if var ges = containerView.gestureRecognizers {
            ges.removeAll()
        }
       
    }
    
 
 
    
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        guard panGes != nil else {
            return false
        }
        if offsetX <= startSlidingOffset && otherGestureRecognizer != panGes!{
            return false
        }
        
        return true
    }
    
 
    
    
}


// MARK: - 对于pan手势的处理
extension NWSlidingTableCell{
    @objc fileprivate func panGesHandle(sender:UIPanGestureRecognizer){
        let velocity = sender.velocity(in: containerView)
        switch sender.state {
        case .ended:
            if velocity.x > 0 {
                if self.offsetX > startSlidingOffset {
                    containerViewleading.constant = 0
                }else{
                    containerViewleading.constant = slingDistance
                }
            }else{
                if self.offsetX <= startSlidingOffset{
                    containerViewleading.constant = slingDistance
                }else{
                    containerViewleading.constant = 0
                }
            }
            UIView.animate(withDuration: 0.2, animations: {
                self.layoutIfNeeded()
            })
        default:
            break
        }
        let offsetX = sender.translation(in: containerView).x
        
        sender.setTranslation(CGPoint.zero, in: containerView)
        if abs(offsetX) > 2 {
            containerViewleading.constant += offsetX
        }
        self.offsetX = offsetX
        
        if containerViewleading.constant > 0 {
            containerViewleading.constant = 0
        }else if containerViewleading.constant < slingDistance {
            containerViewleading.constant = slingDistance
        }
        
       
        
    

    }
}
