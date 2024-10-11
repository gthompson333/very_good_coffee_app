# very_good_coffee_app

A Flutter app that allows a user to load, favorite, and save coffee images from a remote network
endpoint.

The app is designed to run on both iOS and Android.
The Web, MacOS, Windows and Linux are not currently supported.

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
  a new random image. Note: This button will be disabled if the device is offline.
- The primary view will contain a button that allows for accessing locally stored favorite images.
  Note: This button will be disabled if there are no favorite images stored locally.
- Upon launching the app for the first time, the primary view will display an empty view with some
  text to fetch an image from the network.

## Build and run instructions

## Running Tests 🧪

To run all unit and widget tests use the following command:

TBD

To view the generated coverage report you can
use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

---

