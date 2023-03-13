import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  List<Map<String, String>> data = [];

  int idx = 0; //index yang aktif

  static const List<Center> halaman = [
    Center(child: Text("satu")),
    Center(child: Text("dua"))
  ];

  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  TabBar get _tabBar => TabBar(
        indicatorColor: Colors.red,
        labelColor: Colors.red,
        unselectedLabelColor: Colors.black,
        tabs: [
          Tab(text: "Following"),
          Tab(text: "Downloads"),
          Tab(text: "Following"),
        ],
      );

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      Map<String, String> temp = {
        'nama': "Video $i",
        "foto":
            'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'
      };
      data.add(temp);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hello App',
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              leading: FlutterLogo(),
              backgroundColor: Colors.blueGrey,
              title: Text('Quiz Flutter'),
              bottom: PreferredSize(
                preferredSize: _tabBar.preferredSize,
                child: ColoredBox(
                  color: Colors.white,
                  child: _tabBar,
                ),
              ),
              actions: <Widget>[
                ButtonNamaKelompok(),
                ButtonPerjanjian(),
              ],
            ),
            body: TabBarView(
              children: [
                Center(child: Text("isi tab 1")),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  top:
                                      BorderSide(width: 1, color: Colors.black),
                                  bottom:
                                      BorderSide(width: 1, color: Colors.black),
                                )),
                                child: Row(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(20),
                                      child: Image.network(
                                        data[index]['foto']!,
                                        width: 100,
                                      ),
                                    ),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(data[index]['nama']!),
                                          TextButton(
                                              onPressed: () {},
                                              child: Text("Delete")),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                              // return Card(
                              //     child: Padding(
                              //   padding: EdgeInsets.all(20),
                              //   child: ListTile(
                              //     onTap: () {
                              //       ScaffoldMessenger.of(context).showSnackBar(
                              //           SnackBar(
                              //               duration: Duration(seconds: 1),
                              //               content: Text(
                              //                   'Halo ${data[index]['nama']}')));
                              //     },
                              //     leading: Image.network(
                              //       data[index]['foto']!,
                              //       width: 50,
                              //     ),
                              //     title: Text(data[index]['nama']!),
                              //     subtitle: Text(data[index]['hobi']!),
                              //   ),
                              // ));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Center(child: Text("isi tab 3")),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: idx,
                selectedItemColor: Colors.red,
                onTap: onItemTap,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.list), label: " Programme"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.person), label: " My Learning"),
                ]),
          ),
        ));
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 3'),
            content: const Text(
                'Mia Karisma Haq (miakarisma87@upi.edu) ; Muhammad Daffa Yusuf Fadhilah (mdaffayusuff@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}
