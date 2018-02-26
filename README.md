Allows integration of LiveChatInc's iOS SDK with cordova projects

Methods:

navigator.initLiveChat((string) license, (string) groupId, (string) accountNumber, (string) name (func) callback)

	- Initializes the LiveChat instance with the provided values. Should only be called once per chat session

navigator.openLiveChat((func) callback)

	- Presents the LiveChat Widget
