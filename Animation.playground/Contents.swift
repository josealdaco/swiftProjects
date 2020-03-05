import UIKit
import PlaygroundSupport

class ViewController: UIViewController {

    let topView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.orange
        return view
    }()

    let bottomView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.purple
        return view
    }()

    override func viewDidLoad(){
        super.viewDidLoad()
        bottomView.frame = CGRect(x: self.view.frame.size.width/2-25, y: self.view.frame.size.height, width: 50, height: 50)
        self.view.addSubview(bottomView)

        topView.frame = CGRect(x: self.view.frame.size.width/2-25, y: -50, width: 50, height: 50)
        self.view.addSubview(topView)
        
       UIView.animate(withDuration: 1.0, delay: 0.2,
        usingSpringWithDamping: 0.5, initialSpringVelocity: 0.0, options: [.repeat], animations: {
            self.topView.center.y += 150
            self.bottomView.center.y -= 400
        }, completion: nil)
        
        
//        UIView.animate(withDuration: 1.5) {
//            self.bottomView.center.y -= 300
//        }
//        UIView.animate(withDuration: 1.5) {
//            self.topView.center.y += 300
//        }
        
    }
    
}

let master = ViewController()
PlaygroundPage.current.liveView = master
