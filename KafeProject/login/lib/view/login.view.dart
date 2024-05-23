import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:login/butongecis/hesapolustur.dart';
import 'package:login/main.dart';
import 'package:login/utils/global.colors.dart';
import 'package:login/view/login/button.global.dart';
import 'package:login/view/login/social.login.dart';
import 'package:login/view/login/text.form.global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const girismaps(),
    );
  }
}

// ignore: camel_case_types
class girismaps extends StatefulWidget {
  const girismaps({super.key});

  @override
  State<girismaps> createState() => _girismapsState();
}

// ignore: camel_case_types
class _girismapsState extends State<girismaps> {
  int index = 2;

  final List<Widget> _screens = [
    sifreunuttum(),
    const MapScreen(),
    LoginView(),
  ];

  void _onItemTapped(int tappedIndex) {
    setState(() {
      index = tappedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.purple.shade300,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Mekanlar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Harita',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
        currentIndex: index,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  // Pinlediğiniz yerlerin koordinatları
  static const LatLng _pCafe1 = LatLng(41.0805159, 28.9731);
  static const LatLng _pCafe2 = LatLng(41.0790673, 28.9699304);
  static const LatLng _pCafe3 = LatLng(41.0820581, 28.9692409);

  // Bu üç mekanın görünmesi için uygun zoom ve merkez koordinatı belirleniyor
  static const CameraPosition _initialCameraPosition = CameraPosition(
    target: LatLng(41.0805159, 28.9731), // Üç mekanın ortalama merkezi
    zoom: 15, // Uygun zoom seviyesi
  );

  void _onMapCreated(GoogleMapController controller) {
    // Kamera pozisyonunu ve sınırları belirleyebilirsiniz
    controller.moveCamera(CameraUpdate.newLatLngBounds(
      LatLngBounds(
        southwest: LatLng(41.0785, 28.9685), // Güneybatı köşesi
        northeast: LatLng(41.0835, 28.9755), // Kuzeydoğu köşesi
      ),
      10.0, // Padding
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CafeSearch'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => App()),
            );
          },
        ),
      ),
      body: GoogleMap(
        mapType: MapType.terrain,
        onMapCreated: _onMapCreated,
        initialCameraPosition: _initialCameraPosition,
        zoomControlsEnabled: true,
        markers: {
          Marker(
            markerId: const MarkerId("koollounge"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pCafe1,
            infoWindow: const InfoWindow(
              title: "Kool Lounge",
              snippet: "Tadına doyamayacağınız tatlılar.",
            ),
          ),
          Marker(
            markerId: const MarkerId("kahvedunyası"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pCafe2,
            infoWindow: const InfoWindow(
              title: "Kahve Dünyası",
              snippet: "Lezzetli kahveler burada.",
            ),
          ),
          Marker(
            markerId: const MarkerId("_PinDeneme"),
            icon: BitmapDescriptor.defaultMarker,
            position: _pCafe3,
            infoWindow: const InfoWindow(
              title: "Ahbap Coffee dessert",
              snippet: "Ruhunuzu dinlendirebileceğiniz bir yer.",
            ),
          ),
        },
        minMaxZoomPreference: const MinMaxZoomPreference(14.0, 18.0),
      ),
    );
  }
}

class LoginView extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'CafeSearch',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: GlobalColors.mainColor,
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  'Giriş Yap',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: GlobalColors.textColor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 15),
                TextFormGlobal(
                  controller: emailController,
                  text: 'Email',
                  obscure: false,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 10),
                TextFormGlobal(
                  controller: passwordController,
                  text: 'Şifre',
                  textInputType: TextInputType.text,
                  obscure: true,
                ),
                const SizedBox(height: 10),
                const ButtonGlobal(),
                const SizedBox(height: 25),
                const SocialLogin(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        color: Color.fromARGB(255, 255, 245, 253),
        alignment: Alignment.center,
        child: ElevatedButton(
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => hesapolustur())),
          child: const Text(
            'Hesap Oluştur',
            style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.purple)),
        ),
      ),
    );
  }
}

class sifreunuttum extends StatelessWidget {
  final List<Cafe> cafes = [
    Cafe(
      name: 'Ahbap Coffee dessert',
      menu:
          'menu: Kahveler\nEspresso: 55 TL\nAmericano: 60 TL\nLatte: 70 TL\nCappuccino: 70 TL\nMocha: 75 TL\nFlat White: 65 TL\nMacchiato: 60 TL\n\nSıcak İçecekler\nSıcak Çikolata: 70 TL\nChai Latte: 75 TL\nMatcha Latte: 80 TL\n\nSoğuk İçecekler\nSoğuk Demleme (Cold Brew): 80 TL\nBuzlu Americano: 70 TL\nBuzlu Latte: 75 TL\nBuzlu Mocha: 80 TL\n\nTatlılar ve Atıştırmalıklar\nCheesecake: 90 TL\nBrownie: 80 TL\nMuffin: 50 TL\nKruvasan: 60 TL\nSandviçler: 100 TL',
    ),
    Cafe(
      name: 'Kahve Dünyası',
      menu:
          'menu: Sıcak İçecekler\nAmericano: 60 TL\nFiltre Kahve: 55 TL\nCappuccino: 65 TL\nZerdeçallı Latte: 85 TL\nCaffe Latte: 65 TL\nKahveli Sıcak Çikolata: 85 TL\nMacchiato: 50 TL\nEspresso (Lungo): 60 TL\nSıcak Çikolata (Kahveli): 85 TL\n\nSoğuk İçecekler\nSoğuk Türk Kahvesi: 90 TL\nAffogato: 90 TL\nCold Brew: 80 TL\nBuzlu Americano: 75 TL\nBuzlu Mocha: 85 TL\nBuzlu Caffe Latte: 80 TL\nFreddo Espresso/Cappuccino/Caffe Latte: 80 TL\nSoğuk Salep: 90 TL\nMuzlu/Çilekli Smoothie: 99 TL\nÇilekli/Çikolatalı Milkshake: 99 TL\nVitaminli Soğuk Çikolata: 80 TL\n\nTuzlu Ürünler\nTavuk Sezar Sandviç: 105 TL\nBeyaz Peynirli Sandviç: 95 TL\nTon Balıklı Sandviç: 110 TL\nIspanaklı Kiş: 75 TL\nÜç Peynirli Kiş: 90 TL\nKruvasan: 50 TL\nPoğaça: 40 TL\nTavuklu Puf: 85 TL\nPeynirli Puf: 80 TL\n\nTatlılar\nMozaik Pasta: 90 TL\nKahve Dünyası Pastası: 80 TL\nKaramelli Çikolatalı Pasta: 90 TL\nTrüf Çikolatalı Pasta: 90 TL\nKruvasantın: 75 TL\nFrambuazlı/Limonlu Cheesecake: 90 TL\nBrownie: 80 TL\nProfiterol: 80 TL\nÇikolatalı Sufle: 85 TL\nFındık Kremalı Top: 28 TL\nHavuçlu Kek: 80 TL\n\nDondurmalar\n1 Top Dondurma: 40 TL\n500 Gr. Dondurma: 248 TL\n1 Kilo Dondurma: 495 TL\nFındık Kremalı ve Cookie Parçalı Kupakup/Madam Şokola: 115 TL\nFroyo Küçük: 50 TL\nFroyo Büyük: 60 TL\n1 Kilo Froyo: 300 TL\nNeşeli Dondurma: 45 TL',
    ),

    Cafe(
        name: 'Kool Lounge',
        menu:
            'menu: Kahveler\n"Espresso: 50 TL,\n"Americano: 55 TL,\n"Cappuccino: 65 TL,\n"Latte: 65 TL,\n"Mocha: 75 TL,\n\n"Soğuk İçecekler:\n"Soğuk Demleme (Cold Brew): 75 TL,\n"Buzlu Americano: 65 TL,\n"Buzlu Latte: 75 TL,\n"Smoothie: 85 TL,\n\n"Sıcak İçecekler:\n"Sıcak Çikolata: 65 TL,\n"Chai Latte: 75 TL,\n"Matcha Latte: 85 TL,\n\n"Tatlılar ve Atıştırmalıklar:\n"Cheesecake: 85 TL,\n"Brownie: 75 TL,\n"Muffin: 45 TL,\n"Kruvasan: 55 TL,\n"Sandviçler: 100 TL,\n\n"Kool Lounge:\n"Sıcak İçecekler:\n"Americano: 60 TL,\n"Filtre Kahve: 55 TL,\n"Cappuccino: 65 TL,\n"Zerdeçallı Latte: 85 TL,\n"Caffe Latte: 65 TL,\n"Kahveli Sıcak Çikolata: 85 TL,\n"Macchiato: 50 TL,\n"Espresso (Lungo): 60 TL,\n"Sıcak Çikolata (Kahveli): 85 TL,\n\n"Soğuk İçecekler:\n"Soğuk Türk Kahvesi: 90 TL,\n"Affogato: 90 TL,\n"Cold Brew: 80 TL,\n"Buzlu Americano: 75 TL,\n"Buzlu Mocha: 85 TL,\n"Buzlu Caffe Latte: 80 TL,\n"Freddo Espresso/Cappuccino/Caffe Latte: 80 TL,\n"Soğuk Salep: 90 TL,\n"Muzlu/Çilekli Smoothie: 99 TL,\n"Çilekli/Çikolatalı Milkshake: 99 TL,\n"Vitaminli Soğuk Çikolata: 80 TL,\n\n"Tuzlu Ürünler:\n"Tavuk Sezar Sandviç: 105 TL,\n"Beyaz Peynirli Sandviç: 95 TL,\n"Ton Balıklı Sandviç: 110 TL,\n"Ispanaklı Kiş: 75 TL,\n"Üç Peynirli Kiş: 90 TL,\n"Kruvasan: 50 TL,\n"Poğaça: 40 TL,\n"Tavuklu Puf: 85 TL,\n"Peynirli Puf: 80 TL,\n\n"Tatlılar:\n"Mozaik Pasta: 90 TL,\n"Kahve Dünyası Pastası: 80 TL,\n"Karamelli Çikolatalı Pasta: 90 TL,\n"Trüf Çikolatalı Pasta: 90 TL,\n"Kruvasantın: 75 TL,\n"Frambuazlı/Limonlu Cheesecake: 90 TL,\n"Brownie: 80 TL,\n"Profiterol: 80 TL,\n"Çikolatalı Sufle: 85 TL,\n"Fındık Kremalı Top: 28 TL,\n"Havuçlu Kek: 80 TL,\n\n"Dondurmalar:\n"1 Top Dondurma: 40 TL,\n"500 Gr. Dondurma: 248 TL,\n"1 Kilo Dondurma: 495 TL,\n"Fındık Kremalı ve Cookie Parçalı Kupakup/Madam Şokola: 115 TL,\n"Froyo Küçük: 50 TL,\n"Froyo Büyük: 60 TL,\n"1 Kilo Froyo: 300 TL,\n"Neşeli Dondurma: 45 TL'),
    // Diğer kafeler...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CafeSearch              Kafeler ve Menüleri'),
      ),
      body: ListView.builder(
        itemCount: cafes.length,
        itemBuilder: (context, index) {
          return CafeTile(cafe: cafes[index]);
        },
      ),
    );
  }
}

class CafeTile extends StatelessWidget {
  final Cafe cafe;

  CafeTile({required this.cafe});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: ListTile(
        title: Text(cafe.name),
        subtitle: Text(cafe.menu),
      ),
    );
  }
}

class CafeDetailPage extends StatelessWidget {
  final Cafe cafe;

  CafeDetailPage({required this.cafe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(cafe.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              cafe.name,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              cafe.menu,
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}

class Cafe {
  final String name;
  final String menu;

  Cafe({required this.name, required this.menu});
}
