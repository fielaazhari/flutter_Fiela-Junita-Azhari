# (10) Dart Object Oriented Programming 1
Nomor Urut: 1_011FLB_40

Nama: Fiela Junita Azhari


## Task
![task1](../screenshots/task1.png)
![task2](../screenshots/task2.png)
### jawab
### animal_class
    class Animal {
    Map<String, int> weight = {
        'Ayam': 900,
        'Kucing': 120,
        'Ikan': 140,
        'Semut': 540
    };
    }

### car_class
    class Car {
    int max_load = 2000;
    List animals = ['Ayam', 'Kucing', 'Ikan'];

    List addAnimals(int max_load, int car_load) {
        if (max_load - car_load >= 600) {
        animals.add('Semut');
        }
        return animals;
    }

    int totalLoad(Map<String, int> weight, List animals, int car_load) {
        weight.forEach((key, value) {
        for (String animal in animals) {
            if (animal == key) {
            car_load += value;
            }
        }
        });
        return car_load;
    }
    }

### task.dart
### input 
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

### output
![output](../screenshots/output.png)