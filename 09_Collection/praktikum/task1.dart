void main(List<String> args) async {
  List data = [1234, 5678, 1706];

  int pengali = 2;
  print(await fungsi(data, pengali));
}

Future<List> fungsi(List data, int pengali) async {
  List baru = [];
  for (int d in data) {
    int hasil = d * pengali;
    baru.add(hasil);
  }
  return baru;
}