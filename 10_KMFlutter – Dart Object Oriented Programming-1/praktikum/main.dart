import 'animal.dart';
import 'car.dart';

void main() {
  var hamster = new Animal();
  hamster.name = 'Hamster';
  hamster.weight = 40;

  var kucing = new Animal();
  kucing.name = 'Kucing';
  kucing.weight = 70;

  var kelinci = new Animal();
  kelinci.name = 'Kelinci';
  kelinci.weight = 40;

  var truk = car();
  truk.capacity = 110;
  truk.addLoad(hamster);
  truk.addLoad(kucing);
  truk.addLoad(kelinci);

  print('Hewan yang ada di dalam mobil : ');
  var nomer = 1;
  for (var i in truk.load) {
    print('$nomer. ${i.name}');
    nomer++;
  }

  // Task 2
  print('Total Muatan yang terdapat pada Mobil adalah : ${truk.totalLoad()}');
}
