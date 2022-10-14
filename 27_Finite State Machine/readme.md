# (27) Finite State Machine
Nomor Urut: 1_011FLB_40

Nama: Fiela Junita Azhari

## Summary
Pada section ini saya belajar tentang Finite State Machine.
3 poin yang saya dapatkan saat pembelajaran pada section ini adalah:
1. Finite State Machine adalah mesin yang memiliki sejumlah state, tiap state menunjukan apa yang terjadi sebelumnya. Terdapat 3 state yang menunjukkan kejadian dalam suatu proses. yaitu IDDLE saat tidak terjadi proses, RUNNING saat proses sedang berjalan, ERROR saat proses gagal diselesaikan.
2. Implementasi pada ViewModel. Menambah Enum, membuat enum untuk masing-masing state: none saat IDDLE, loading saat RUNNING, error saat ERROR. Menambah Getter-Setter, Membuat getter-setter untuk menyimpan state dari widget.
3. Unit State, salah satu jeis pengujian pada perangkat lunak, pengujian dilakukan pada unit dalam perangkat lunak, unit yang dimaksud umumnya adalah fungsi atau method. Mocking, proses yang terikat dengan sistem eksternal dapat mempengaruhi berjalannya pengujian, pengaruh tersebut dapat mengganggu proses pengujian, dilakukan mocking untuk menghindari masalah-masalah tersebut.