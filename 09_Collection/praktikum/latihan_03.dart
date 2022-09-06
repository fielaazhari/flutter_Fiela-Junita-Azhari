void main(List<String> args) {
  if (args.length > 2) {
    double? angka1, angka2;
    angka1 = double.tryParse(args[0]);
    angka2 = double.tryParse(args[2]);
    var operator = args[1];
    double? hasil;
    if (angka1 != null && angka2 != null) {
      switch (operator.toLowerCase()) {
        case '+':
          hasil = angka1 + angka2;
          break;
        case '-':
          hasil = angka1 - angka2;
          break;
        case 'x':
          hasil = angka1 * angka2;
          break;
        case '/':
          hasil = angka1 / angka2;
          break;
        default:
          print('Operator tidak dikenali.');
      }
      if (hasil != null) print('$angka1 $operator $angka2 = $hasil');
    } else {
      print('Angka yang anda input tidak sesuai.');
    }
  } else {
    print('Anda belum memberikan operasi yang sesuai.');
  }
}
