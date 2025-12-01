import 'package:flutter/material.dart';
import 'package:myapp_first/components/profile_widget/menu_list.dart';
import 'package:myapp_first/screens/item_list.dart';
import 'package:myapp_first/services/auth_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 70),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(height: 19),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Container(
                        width: 97,
                        height: 99,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                        ),
                        child: Image.asset("assets/images/Profile.png"),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Timothy Manuel Chandra",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "timothymanuel@student.usu.ac.id",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black.withOpacity(.6),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: 372,
                        height: 68,
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 4),
                              blurRadius: 4,
                              color: Colors.black.withOpacity(0.24),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset('assets/images/coin.png'),
                                SizedBox(width: 5),
                                Text(
                                  "9999",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                  ),
                                ),
                                Text(
                                  "E-Point",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  textAlign: TextAlign.end,
                                ),
                              ],
                            ),
                            Container(
                              width: 2,
                              height: 46,
                              color: Colors.blue.withOpacity(0.6),
                            ),
                            Container(
                              width: 126,
                              height: 45,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xff009421),
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: Text("Tukarkan"),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 25),

                      menuList(
                        title: "History",
                        image: "assets/images/history.png",
                      ),
                      SizedBox(height: 10),

                      menuList(
                        title: "Item List",
                        image: "assets/images/tugas.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ItemListScreen(),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: 10),

                      menuList(
                        title: "Tugas",
                        image: "assets/images/tugas.png",
                      ),

                      SizedBox(height: 10),

                      menuList(
                        title: "Peringkat",
                        image: "assets/images/peringkat.png",
                      ),
                      SizedBox(height: 10),

                      menuList(
                        title: "Notifikasi",
                        image: "assets/images/notifikasi.png",
                      ),
                      SizedBox(height: 10),

                      menuList(
                        title: "Kebijakan Privasi",
                        image: "assets/images/privasi.png",
                      ),
                      SizedBox(height: 10),

                      menuList(
                        title: "Medaliku",
                        image: "assets/images/medali.png",
                      ),
                      SizedBox(height: 10),

                      menuList(
                        title: "Ganti Password",
                        image: "assets/images/password.png",
                      ),
                      SizedBox(height: 10),

                      menuList(
                        title: "Pusat Bantuan",
                        image: "assets/images/bantuan.png",
                      ),

                      SizedBox(height: 10),

                      menuList(
                        title: "Logout",
                        image: "assets/images/privasi.png",
                        onTap: () async {
                          await AuthService().signOut();
                          Navigator.pushReplacementNamed(context, "/login");
                        },
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
