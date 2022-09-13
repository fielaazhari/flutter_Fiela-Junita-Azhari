class Matematika {
 hasil () {}
}

class KPK implements Matematika {
  var x;
  var y;
  @override
  hasil() {
    x = 20;
    y = 26;
    return (x * y / x.gcd(y)).toInt();
  }
}

class FPB implements Matematika {
  @override
  var x;
  var y;
  @override
  hasil() {
    x = 10;
    y = 16;
    return (x.gcd(y));
  }
}

void main(List<String> args) {
  var a = KPK();
  print("Nilai KPK adalah: ${a.hasil()}");

  var b = FPB();
  print("Nilai FPB adalah: ${b.hasil()}");

}