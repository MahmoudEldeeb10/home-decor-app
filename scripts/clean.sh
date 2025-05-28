#!/bin/bash

#chmod +x scripts/clean.sh
#./scripts/clean.sh
echo "Cleaning Flutter project..."

flutter clean
rm -rf ios/Pods
rm -rf ios/Podfile.lock
rm -rf ios/.symlinks
rm -rf ios/Flutter/Flutter.framework
rm -rf ios/Flutter/Flutter.podspec
rm -rf build
rm -rf pubspec.lock

echo "Running flutter pub get..."
flutter pub get

echo "Done cleaning and fetching dependencies."
