import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var progress: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        button.backgroundColor = .red
        /// on run time  i want to create a label as a heading of the view
        let heading = UILabel(frame: CGRect(x:30, y: 50, width: 200, height:100))
        heading.text = "Heyyyyyy!!!!!"
        view.addSubview(heading)
        
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        print("button tapped")
    }
    
}

