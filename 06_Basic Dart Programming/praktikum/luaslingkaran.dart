import 'dart:io';

void main() 
{
  const phi = 3.14;
  var jari;
  stdout.write('Masukkan panjang jari-jari lingkaran: ');
  jari = stdin.readLineSync();
  double hasiljari = double.parse(jari);
  double luas = phi * hasiljari * hasiljari;
  print("Luas lingkaran adalah $luas");
}