import 'dart:io';

double diskon(double a) {
  if (a > 500000) {
    a *= 85 / 100;
  } else if (a > 100000) {
    a * 90 / 100;
  } else {}
  return a;
}

double diskon2(double a) {
  String d;
  if (a > 100000) {
    a *= 95 / 100;
  }
  return a;
}

void main () {
  print("apakah anda member? 1/2");
  var member = stdin.readLineSync();
  print("masukkan total belanja");
  double harga = double.parse(stdin.readLineSync()!);
  double hasil;
  if (member == 1) {
    hasil = diskon(harga);
  } else {
    hasil = diskon2(harga);
  }

  print("total harga sebelum diskon $harga");
  print("total harga setelah diskon $hasil");
}