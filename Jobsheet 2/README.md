# Pemrograman-Mobile2025
Mata Kuliah Pemrograman Mobile semester 5

2. Mengapa sangat penting untuk memahami bahasa pemrograman Dart sebelum kita menggunakan framework Flutter ? Jelaskan!
    1.  Flutter dibangun di atas Dart. Tanpa paham Dart, Flutter hanya akan jadi kumpulan kode yang sulit dimengerti.
    2.  Dasar logika program. Konsep variabel, fungsi, dan OOP di Dart adalah pondasi utama dalam memahami struktur     Widget  di Flutter.
    3.  Mudah debugging. Pemahaman Dart membuat kita bisa membaca error dan memperbaiki bug dengan cepat.
    4.  Fleksibilitas pengembangan. Dengan Dart, kita bisa menulis logika bisnis, custom widget, dan fitur kompleks, tidak hanya mengandalkan widget bawaan.
    5.  Efisiensi belajar. Menguasai Dart terlebih dahulu membuat proses belajar Flutter lebih cepat, terarah, dan tidak membingungkan.

3. Rangkumlah materi dari codelab ini menjadi poin-poin penting yang dapat Anda gunakan untuk membantu proses pengembangan aplikasi mobile menggunakan framework Flutter.
    1.	Struktur Dasar Program Dart
        •	Fungsi utama void main() adalah entry point aplikasi.
        •	Perulangan (for) digunakan untuk mengulang eksekusi kode dengan syarat tertentu.
    2.	Konsep Perulangan (Looping)
        •	for (init; kondisi; increment/decrement) → mengontrol proses perulangan.
        •	Bisa digunakan untuk menghasilkan data berulang seperti teks, angka, atau widget.
        •	i++ untuk naik, i-- untuk turun.	
    3.	String Interpolation
        •	Menggunakan ${variabel} atau $variabel untuk menampilkan nilai variabel dalam teks.
    4.	Output yang Dinamis
        •	Output bisa dibuat menyesuaikan nilai variabel di setiap iterasi loop.
        •	Contoh kasus: mencetak umur yang menurun dari 18 ke 9.
    5.	Kustomisasi Output
        •	String dapat diganti sesuai kebutuhan, misalnya nama, angka, atau kalimat tertentu.
        •	Penting untuk memahami bagaimana menggabungkan teks dan nilai variabel.
    6.	Hubungan dengan Flutter
        •	Prinsip loop dan string interpolation ini sangat berguna dalam Flutter, misalnya:
            a.	Membuat list widget secara otomatis (ListView.builder).
            b.	Menampilkan data dinamis dari API.
            c.	Menggenerate teks, tombol, atau card berdasarkan data.
    7.	Best Practice
        •	Gunakan nama variabel yang jelas (umur, index, nama).
        •	Pastikan loop memiliki batas agar tidak berjalan tanpa henti.
        •	Pisahkan logika (loop, variabel) dengan UI agar kode rapi.

4. Buatlah penjelasan dan contoh eksekusi kode tentang perbedaan Null Safety dan Late variabel !
    1.	Null Safety:
        •	Membantu mencegah error akibat penggunaan variabel bernilai null.
        •	Variabel non-nullable harus diisi sejak awal, sedangkan variabel nullable (ditandai dengan ?) boleh kosong namun harus dicek sebelum dipakai.
    2.	Late Variable:
        •	Digunakan untuk variabel yang pasti akan diinisialisasi, tetapi ditunda pengisiannya sampai waktu tertentu.
        •	Jika dipanggil sebelum diberi nilai, akan terjadi runtime error.
    3.	Perbedaan Utama:
        •	Null Safety fokus pada keamanan nilai variabel agar tidak terjadi null reference.
        •	Late Variable fokus pada penundaan inisialisasi, dengan keyakinan nilai akan diisi sebelum digunakan.
