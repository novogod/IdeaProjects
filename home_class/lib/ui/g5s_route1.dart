import 'package:flutter/material.dart';
import 'package:home_class/util/hexcolor.dart';

class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  var myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("#2C86FF"),
      child: Scaffold(
        backgroundColor: HexColor("#41A6FF"),
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Tenants DB",
              style: TextStyle(fontFamily: "Roboto-Medium", fontSize: 20),
            ),
          ),
          centerTitle: false,
          elevation: 0,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                icon: Icon(Icons.logout, color: Colors.white),
                onPressed: null,
                disabledColor: Colors.grey.shade700,
              ),
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          iconSize: 28,
          elevation: 10,
          showUnselectedLabels: true,
          selectedLabelStyle: TextStyle(fontSize: 15),
          unselectedLabelStyle: TextStyle(fontSize: 15),
          selectedItemColor: HexColor("#41A6FF"),
          unselectedItemColor: Colors.grey.shade700,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: HexColor("#41A6FF"),
                ),
              label: 'Search',
                 ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_add,
                  color: Colors.grey.shade700,
                ),
                label: "Add Tenant",
                  ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.attach_money,
                  color: Colors.grey.shade700,
                ),
                label: "Earnings",
                  ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shield,
                  color: Colors.grey.shade700,
                ),
                label: "Profile",
                  ),
          ],
        ),
        floatingActionButton: Container(
            width: MediaQuery.of(context).size.width * 0.93,
            height: 100,
            padding: EdgeInsets.all(18),
            child: SizedBox.expand(
              child: FloatingActionButton.extended(
                label: Text(
                  "Search",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Roboto-Medium",
                    fontSize: 20,
                  ),
                ),
                icon: Icon(Icons.search),
                backgroundColor: HexColor("16C9A9"),
                onPressed: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // Retrieve the text the that user has entered by using the
                        // TextEditingController.
                        content: Text(myController.text),
                        
                      );
                    },
                  );
                },
              ),
            )),
        body: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListView(
              scrollDirection: Axis.vertical,
              padding: EdgeInsets.all(20),
              children: [
                Column(children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.12,
                        bottom: MediaQuery.of(context).size.height * 0.03),
                    child: Icon(
                      Icons.post_add,
                      size: 70,
                      color: HexColor("41A6FF"),
                    ),
                  ),
                  Center(
                    child: TextField(
                      autofocus: false,
                      controller: myController,
                      textAlign: TextAlign.center,
                      obscureText: false,
                      showCursor: true,
                      keyboardType: TextInputType.text,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Roboto-Light",
                          color: Colors.grey.shade700),
                      decoration: InputDecoration(
                        hintText: "Document number",
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                            fontFamily: "Roboto-Light",
                            fontSize: 30,
                            color: HexColor("41A6FF")),
                      ),
                    ),
                  )
                ]),
                Column(
                  children: [
                    Container(
                      color: HexColor("F1F3FB"),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
