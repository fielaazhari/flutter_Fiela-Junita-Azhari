import 'animal.dart';

class car {
  var capacity = 0;
  List<Animal> load = [];

  void addLoad (Animal add){
    if (capacity >= add.weight) {
      load.add(add);
      capacity -= add.weight;
      print('${add.name} berhasil ditambahkan');
    } else {
      print('${add.name} tidak memenuhi kapasitas');
    }
  }

// task 2
  int totalLoad(){
    var result = 0;
    for (var i in load){
      result += i.weight;
    }
    return result;
  }
}
