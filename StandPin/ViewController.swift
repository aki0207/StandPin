import UIKit
import MapKit

class ViewController: UIViewController,CLLocationManagerDelegate,MKMapViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    var locationManager:CLLocationManager!
    var pinByLongPress:MKPointAnnotation!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //位置情報使用許可のリクエストを表示
        guard (locationManager != nil) else {
            return
        }
        locationManager.requestWhenInUseAuthorization()
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("error")
    }
    
    
    @IBAction func longPressMap(_ sender: Any) {
        
        //ロングタップの最初の感知のみ受け取る
        if((sender as AnyObject).state != UIGestureRecognizer.State.began){
            return
        }
        
        pinByLongPress = MKPointAnnotation()
        
        //ロングタップから位置情報を取得
        let location:CGPoint = (sender as AnyObject).location(in: mapView)
        let longPressedCoordinate:CLLocationCoordinate2D = mapView.convert(location, toCoordinateFrom: mapView)
        
        //ロングタップした位置の座標をピンに入力
        pinByLongPress.coordinate = longPressedCoordinate
        //ピンを追加する
        mapView.addAnnotation(pinByLongPress)
    }
    
}



