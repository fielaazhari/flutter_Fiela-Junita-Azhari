void main(List<String> args) {
  List a = [
    [1, 17],
    [2, 36]
  ];

  Map k_list = {};
  k_list[a[0][0]] = a[0][1];
  k_list[a[1][0]] = a[1][1];
  print(k_list);
}