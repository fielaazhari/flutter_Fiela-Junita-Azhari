void main(List<String> args) {
  if (args.length > 0) {
    switch (args[0]) {
      case '--version':
        print('Version 1.0');
        break;
      case '--help':
        print('Ini adalah halaman help');
        print('--version\t: Menampilkan versi aplikasi');
        print('--help\t\t: Menampilkan bantuan aplikasi');
        print('--hay\t\t: Menampilkan salam dari aplikasi');
        break;
      case '--hay':
        if (args.length > 1) {
          print('Hay ${args[1]}');
        } else {
          print('Hallo, selamat malam');
        }
        break;
      default:
        print(
            'Flag tidak dikenali, silakan gunakan flag --help untuk bantuan.');
    }
  } else {
    print('Tidak ada argumen yang diberikan...');
  }
}
