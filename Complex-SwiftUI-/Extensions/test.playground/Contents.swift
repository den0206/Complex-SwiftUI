import UIKit

var str = "Hello, playground"

func gettranslate() -> String {
    let selected_language = "en"
    let target_language = "hi"
    let YourString = "hello"

    let GoogleUrl = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=" + selected_language + "&tl=" + target_language + "&dt=t&dt=t&q=" + YourString
    
    return GoogleUrl

}

print(gettranslate())
print("aa")
