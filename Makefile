# Makefile for Flutter commands
.PHONY: ios ios-live android android-prod clean pg d b-i b-a

ios:
	flutter run -d "iPhone 16 Pro" --dart-define-from-file=env/dev.json

ios-prod:
	flutter run -d "iPhone 16 Pro" --dart-define-from-file=env/prod.json

android:
	flutter run -d "CPH2001" --dart-define-from-file=env/dev.json

android-prod:
	flutter run -d "CPH2001" --dart-define-from-file=env/prod.json

clean:
	flutter clean

pg:
	flutter pub get

refresh:
	flutter clean && flutter pub get 

d:
	flutter devices

b-i:
	flutter build ios

b-a:
	flutter build apk

pod-install:
	cd ios && pod install && cd ..

update-loc:
	flutter gen-l10n
