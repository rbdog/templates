# Firebase App Distribution CLI

# iOS
firebase appdistribution:distribute path/to/mobile_app.ipa --app 1:77777777777:ios:6666666666666666666666 --groups "ios-testers" --token "$FIREBASE_TOKEN" --release-notes-file "path/to/release_notes.txt"

# Android 
firebase appdistribution:distribute path/to/mobile_app.aab --app 1:99999999999:android:8888888888888888888888 --groups "android-testers" --token "$FIREBASE_TOKEN" --release-notes-file "path/to/release_notes.txt"
