import WatchKit
import SwiftUI
import UserNotifications

class NotificationController: WKUserNotificationHostingController<NotificationView> {
    var title: String = ""
    var subTitle: String = ""
    var imageURL: String = ""


    override var body: NotificationView {
        return NotificationView(
            title: title, subtitle: subTitle, imageURL: imageURL
        )
    }

    override func willActivate() {
        super.willActivate()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    override func didReceive(_ notification: UNNotification) {
        let notificationData = notification.request.content.userInfo as? [String : Any]
        let apn = notificationData?["aps"] as? [String: Any]
        let body = apn?["alert"] as? [String: Any]

        title = body?["title"] as? String ?? ""
        subTitle = body?["subtitle"] as? String ?? ""

        imageURL = notificationData?["customURL"] as? String ?? ""
    }
}
