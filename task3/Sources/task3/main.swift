import Foundation
import Alamofire


var nickname: String?
getNickname()
RunLoop.main.run()

func getNickname(){
    print("Введите никнейм")
    nickname = readLine()
    guard let nick = nickname, nick.count > 0 else {
        getNickname()
        return
    }
    getRepositoryList(nickname: nick)
}

func getRepositoryList(nickname: String){
let url = "https://api.github.com/users/\(nickname)/repos"
    AF.request(url.self).responseDecodable(of: Repos.self) { (response) in
        switch response.result{
        case .success(_) :
            print("Список репозиториев: ")
            for repo in response.value!{
                print(repo.name)
            }
            print("Нажмите ctrl+c для выхода из программы")
        case .failure(_):
            print("Вы неправильно ввели никнейм")
            getNickname()
        }
    }
}


