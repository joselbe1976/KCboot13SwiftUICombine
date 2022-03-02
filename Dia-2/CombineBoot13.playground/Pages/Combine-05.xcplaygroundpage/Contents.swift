/*
 Descarga de una foto con un view model
 */


import Combine
import UIKit


final class ViewModelPhoto {
    var photo: UIImage? {
        didSet{
            print("foto recibida")
            photo
        }
    }
    
        
    init(){
        
    }
    
    
    var suscriber :AnyCancellable?
    
    
    func DownloadImage(urlS:String) -> Void {
        
        let url = URL(string: urlS)!
        
        suscriber = URLSession.shared
            .dataTaskPublisher(for: url)
            .map{
                UIImage(data: $0.data)
            }
            .replaceError(with: UIImage(named: "person.clop.circle.badge.exclamationmark"))
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: {
                if let foto = $0 {
                    self.photo = foto
                    
                }
            })
    }
    
    
    
}



//probamos el view model.

let viewModel = ViewModelPhoto()
viewModel.DownloadImage(urlS: "https://i.blogs.es/f7b0ed/steve-jobs/1366_2000.jpg")
viewModel.photo


