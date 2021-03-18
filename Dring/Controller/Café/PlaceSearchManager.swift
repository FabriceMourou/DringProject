import Foundation

enum PlaceSearchManagerError: Error {
    case failedToGetInformationForPlace
    case failedToCreateURLForPlace
    case failedToGetDataForPlace
}

class PlaceSearchManager {
    
    private var networkManager: NetworkManagerProtocol
    private var urlComponents: URLComponentsProtocol
    
    init (
        networkManager: NetworkManagerProtocol = NetworkManager(),
        urlComponents: URLComponentsProtocol = URLComponents()
    ) {
        self.networkManager = networkManager
        self.urlComponents = urlComponents
    }
    
    
    func fetchPlacesFrom(place: [String], completion: @escaping (Result<String, PlaceSearchManagerError>) -> Void) {
        
        guard !place.isEmpty else {
            completion(.failure(.failedToGetDataForPlace))
            return
        }
        
        guard let  url = getPlaceURL(place: place) else {
            completion(.failure(.failedToCreateURLForPlace))
            return
        }
        
        networkManager.fetch(url: url) {  [weak self] (result: Result<PlaceSearchResponse, NetworkManagerError>) in
            
            switch result {
            case .success(let response):
                guard let results = response.results?.first?.name else { return }
                
                
            
                completion(.success(results))
                
                
            case .failure:
                completion(.failure(.failedToGetInformationForPlace))
            }
            
        }
        
    }
    
    private func getPlaceURL(place: [String]) -> URL? {
        
        let placeQuery = place.reduce("") { (partialResult, iterationPlace) -> String in
            return "\(partialResult),\(iterationPlace)"
        }
        
        urlComponents.scheme = "https"
        urlComponents.host = "translation.googleapis.com"
        urlComponents.path = "/api/place/textsearch"
        urlComponents.queryItems = [
            .init(name: "key", value: "AIzaSyDtmMVvnki4g7JWBLlZ7rR2HgqJCsRD534"),
            .init(name: "q", value: placeQuery)
        ]
        
        return urlComponents.url
    }
    
    
    
    
    
    
    
    
    
    
}

protocol URLComponentsProtocol {
    var scheme: String? { get set }
    var host: String? { get set }
    var path: String { get set }
    var queryItems: [URLQueryItem]? { get set }
    var url: URL? { get }
}

extension URLComponents: URLComponentsProtocol { }
