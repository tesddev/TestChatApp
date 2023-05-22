# TestChatApp

### Technologies used for this project
- FirebaseFirestore
- SDWebImage
- MessageKit
- Kingfisher
- UIKit
- Realm
- IQKeyboardManager

### Task Description
Create a simple app that fetches a collection of posts and also allows you to send and receive messages (Text only) from Firebase Firestore

### Approach Description
##### The UI 
- Programmatically draw up the UI
- SDWebImage for populating images in Home page cells
- MessageKit for organizing the Chat Page messages

##### Login Page
- Created user in database with FirebaseFirestore
- Firestore collection reference was not provided, but was able to figure it out by first fetching users, tried every possible word before finding the right one
- Write access to the database was not granted, but I wrote the implementation for writing users to the database.

##### Feed/Home Page
- Fetched feeds from database.
- Post object from database was very irregular as some `video` keys returned `Bool` data type while other returned string.
- Found out the ones with bool were more than the ones with string, so opted in for the Boolean ones for display.
- Wrote the conditions for configuring my table view cells, by checking keys - `no_media` and `video` to know which would display video or image.
- Firestore collection reference was not provided, but was able to figure it out by first fetching users, tried every possible word before finding the right one

##### Chat Tab
- MessageKit for the UI
- Wrote down the code setup for Firestore listner
- Wrote down the code setup for Realm listner
- Realized that both libraries - `Realm` and `Firestore` have a common class Querry
- This caused an error for setting up both querries on same page.
- Refer to the commented code base for logic

### Short Video Demo of App

https://github.com/tesddev/TestChatApp/assets/58847828/22193e4b-d75e-4961-8743-b9856ef99fca



