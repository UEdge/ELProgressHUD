//
//  DYProgressHUDSwift.swift
//  MBProgressHUDSwift
//
//  Created by Dylan on 2018/7/4.
//  Copyright © 2018年 Dylan. All rights reserved.
//


import UIKit
import MBProgressHUD


public class ELProgressHUD :NSObject{
    
    
    //
    //        fileprivate lazy var infoImage: UIImage? = Config.bundleImage(.Info)?.withRenderingMode(.alwaysTemplate)
    //    fileprivate lazy var successImage: UIImage? = Config.bundleImage(.Success)?.withRenderingMode(.alwaysTemplate)
    //    fileprivate lazy var errorImage: UIImage? = Config.bundleImage(.Error)?.withRenderingMode(.alwaysTemplate)
    //    fileprivate lazy var warnImage: UIImage? = Config.bundleImage(.Warn)?.withRenderingMode(.alwaysTemplate)
    //
    //
    //显示普通消息,带图
    /// 显示info
    ///
    /// - Parameters:
    ///   - title: titlew
    ///   - toView: view
    public class func showInfo(_ title: String) {
        
        self.showCustomIcon(title, image: Config.bundleImage(.Info)!)
    }
    
    //显示成功消息带图片，带图
    /// 显示success
    ///
    /// - Parameters:
    ///   - title: title
    ///   - toView: view
    public class func showSuccess(_ title: String) {
        
        self.showCustomIcon(title, image: Config.bundleImage(.Success)!)
    }
    
    
    /// 显示错误，带图
    ///
    /// - Parameters:
    ///   - title: message
    ///   - toView: view
    public class func showError(_ title: String) {
        
        self.showCustomIcon(title, image: Config.bundleImage(.Error)!)
        
    }
    
    
    /// 显示警告，带图
    ///
    /// - Parameters:
    ///   - title: message
    ///   - toView: view
    public class func showWarn(_ title: String) {
        
        self.showCustomIcon(title, image: Config.bundleImage(.Warn)!)
        
    }
    
    
    /// 显示菊花加载视图，不自动消失
    ///
    /// - Parameter View: view
    public class func showLoadToView(_ message:String)  {
        
        self.showIconMessage(message,RemainTime: 0)
    }
    
    
    //    /// 快速显示一条消息
    //    ///
    //    /// - Parameter message: message
    //   public class func showAutoMessage(_ message:String)  {
    //
    //        self.showAutoMessage(message, View: nil)
    //    }
    //
    
    
    
    /// 自定义停留时间有图[显示菊花]
    ///
    /// - Parameters:
    ///   - message: message
    ///   - View: view
    ///   - RemainTime: time
    public class func showIconMessage(_ message:String,RemainTime:TimeInterval) {
        
        self.showMessage(message, RemainTime: RemainTime, Model: .indeterminate)
        
    }
    
    
    /// 2s自动消失文本，无图
    ///
    /// - Parameters:
    ///   - message: message
    ///   - View: view
    ///   - RemainTime: time
    public class func showAutoMessage(_ message:String) {
        
        self.showMessage(message, RemainTime: 2.0, Model: .text)
        
    }
    /// 自定义停留时间,无图
    ///
    /// - Parameters:
    ///   - message: message
    ///   - View: view
    ///   - RemainTime: time
    public class func showMessage(_ message:String,RemainTime:TimeInterval) {
        
        self.showMessage(message, RemainTime: RemainTime, Model: .text)
        
    }
    
    /// 显示不带图片的信息
    ///
    /// - Parameters:
    ///   - message: 消息
    ///   - View: view
    ///   - RemainTime: 隐藏时间
    ///   - Model: 显示的类型【MBHUD四种模型】
    public class func showMessage(_ message:String,RemainTime:TimeInterval,Model:MBProgressHUDMode) {
        
        var View = self.showHudView.shareInstance.HUDView
        
        
        self.hideHud()
        
        let hud = MBProgressHUD.showAdded(to: View, animated: true)
        
        //        hud.backgroundView.style = .blur  //模糊的遮罩背景
        
        hud.dimBackground = true
        
        //        //设置菊花框为白色
        //        if #available(iOS 9.0, *) {
        //
        //            UIActivityIndicatorView.appearance(whenContainedInInstancesOf:
        //                [MBProgressHUD.self]).color = .white
        //
        //        } else {
        
        hud.activityIndicatorColor = UIColor.white
        //        }
        
        hud.mode = Model
        hud.label.text = message
        hud.label.textColor = UIColor.white
        //       //  正方形
        //       hud.isSquare = true
        hud.bezelView.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.9)
        
        hud.removeFromSuperViewOnHide = true
        
        //  给hud添加手势[点击消失]
        //        self.addTouchToHUD(hud: hud)
        
        //  判断是不是需要自动消失
        if  RemainTime > 0.0 {
            
            hud.hide(animated: true, afterDelay: RemainTime)
        }
        
        
    }
    
    
    /// 显示带图片的信息
    ///
    /// - Parameters:
    ///   - title: message
    ///   - imageName: imageName
    ///   - view: view
    public class func showCustomIcon(_ title:String,image:UIImage) {
        var View = self.showHudView.shareInstance.HUDView
        
        self.hideHud()
        
        let hud = MBProgressHUD.showAdded(to: View, animated: true)
        
        hud.dimBackground = true
        
        hud.mode = .customView
        hud.label.text = title
        
        //        hud.customView = UIImageView(image: UIImage(named: imageName))
        hud.customView = UIImageView(image: image)
        
        hud.bezelView.backgroundColor = UIColor.init(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.9)
        
        hud.label.textColor = UIColor.white
        
        hud.removeFromSuperViewOnHide = true
        
        hud.hide(animated: true, afterDelay: 2.0)
    }
    
    /// 隐藏view
    public class  func hideHud(){
        
        MBProgressHUD.hide(for: self.showHudView.shareInstance.HUDView, animated: true)
        
        
    }
    
    //    /// 隐藏view
    //   public class func hideHud() {
    //
    //        self.hidehudForView(view: nil)
    //    }
    
    
    /// 给hud添加手势，点击即可消失
    public class  func addTouchToHUD(hud:MBProgressHUD) {
        
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(self.TapAction(Tapgesture:)))
        
        hud .addGestureRecognizer(tap)
    }
    
    @objc  public class func TapAction(Tapgesture:UITapGestureRecognizer) {
        
        let hud = Tapgesture.view as? MBProgressHUD
        
        if hud == nil && (hud?.isHidden)! {
            //
            
        }else{
            
            hud?.hide(animated: true)
        }
    }
    
    class showHudView: UIView {
        
        public static let shareInstance = showHudView()
        
        //  懒加载HUDView【确保加载一次】
        lazy var HUDView:UIView = {
            
            var window = UIApplication.shared.keyWindow
            if window?.windowLevel != UIWindowLevelNormal {
                let windowArray = UIApplication.shared.windows
                for tempWin in windowArray {
                    if tempWin.windowLevel == UIWindowLevelNormal {
                        window = tempWin;
                        break
                    }
                }
            }
            
            return window!
            
        }()
    }
    //    //获取用于显示提示框的view
    //    public class func viewToShow() -> UIView{
    //
    //        var window = UIApplication.shared.keyWindow
    //        if window?.windowLevel != UIWindowLevelNormal {
    //
    //            let windowArray = UIApplication.shared.windows
    //            for tempWin in windowArray {
    //                if tempWin.windowLevel == UIWindowLevelNormal {
    //                    window = tempWin;
    //                    break
    //                }
    //            }
    //        }
    //        print("调用")
    //        return window!
    //    }
    
    
    //    //  懒加载footView【确保加载一次】
    //    lazy var viewShow:UIView = {
    //
    //        var window = UIApplication.shared.keyWindow
    //        if window?.windowLevel != UIWindowLevelNormal {
    //            let windowArray = UIApplication.shared.windows
    //            for tempWin in windowArray {
    //                if tempWin.windowLevel == UIWindowLevelNormal {
    //                    window = tempWin;
    //                    break
    //                }
    //            }
    //        }
    //        print("调用")
    //        return window!
    //
    //    }()
    
    
}

