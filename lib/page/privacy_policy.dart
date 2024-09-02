import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    double devicewidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Kami di Storbage menghargai privasi Anda dan berkomitmen untuk melindungi informasi pribadi Anda. Kebijakan Privasi ini menjelaskan bagaimana kami mengumpulkan, menggunakan, dan melindungi data pribadi Anda saat menggunakan aplikasi kami.'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '1. Informasi yang Dikumpulkan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  const Text(
                    'Kami dapat mengumpulkan berbagai jenis informasi untuk menyediakan dan meningkatkan layanan kami kepada Anda, termasuk:',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text('\u2022'),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Informasi Pribadi: Nama, alamat email, nomor telepon, alamat rumah, dan informasi lain yang Anda berikan saat mendaftar atau menggunakan aplikasi.',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          '\u2022',
                        ),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Data Transaksi: Informasi mengenai transaksi bank sampah, seperti jumlah sampah yang disetor, jenis sampah, dan nilai tukar.',
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          '\u2022',
                        ),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Informasi Lokasi: Kami dapat mengumpulkan data lokasi untuk menyediakan fitur yang memerlukan informasi lokasi, seperti menemukan bank sampah terdekat.',
                        ),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text(
                          '\u2022',
                        ),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Informasi Teknis: Data teknis seperti alamat IP, jenis perangkat, sistem operasi, dan riwayat aktivitas aplikasi.',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '2. Penggunaan Informasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  const Text(
                    'Informasi yang kami kumpulkan akan digunakan untuk:',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text('\u2022'),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Menyediakan, mengelola, dan meningkatkan layanan aplikasi.',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text('\u2022'),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Memproses transaksi dan memberikan laporan kepada pengguna.',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text('\u2022'),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Mengirimkan pemberitahuan penting terkait penggunaan aplikasi.',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text('\u2022'),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Memenuhi kewajiban hukum dan peraturan yang berlaku.',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '3. Berbagi Informasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  const Text(
                    'Kami tidak akan membagikan informasi pribadi Anda kepada pihak ketiga kecuali:',
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text('\u2022'),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Dengan persetujuan Anda.',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text('\u2022'),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Untuk mematuhi peraturan hukum, perintah pengadilan, atau proses hukum.',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text('\u2022'),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Dengan penyedia layanan pihak ketiga yang membantu kami dalam menjalankan layanan, yang wajib menjaga kerahasiaan informasi Anda.',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(right: 5),
                        child: Text('\u2022'),
                      ),
                      SizedBox(
                        width: devicewidth * 0.8,
                        child: const Text(
                          'Memenuhi kewajiban hukum dan peraturan yang berlaku.',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '4. Keamanan Informasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                    'Kami mengambil langkah-langkah yang wajar untuk melindungi informasi pribadi Anda dari akses, penggunaan, atau pengungkapan yang tidak sah. Namun, harap diingat bahwa tidak ada metode transmisi melalui internet atau metode penyimpanan elektronik yang 100% aman.')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '5. Hak Anda',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                    'Anda memiliki hak untuk mengakses, memperbaiki, atau menghapus informasi pribadi Anda yang kami simpan. Anda juga dapat menolak atau membatasi pemrosesan informasi Anda dalam keadaan tertentu. Untuk menggunakan hak-hak ini, silakan hubungi kami melalui detail kontak di bawah ini.')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '6. Perubahan Kebijakan Privasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                    'Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu. Setiap perubahan akan diberitahukan melalui aplikasi kami atau melalui email. Kami mendorong Anda untuk secara berkala meninjau Kebijakan Privasi ini untuk tetap mendapatkan informasi terbaru tentang bagaimana kami melindungi informasi Anda.')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '7. Kontak Kami',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    const Text(
                        'Jika Anda memiliki pertanyaan atau kekhawatiran tentang Kebijakan Privasi ini, atau jika Anda ingin menggunakan hak-hak Anda, silakan hubungi kami di mana kek.'),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text('\u2022'),
                        ),
                        SizedBox(
                          width: devicewidth * 0.8,
                          child: const Text(
                            'Email\t\t\t\t\t\t: Kelompok4@gmail.com',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text('\u2022'),
                        ),
                        SizedBox(
                          width: devicewidth * 0.8,
                          child: const Text(
                            'Telepon\t: 0812345678',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(right: 5),
                          child: Text('\u2022'),
                        ),
                        SizedBox(
                          width: devicewidth * 0.8,
                          child: const Text(
                            'Alamat\t\t: Jl. Apa Kek',
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
