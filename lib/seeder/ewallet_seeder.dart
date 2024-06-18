import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project_group4/model/ewalletmodel.dart';

Future<void> seedEWalletData() async {
  try {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    List<EWallet> eWallets = [
      EWallet(
        id: 'gopay',
        name: 'GoPay',
        imageUrl:
        'https://brandlogos.net/wp-content/uploads/2022/10/gopay-logo_brandlogos.net_gph3u-512x512.png',
      ),
      EWallet(
        id: 'ovo',
        name: 'OVO',
        imageUrl:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjh7g2365nYnQ-FMqIeelmm0ilU5zPfUCTgkD1lAKA4YDIrxSciQyp1vRw-V7XFaHxO7g2jx6vsli1B8skSVRigOx1lDSgK9ubiPGoHx0QD9yM-c2gs5uIaZ9SuxQfQpYShJdUsqV0-m2KDMpo9j2UlZuCGWPt0PzRTusjtnNMYGF9SXkjfdOyNhUOr/s320/GKL14_OVO%20-%20Koleksilogo.com.jpg',
      ),
      EWallet(
        id: 'shopeepay',
        name: 'ShopeePay',
        imageUrl:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEjC8J0HHOLKSppss14Im84sOJ5D-qB0LAKsxZ8esss0VNs2LJhNYR4S9KCDV7q-U332uEe9BlF1E7rzW6tqvrZfGiivxobhls2I2E9dWgok7LzdJuNOp_s-h4RmUvc4ENhs-RZ9hVEgrPkK9DUlTvhzOFY-WW0CYEAI_xgSFRjmLLYf77QOxNC5yg/w320-h141/ShopeePay%20Logo%20-%20%20(Koleksilogo.com).png',
      ),
      EWallet(
        id: 'dana',
        name: 'DANA',
        imageUrl:
        'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEipDaD-39vGN38RrBmUjfY5jz9yDK2SdbcuFd20a4b0t1Vkb97hlXQFHE1Tic8ys4Kwa0eghASHcp7OgcGibXZ5qiiY6_gSKs8RwGkxymcUmdzQtdZ2eKe2SswYtrEPBSM9DQjD3_eeB84ZE_b2WiTTbZGkTIGT516Rdie-i2tP7Jm8RsGcadsPQ/w400-h116/Logo%20DANA%20-%20%20(Koleksilogo.com).png',
      )
    ];

    CollectionReference eWalletsCollection = firestore.collection('ewallets');
    WriteBatch batch = firestore.batch();

    eWallets.forEach((wallet) {
      DocumentReference walletDocRef = eWalletsCollection.doc(wallet.id);
      batch.set(walletDocRef, wallet.toMap());
    });

    await batch.commit();
    print('berhasil seeding');
  } catch (e) {
    print('noh data ga berhasil ini ni $e');
    throw e;
  }
}

void main() {
  seedEWalletData();
}
