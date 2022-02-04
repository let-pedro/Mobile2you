
import Foundation

class DetailsViewModel {
  
    private let urlApi = URL(string: "https://api.themoviedb.org/3/")!
    private let key = "2bfbb8aa118e2166f72181d413f39c9f"
    

    func getDetailsMovie(completion: @escaping (Movie) -> Void){
        let api = URL(string: "\(urlApi)" + "movie/46195?api_key=\(key)&language=en-US")
        
        guard  api != nil else {
            print("Not found url")
            return
        }
        
        URLSession.shared.dataTask(with: api!) { (data, response, error) in
            if error != nil {
                print("error \(String(describing: error?.localizedDescription))")
            }
            
            guard let data = data else { return }
            
            
            do {
               let MovieData = try JSONDecoder().decode(Movie.self, from: data)
                completion(MovieData)
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func getListMovie(completion: @escaping ([Movie]) -> Void){
        let api = URL(string: "\(urlApi)" + "discover/movie?sort_by=popularity.desc&api_key=\(key)")
        
        guard  api != nil else {
            print("Not found url")
            return
        }
        
        URLSession.shared.dataTask(with: api!) { (data, response, error) in
            if error != nil {
                print("error \(String(describing: error?.localizedDescription))")
            }
            
            guard let data = data else { return }
            
            
            do {
               let MovieData = try JSONDecoder().decode(MovieResult.self, from: data)
                completion(MovieData.results)
            } catch {
                print("error: \(error.localizedDescription)")
            }
        }.resume()
    }
}
