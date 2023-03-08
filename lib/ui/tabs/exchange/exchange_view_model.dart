import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:wru/data/model/card/card.dart';
import 'package:wru/data/model/sent_card/sent_card.dart';
import 'package:wru/data/repository/exchange/exchange_repository_impl.dart';

class QRCodeNotifier extends StateNotifier<Barcode> {
  QRViewController? controller;
  QRCodeNotifier() : super(Barcode(null, BarcodeFormat.unknown, null));

  //QRコードを読み取ったあとの処理を書く
  //受け取り画面に遷移と受け取った名刺をfirebaseに保存
  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    this.controller!.scannedDataStream.listen((scanData) {
      state = scanData;
    });
  }
}

final myQrCodeInfoProvider = FutureProvider((ref) async {
  final List docList = await ref
      .read(exchangeRepositoryProvider)
      //uidを取ってくる #TODO
      .fetchMyCardsDocId('4MXOY43lcRVTSA8GVq1X8ioCqBf1');
  final NameCard nameCard = await ref
      .read(exchangeRepositoryProvider)
      //uidとdocumentIDをとってくる #TODO
      .fetchMyNameCard('4MXOY43lcRVTSA8GVq1X8ioCqBf1', docList[0]);
  final SentCard sentCard = SentCard(
      //uidを取ってくる #TODO
      uid: '4MXOY43lcRVTSA8GVq1X8ioCqBf1',
      //自分の名刺が今は１個しかないためindexは0
      documentID: docList[0],
      card: nameCard);
  return sentCard;
});

class ExchangeViewModel {
  void saveNameCard(WidgetRef ref) {
    ref
        .read(exchangeRepositoryProvider)
        //下の引数にはuidがはいる#TODO
        .saveNameCard('4MXOY43lcRVTSA8GVq1X8ioCqBf1');
  }

  void memoSave(String text) {
    print(text);
  }
  //返すのはImageWidgetではなくString
  // Image printImage() {
  //   return Image.network(
  //       'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAUsAAACYCAMAAABatDuZAAABGlBMVEX/////yig5zv3/oAADVpsWuf31fxcAUpll1/1c1v3/ngAQIzlgi7j/mwD/zSn/xwAiy/31exYAtv0IHzbZ2t3t7vD/yBoow/0AR5QGTZYDV5vi9//I7/4As/0FT5f/mAD/1qOw6P6/7f7/tRf7riH8tSPM7f6g5P7/tlP/6bAaKj4tOUr7rCH//PUAQZIVv///7dX/+ur9oSH4kSn/zjn/0Ej/skPZ9P7/1aH/1Fz/3YP/7Lz/4r7/4I76mSb/8cz/5J2EiZEAFC//1mYjmNimutP/89T/2nUhi83a4+2TrMv/yIH/69b/umP/3rP/9uv/wG3/zIz/yVq4u8DKzM8AAij/qh3/rTizv9T/6M7/45oJN4iIo8ZPf7L4ZR27AAAKqUlEQVR4nN2dbVfbNhSApQXC6i6YdMSD0gJrt67QBUjCS4GS0sKADDralWaj2/7/35jt2I4lX8mSbdmS76ecQ8Hqcx7p6uVGRqi4WPlWJh78WOCjxaO7P76v5MFSsfKNTCz8Uk0rr1uWdVPNo8XDDJTIshrWfkXPFg1DUPbWGo1GS+9ebghK9KblsrReVvV4kTAFJfrDY6m1mMagRNeWx1LjEXNlwRSUaN9n2VjTVUxzrESoP2Gp64hpkJXothGEniOmSVaim1bAUksxjUIZpHF/xNyptiVAmIUySON6imkYSvQhYtloaSamZNqpZmcoHuMpS83ENM1KhKLhUjcxjbMS7azFWOok5oFxVsbSuF6p3LwOjtBrgqX1oer2BCFppQYdHBFpXKPFj4lWEmlcnxHzwLi040WXRAmPmLc33VIbZWDa8WKHZgmMmJ9aa431EttkppXBAQU5YtJirq9ZDav1prQmGZl2vPiUYEmL2fX/hdUoq0XGokQf6T6eEDOg3Vovp0GmdnA3XiZZkqm8GyR6q1FK/jHXStRtJFmSYkbrolLENNhKdJsYLukRM5p/liGmwVZCaZwS83669dF6rbo1JltJr8aBEXM/trupOpWbjTJ2QEFEtPjZIXY31/l/rNfL1RajO7gbf8EsoxGTmDJZY96IeXHoOEc5mmK4lQjBKKMRk0pNPDGPbQdj+zRzS0y3Et2uMVhaH/2fU6sizoh5bGMv5rO2xHgr0T2YeqIRs2tR3jJT+cYEJbYzDpnGW0kfUBAKeiPmOv1j1ogZWOmyPM7UDvOtZKZxX8EdKDPBI2aEEjunWZpRB5TQajwmJjCRB0fMKUrsnGVoRS1QsqZEEwV7+9BafT3xR2IoMd6Vb0Q9UN5COxuRghBKYFW+EUeJHelFez1QTssFwRj0QV2pVE5Y6bK8kGzDEzmUzwr7zxcc7DTuRr85AHUlxSStlE/kdUEJHFDEtWw208WkUWLnRKoFtUFJ1xmQWrabLDGnfyCBUjKR1wclXWdAa5kqZhIlxnsSyadGKBGni/c9lAwxw8UPhFImkdcJ5Q5rZ8ON5iR4YoIosS2cyOuEknFAMdGy3eSI6Y+YMErsbAg+vVYoGQcUcS05YjJQCifyeqHkpPFhO2TJEpOF0k0+Qs+uGUrOarzZTBHzT4eFEtsij64bSrDOgNISFtN6ziQpth1cN5TJcsEwxs0mV0zr+TyP5dvUJ9cOJfuAYkiwTIjJRymQyOuHkpnG+80mT8wUlNi5THluDVFC5YJ+DCiWAymUGB/yHyuJ8kk5MHIG44CC1pIUMx0l3uWuImuJkpXGaS0JMQVQYoeXyGuJEi4XhLSMiSmCkpvI64mSlcaTWk7FFELJO9d9Vk+UyUICppahmGIoOYm8play6gwgLQMxBVGyV+R1tZKoUo1p2QZZemIKo2StyGtrJUJgGoe19MQUR8nYDtbZys67d50cvw6mcXi09MUURwmf6+qMEi2+f7+Y49fBNM5E2f5JHCWYyLVGiRYfPszDEqozGDJGy2Z7LIESOtfVG2VelkAaHzNINtu/yqAECrQ0R5mXJXBAMWShlLLSC2oVWQzKlQdSIVPElZMlcEBRkJWJRF4QSpk/IvkF/XwsgXJBxmgpj5JK5PqjzMkyWS7IGC0zoCTPdQ1AmZNlMo3Do2UWlEQi1xllZzGIz5ubn8PP8pP2RLkgPE3PhDKeyHVGie6+PJzE5qtXm8HHL3fSLBNpHFw9ZkSJ7WhrXYpl2R387sv3k/BYBh8zsKTLBUEts6KMJ3IJmOWPlZ0g7jY378LP0igT5YKQlplREue6wjCrSTt+5Mo9dLkgpGV2lJj4wq4gzIUDuKllXEeWiyVdLghomQMltR0sBHPhBdzSUm52y8WSqjMAtoBzocQO8TQBmFVamZMllcaTWuZDSRdopcKsFmU+luRqPDla5kSZONdNgVlh2vEjD8tu3+JqKbX1C0WiQIsLk2llWa9PyMPyhtSSHi1zowTOdTkwq7Yy3xkFeUBRuJUYKtBiwqzcynxnZ0Qap/faikAJFWgxYLJQmnKhKHFAocBKuNIahMlE+egHI1AS5YJDFSiFz3VZKF88mpWAWeU1t/FNdSUoGQVaCZhsK2fdEIVZJcruGkvLolCyCrQomEyUT2dnxWFWevlyLI2P1aBkXrxBwOR08FlxmNXeYx07oBgqQsn8ylQMZjpKEZgVXwk+TeN9VSjZ39edlrsJoEyHWfVlJtNywYEqlJyLNwIz+WlHFGblF9VHaTyuZfvnIlFi5yvz8b6ZzA7+lETJnxpVbSXqQVoWjJJ78YYLU2SsTDezciunl6321aHk36D1ZGEF/sEBbSUXZuVWxtL4QCHKRIEWEQyUkJVsmBqgRNcteq9NBUrxizeiYKGEYeqAMjqgGKhEKX7xRhRslFAC0gJleEDRV4pS9gYtLkrATD1Qhl+EHChFKX0VZmIyxDVTD5ThhcvRFrAalLJXYfKtpM3UBGWQxsdqrcTxAi2BSLGSgqkLyqBccKgapcjFG1GkWxmHqQ3K4D4D5ShlErkYyhCmPign5YJD5Six+BsVRDq4H34C0gilXy44Vo9S9AYtcSsnZuqE0l+ND0tAibFYg4StnJip070wXrlgvxSU3Is3pvFMhuX2+d+K+ciEV2cwLAOlcCKX6OPb53NLv6nlIxNuGu+XglL8hQrCMF2UMzNb+pi5b3mrxxJQpt+gFYUgzO3z1Rk3tDGzO7b65aBMvUErFkIwfSu92NIE5q2nZTko8bz4KlIgmQdW+mbq0c3vW/2yUEq9GSnVzO3z5bmQpSZmvrYGZaGUe6FCipkeyrkpTC3GzGurNJSSW+tcMycoNYP5Utl+JcBSOJH7wYHpolydI2Fq0M375aGUfjMSE+b2+dLqKg2zcjO7TnkoHem3nzFguiiXV5MwKzfz7R7zZvSCw76Uf8EhmIA8lD5L7cxEpzb7cvQCSe5KbKtPAzBz+8pFScCc08ZM1L1UTtPBpxkbl4AZoIzBnJnRp5sjdKG4o2fp3mFQMLevtpaWlyKYBEktujlCG1idmvaefPlLLAiYHkqXZACTAqmJmah7oqijO1i6+IWKWDWrj3JpQhMAqYuZqHeooKM79qX0GyITEZm5ffXP0oTl6txjGKVr5u8FwMgdx3tFq5mze4cRlGFGVs7NMEnqYiZCXwvt6I58bRsj/G4+sTIFpD5mevOj4kgKH4inhwvTRbm1vJoKUiMzC5sf2YeFdO8wDmavtlyQIiQ9mHqYWcz8yMHZ3uLOjtGykJK6wewe5Rw2Hfskf/amY7QkjlIjmOgi1/zIPsy+zOHEiDGj1B0mOt7NqqazW3T3DsNUMxHKthBS0r3DGNHLb2Ng9jLMjxR17zBG0BLcCJjo7a4cTWdeVfcOw2CY6FRifuRIf+0kQ4xmzIUpPj+yz5R27zBGrA0iA2AKLoQcnOkMIkNImvlvSc0SjI3U+ZHD+Xp44WHymJm+Uaw4e9PRMdpM1Dtjd3Qn2xFjjjA5AXnBmh859qm6yTkrOnKTdt3MdOdHDtDRS8redIweGw4zuRDKWEFQQJjezen5kdu9q2tK53FYtSESW/qZ6c6P9myvqzuOY+OjSrp3GJ3vZOI/PcqwqehtHO3tnp1sXGRIOf8Dhwu6lQma+5QAAAAASUVORK5CYII=');
  // }

  // Image printFaceImage() {
  //   return Image.network(
  //       'data:image/png;base64,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');
  // }
}
