import 'animal_class.dart';
import 'car_class.dart';

void main(List<String> args) {
  var animal = Animal();
  var car = Car();
  int max_load = car.max_load;
  List animals = car.animals;
  int car_load = 0;

  print('Before adding animal = $animals');

  print(
      'Total Load before adding animal = ${Car().totalLoad(animal.weight, animals, car_load)} ');

  List new_load = Car().addAnimals(max_load, car_load);
  print('After adding animal = ${new_load}');

  print(
      'Total Load after adding animal = ${Car().totalLoad(animal.weight, new_load, car_load)}');
}
