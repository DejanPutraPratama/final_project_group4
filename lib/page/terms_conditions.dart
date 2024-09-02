import 'package:flutter/material.dart';

class TermsConditions extends StatelessWidget {
  const TermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    double devicewidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 120),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                'Selamat datang di Storebage. Dengan menggunakan aplikasi ini, Anda setuju untuk mematuhi dan terikat oleh Syarat & Ketentuan berikut. Harap baca dengan cermat sebelum menggunakan layanan kami.'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '1. Penerimaan Syarat',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Dengan mengakses atau menggunakan aplikasi [Nama Aplikasi Bank Sampah], Anda menyetujui Syarat & Ketentuan ini. Jika Anda tidak setuju dengan salah satu ketentuan ini, Anda tidak diperbolehkan menggunakan aplikasi ini.',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '2. Layanan yang Disediakan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                'Storebag menyediakan layanan digital untuk pengelolaan dan penukaran sampah melalui sistem bank sampah. Pengguna dapat menyetor sampah, memantau saldo, dan menukarkan sampah dengan imbalan tertentu sesuai dengan ketentuan yang berlaku.',
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '3. Pendaftaran Akun',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
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
                          'Kelayakan: Anda harus berusia minimal 12 tahun untuk mendaftar dan menggunakan layanan ini.',
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
                          'Informasi Akun: Anda setuju untuk memberikan informasi yang benar, akurat, dan lengkap saat mendaftar. Anda bertanggung jawab atas kerahasiaan akun Anda dan semua aktivitas yang terjadi di bawah akun Anda.',
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
                          'Keamanan Akun: Jika Anda mencurigai adanya pelanggaran keamanan atau penggunaan yang tidak sah atas akun Anda, segera hubungi kami.',
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
              '4. Penggunaan Aplikasi',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
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
                          'Kepatuhan terhadap Hukum: Anda setuju untuk menggunakan aplikasi ini hanya untuk tujuan yang sah dan sesuai dengan Syarat & Ketentuan ini.',
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
                          'Larangan Penggunaan: Anda tidak diperbolehkan menggunakan aplikasi ini untuk aktivitas yang melanggar hukum, merusak, atau menipu.',
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
                          'Hak Penyedia: Kami berhak menangguhkan atau menghentikan akses Anda ke layanan jika Anda melanggar Syarat & Ketentuan ini atau terlibat dalam aktivitas yang merugikan aplikasi atau pengguna lain.',
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
              '5. Kebijakan Transaksi',
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
              '6. Pembaruan dan Perubahan Layanan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                    'Kami berhak untuk memperbarui, mengubah, atau menghentikan sementara atau permanen layanan atau fitur tertentu dalam aplikasi tanpa pemberitahuan sebelumnya. Kami tidak bertanggung jawab atas perubahan tersebut yang mungkin mempengaruhi akses atau penggunaan Anda atas layanan.')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '7. Batasan Tanggung Jawab',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
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
                          'Layanan "Apa Adanya": Aplikasi ini disediakan "sebagaimana adanya" dan "sebagaimana tersedia" tanpa jaminan apapun, baik tersurat maupun tersirat.',
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
                          'Kerugian Tidak Langsung: Kami tidak bertanggung jawab atas kerugian tidak langsung, insidental, atau konsekuensial yang timbul dari penggunaan atau ketidakmampuan menggunakan aplikasi ini.',
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
              '8. Hukum yang Berlaku',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                    'Syarat & Ketentuan ini diatur oleh dan ditafsirkan sesuai dengan hukum yang berlaku di Indonesia. Setiap sengketa yang timbul dari Syarat & Ketentuan ini akan diselesaikan di pengadilan yang berwenang di negara Indonesia.')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '9. Perubahan Syarat & Ketentuan',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                    'Kami dapat memperbarui Syarat & Ketentuan ini dari waktu ke waktu. Perubahan akan diberitahukan melalui aplikasi atau email. Anda dianjurkan untuk meninjau Syarat & Ketentuan ini secara berkala.')),
            const SizedBox(
              height: 10,
            ),
            const Text(
              '10. Kontak Kami',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  children: [
                    const Text(
                        'Jika Anda memiliki pertanyaan atau kekhawatiran tentang Syarat & Ketentuan ini, silakan hubungi kami di:'),
                    Column(
                      children: [
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
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
