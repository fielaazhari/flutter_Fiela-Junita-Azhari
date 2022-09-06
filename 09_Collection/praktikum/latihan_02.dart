import 'dart:io';

void main(List<String> args) {
  // Menentukan ukuran matrix
  var baris = 0;
  var kolom = 0;
  stdout.write('Masukan jumlah baris matrix: ');
  baris = int.parse(stdin.readLineSync()!);
  stdout.write('Masukan jumlah kolom matrix: ');
  kolom = int.parse(stdin.readLineSync()!);

  // Mengisi nilai matrix
  var matrix = [];
  for (var i = 0; i < baris; i++) {
    matrix.add([]);
    for (var j = 0; j < kolom; j++) {
      stdout.write('Masukan nilai pada [${i + 1},${j + 1}]: ');
      var input = int.parse(stdin.readLineSync()!);
      matrix[i].add(input);
    }
  }

  // Menghitung total, rata-rata, min, dan max untuk setiap baris
  for (var i = 0; i < matrix.length; i++) {
    var totalNilai = matrix[i][0];
    var min = matrix[i][0];
    var max = matrix[i][0];
    for (var j = 1; j < matrix[i].length; j++) {
      // mencari total nilai per baris
      totalNilai += matrix[i][j];
      // Mencari nilai minimum
      if (min > matrix[i][j]) {
        min = matrix[i][j];
      }
      if (max < matrix[i][j]) {
        max = matrix[i][j];
      }
    }
    print('Total nilai pada baris ke-${i + 1} ${matrix[i]}: $totalNilai');
    print(
        'Rata-rata nilai pada baris ke-${i + 1} ${matrix[i]}: ${totalNilai / matrix[i].length}');
    print('Nilai minimum pada baris ke-${i + 1} ${matrix[i]}: $min');
    print('Nilai maksimum pada baris ke-${i + 1} ${matrix[i]}: $max');
    print('============================================');
  }
}
