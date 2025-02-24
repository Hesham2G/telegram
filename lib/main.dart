import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

List<dynamic> admin = [
  "TelegramAdmin",
  "Telegram",
  "Video Calls with up to 1000 ...",
  "11:30 pm",
  false,
  Colors.green,
];

List<dynamic> user = [
  "SB",
  "SB Lim",
  "Good Morning!!",
  "8:50 pm",
  true,
  Colors.purple,
];

List<dynamic> user2 = [
  "J",
  "Jhon",
  "How are you?",
  "6:57 pm",
  true,
  Colors.blue,
];

List<dynamic> user3 = [
  "C",
  "CIndy",
  "Are you free tonight?",
  "Fri",
  false,
  Colors.green,
];

List<dynamic> user4 = [
  "L",
  "Lily",
  "I'm fine!!",
  "Aug 10",
  false,
  Colors.purpleAccent,
];

List<dynamic> user5 = [
  "K",
  "Kathy",
  "Kathy joined Telegram!!",
  "03:08:20",
  false,
  Colors.blueAccent,
];

List<dynamic> user6 = [
  "H",
  "Hisham",
  "Hi Hisham!",
  "10:15 am",
  true,
  Colors.orange,
];

List<dynamic> user7 = [
  "M",
  "Mohamed",
  "Hi Mohamed!",
  "10:17 am",
  true,
  const Color.fromARGB(255, 185, 183, 183),
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<List<dynamic>> userList = [admin, user, user2, user3, user4, user5, user6, user7];
    return Scaffold(
      backgroundColor: Colors.grey[300],
          drawer: Drawer(
        
        
        child: Container(
          
    color: Color(0xFF0088cc), // خلفية سوداء
    child: ListView(
      children: [
        // القسم العلوي (المستخدم)
        UserAccountsDrawerHeader(
          decoration: BoxDecoration(color:  Color(0xFF0088cc)),
          accountName: Text(
            'H2G',
            style: TextStyle(color: Colors.white),
          ),
          accountEmail: Text(
            '+967 77 445 3814',
            style: TextStyle(color: Colors.white70),
          ),
          currentAccountPicture: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile.jpg'), // صورة البروفايل
          ),
        ),

        // عناصر القائمة
        ListTile(
          leading: Icon(Icons.person, color: Colors.lightBlueAccent),
          title: Text('My Profile', style: TextStyle(color: Colors.lightBlueAccent)),
          onTap: () {
            // الحدث عند الضغط
          },
        ),
        ListTile(
          leading: Icon(Icons.group, color: Colors.white),
          title: Text('New Group', style: TextStyle(color: Colors.white)),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.contacts, color: Colors.white),
          title: Text('Contacts', style: TextStyle(color: Colors.white)),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.call, color: Colors.white),
          title: Text('Calls', style: TextStyle(color: Colors.white)),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.bookmark, color: Colors.white),
          title: Text('Saved Messages', style: TextStyle(color: Colors.white)),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings, color: Colors.white),
          title: Text('Settings', style: TextStyle(color: Colors.white)),
          trailing: Icon(Icons.info, color: Colors.green), // أيقونة إضافية بجانب العنصر
          onTap: () {},
        ),

        Divider(color: Colors.white24), // خط فاصل

        ListTile(
          leading: Icon(Icons.person_add, color: Colors.white),
          title: Text('Invite Friends', style: TextStyle(color: Colors.white)),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.info, color: Colors.white),
          title: Text('Telegram Features', style: TextStyle(color: Colors.white)),
          onTap: () {},
        ),
      ],
    ),
  ),
      ),

      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF0088cc),
        title: Text(
          'Telegram',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.search,
            size: 20,
            weight: 30,
            color: Colors.white,
          ),
        ],
      ),
      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 70,
            right: 10,
            child: FloatingActionButton(
              onPressed: () {},
              mini: true,
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
              backgroundColor: Colors.blueGrey,
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(
              Icons.mode_edit,
              color: Colors.white,
            ),
            backgroundColor: Colors.lightBlue,
          ),
        ],
      ),
      body: chatList(userList),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedFontSize: 17,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold
        ),
        unselectedItemColor: Colors.blue,

        selectedItemColor: Colors.grey,
        showSelectedLabels: true,
        showUnselectedLabels: false,

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home",backgroundColor: Colors.deepPurpleAccent),
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home",backgroundColor: Colors.deepPurpleAccent),
          BottomNavigationBarItem(icon: Icon(Icons.home,),label: "Home",backgroundColor: Colors.deepPurpleAccent),
        ],


       ),
    );
  }

  Widget chatList(List<dynamic> userList) {
    return ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return listTile(
            userList[index][0],
            userList[index][1],
            userList[index][2],
            userList[index][3],
            userList[index][4],
            userList[index][5],
          );
        });
  }
}

Widget listTile(String image, String title, String subtitle, String time, bool isChecked, Color imageColor) {
  return ListTile(
    leading: profileImage(image, imageColor),
    title: Text(
      title,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
    subtitle: Text(
      subtitle,
      style: TextStyle(
        color: subtitle.contains("joined") ? Colors.lightBlue : Colors.grey[800],
        fontSize: 16,
      ),
    ),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        isChecked ? Icon(Icons.check, color: Colors.lightBlue) : SizedBox(),
        SizedBox(width: 5),
        Text(
          time,
          style: TextStyle(color: Colors.grey[800]),
        )
      ],
    ),
  );
}

Widget profileImage(String image, Color imageColor) {
  return Container(
    height: 55,
    width: 55,
    decoration: BoxDecoration(
      color: imageColor,
      shape: BoxShape.circle,
    ),
    child: image.length < 5
        ? Align(
            alignment: Alignment.center,
            child: Text(
              image,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          )
        : Image.asset("assets/images/telegram.png"),
  );
}