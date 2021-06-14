import UIKit

class MessageDecryptor: NSObject {
    
    func decryptMessage(_ message: String) -> String {
        var formattedMessage = message
        if formattedMessage.first == "[" {
            formattedMessage.removeFirst()
            formattedMessage.removeLast()
        }
        var stack = [(String, Int)]()
            var result = ""
            var num = 0

            for char in formattedMessage {
                switch char {
                case "[":
                    stack.append((result, num))
                    result = ""
                    num = 0
                case "]":
                    let (prev, num) = stack.removeLast()
                    result = prev + String(repeating: result, count: num)
                case _ where char.isNumber:
                    num *= 10
                    num += Int(String(char))!
                default:
                    result += String(char)
                }
            }
            return result
    }
}
