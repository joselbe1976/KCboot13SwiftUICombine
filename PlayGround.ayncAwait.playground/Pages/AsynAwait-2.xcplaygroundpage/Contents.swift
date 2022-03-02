import UIKit


print(" --------------------------------------------")
print("  Ejer-2. Download photo Async-Await")
print(" --------------------------------------------")

enum DownloadError: Error {
    case badImage
    case unknown
}



class viewModelPhoto {
    var photo : UIImage? {
        didSet{
            // foto recibida
            print("foto recibida")
            photo
        }
    }
   
    init(url:String){
        Task {
            self.photo = try await DownloadImage(urlS: url)
        }
    }
    
    
    // Creamos funcion de descarga asyn
    func DownloadImage(urlS:String) async throws -> UIImage {
        
        let url = URL(string: urlS)!
        let (data, _) = try await URLSession.shared.data(from: url)
        let imagenAux = UIImage(data: data)
        
        if let imagen = imagenAux {
            return imagen
        } else{
            throw DownloadError.badImage
        }
        
        
        
    }
}

// probamos el View Model

let viewModel = viewModelPhoto(url: "https://i.blogs.es/f7b0ed/steve-jobs/1366_2000.jpg")
viewModel.photo // no se Ve, porque es asincrono... esto habrá que ver como se conecta con la View


