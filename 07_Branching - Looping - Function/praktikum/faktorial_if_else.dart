String if_else(int nilai) {
  if (nilai > 70) {
    return "A";
  } else if (nilai > 40) {
    return "B";
  } else if (nilai > 0) {
    return "C";
  } else {
    return "";
  }
}

void faktorial(bil) {
  double hasil = 1;
  for (int i = 1; i <= bil; i += 1) {
    hasil *= i;
  }
  print("Nilai faktorial dari $bil = $hasil");
}

void main(List<String> args) {
  int nilai = 100;
  print("Nilai $nilai mendapatkan Grade ${if_else(nilai)}");
  nilai = 50;
  print("Nilai $nilai mendapatkan Grade ${if_else(nilai)}");
  nilai = 20;
  print("Nilai $nilai mendapatkan Grade ${if_else(nilai)}");

  int bil = 10;
  faktorial(bil);
  bil = 20;
  faktorial(bil);
  bil = 30;
  faktorial(bil);
}