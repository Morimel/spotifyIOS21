import Foundation

class SearchManager {
    // Замените "YOUR_ACCESS_TOKEN" на свой OAuth-токен Spotify
    
    static let sharedS = SearchManager()
    
    var accessToken = "BQCOPGaYw52M7cGFd1WOhm2wKORJ0qv72ZvY-qNqBuk54QieSZBgI6HvQF2pT4SaxPyhTPi9yp_Uo4sihz-xTppO_26sEHenQJ4FGk4QM5Jgcyyt5-1JM3VeP0zzUp7aT7aWsOHc9CtUfX1BZ9DQAYgY7Y8ziyuSB2izlUN1LRfvoHdqTXmoQabqNQX6vagRuDaxQEqTMyCjJQ18fH5fQ9VR72wHmTqIev9BqiuWLL_HVH6ofoGf1OychIfoN7umVrI0nt_xa5tWjahoCzVvm95xn0NRJt3iouYEQMqm5-g0WZGVMaGEjg"
    
    // Замените "your_search_query" на ваш запрос поиска
    var searchQuery: String = "Imagine Dragons"
    
    init() {}
        // Кодируем searchQuery
        func queryS() {
            if let encodedQuery = searchQuery.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                // Формируем URL с использованием URLComponents
                var urlComponents = URLComponents(string: "https://api.spotify.com/v1/search")
                urlComponents?.queryItems = [
                    URLQueryItem(name: "q", value: encodedQuery),
                    URLQueryItem(name: "type", value: "track")
                ]
                
                // Создаем URLRequest с учетом авторизации по токену
                if let url = urlComponents?.url {
                    var request = URLRequest(url: url)
                    request.httpMethod = "GET"
                    request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
                    
                    // Создаем URLSession
                    let session = URLSession.shared
                    
                    // Создаем задачу для выполнения запроса
                    let task = session.dataTask(with: request) { (data, response, error) in
                        if let error = error {
                            print("Error: \(error)")
                        } else if let data = data {
                            // Обработка полученных данных
                            do {
                                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                                    print("Response JSON: \(json)")
                                    
                                    // Здесь вы можете обработать ответ от Spotify API
                                }
                            } catch {
                                print("Error decoding JSON: \(error)")
                            }
                        }
                    }
                    
                    // Запускаем задачу
                    task.resume()
                    
                } else {
                    print("Invalid URL")
                }
                
            } else {
                print("Failed to encode searchQuery")
            }
        }
        }
        
    
    
    // Использование класса
    let searchManager = SearchManager()
    
    

