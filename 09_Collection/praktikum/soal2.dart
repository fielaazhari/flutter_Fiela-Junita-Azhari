void main(List<String> args) {
  var nilai;
  var jumlah;
  var ratarata;
  var angka = [
    [2, 4, 6, 3],
    [7, 3, 9, 5],
    [9, 5, 13, 13],
    [14, 15, 17, 11],
    [3, 1, 18, 20]
  ];

  for (nilai in angka) {
    jumlah - nilai[0] + nilai[1] + nilai[2] + nilai[3];

    print("-----JUMLAH $nilai -----");
    print(jumlah);

    ratarata - jumlah / nilai.length;
    print("-----Rata-rata $nilai -----");
    print(ratarata);
  }
}