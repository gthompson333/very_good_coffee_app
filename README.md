# very_good_coffee_app

[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
A Flutter app that allows a user to load a coffee image from a remote network
endpoint.

In addition, the user can tap a "favorite" button to store the image in the devices local
photo gallery.

The user can also tap a "photos" button to see all of the user's favorite photos that are stored
in the device's local photo gallery.

The app is designed to run on both iOS and Android.

## Instructions to build and run
Simply clone the repo.
Launch either your Android emulator or iOS simulator.
Run the app's main.dart main function.
The app should build and run without issue.
The user should see a coffee image appear upon launch.
There are three buttons in the upper right.
From left to right:
- Select the image as a favorite.
- Launch the photo gallery.
- Fetch a new coffee image.

After "favoriting" an image, a snackbar notification should appear letting the user know
the image was successfully saved to the device's photo gallery.

The user can then tap the "photo gallery" button to see the image stored locally on the device
in the photo gallery.

## Minimum User Requirements
As a user, I should be able to:

- Open the app and load a new coffee image from the network.

- Load a new coffee image if the current one is not my favorite.

- Save the current coffee image locally if I really like it, so I can access my
  favorite coffee images at any time, even if I don’t have internet access.

- Make sure any loading/error states are handled correctly.

## Technical Requirements
- The application should pull the coffee images from the free API https://coffee.alexflipnote.dev
  Fetch a random image file: https://coffee.alexflipnote.dev/random
  Fetch a JSON packet that contains the image URL: https://coffee.alexflipnote.dev/random.json
  Response: {"file":"https://coffee.alexflipnote.dev/DQOenUeYOcQ_coffee.jpg"}

- The application should run on iOS and Android (no need to include Web/Desktop)

## Assumptions
- The primary view will display a single coffee image.
- The primary view will have an icon to "favorite" the image currently displayed.
- Upon "favoriting" the image, the image will be stored locally on the device.
- The primary view will contain a button that allows for accessing the network and fetching
  a new random image.
- The primary view will contain a button that allows for accessing locally stored favorite images.
- Upon launching the app for the first time, the app will automatically attempt to fetch a
  coffee image.

[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
