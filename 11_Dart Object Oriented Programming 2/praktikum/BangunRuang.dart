class BangunRuang {
 var panjang;
 var lebar;
 var tinggi;
 volume () {}
}

class Kubus extends BangunRuang {
  var sisi;
  @override
  volume() {
    sisi = 6;
    return sisi*sisi*sisi;
  }
}

class Balok extends BangunRuang {
  @override
  volume() {
    panjang = 10;
    lebar = 20;
    tinggi = 30;
    return panjang*lebar*tinggi;
  }
}

void main(List<String> args) {
  var a = Kubus();
  print("Volume Kubus adalah: ${a.volume()}");

  var b = Balok();
  print("Volume Balok adalah: ${b.volume()}");

}