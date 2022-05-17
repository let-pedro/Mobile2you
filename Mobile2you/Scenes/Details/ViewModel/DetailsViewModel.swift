
import Foundation

class DetailsViewModel: nameDetailsCollectionViewControllerDelegate {

    let service: Service
    var listMovies: [Movie] = []
    var MovieMain: Movie?
    
    
    init() {
        self.service = Service()
    }
    
    
    func getListMovie(completion: @escaping (Bool) -> Void){
        service.getListMovie(){ Response in
            guard Response != nil else {
                completion(false)
                return
            }
            self.listMovies = Response
        }
    }
    

    func DetailsMovie(completion: @escaping (Bool) -> Void){
        service.getDetailsMovie(){ Response in
            guard Response != nil else {
                completion(false)
                return }
            self.MovieMain = Response
        }
    }
}
