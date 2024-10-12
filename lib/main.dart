import 'package:alex_coffee_repository/alex_coffee_repository.dart';
import 'package:very_good_coffee_app/bootstrap.dart';
import 'package:very_good_coffee_app/coffee_app.dart';

void main() {
  // Create an instance of the coffee image repository and inject it into the
  // the instance of the app.
  // This instance of the repository will only be used by the bloc instance.
  bootstrap(() => CoffeeApp(coffeeRepository: AlexCoffeeRepository()));
}
