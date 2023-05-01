import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_profile/views/UsersList.dart';

import '../controller/Provider.dart';

class UserDetails extends StatelessWidget {
  const UserDetails({
    super.key,
    required this.index,
    required List string,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(builder: (context, getdata, child) {
      getdata.fetchData();
      return Scaffold(
        backgroundColor: Colors.black87,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.network(
                  "https://th.bing.com/th/id/OIP.oBKDrg_iZIdKRwPkvCITtAHaNL?pid=ImgDet&rs=1",
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45, right: 300),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                    const CircleAvatar(radius: 60, child: Icon(Icons.person)),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 224, 221, 221),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.50,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ...ListTile.divideTiles(
                              color: Colors.grey,
                              tiles: [
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  leading: const Icon(Icons.person),
                                  title: const Text(
                                    "Name",
                                  ),
                                  subtitle:
                                      Text(getdata.datas[buttonindex].name),
                                ),
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 4),
                                  leading: const Icon(Icons.my_location),
                                  title: const Text("Location"),
                                  subtitle: Text(
                                      getdata.datas[buttonindex].address.city),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.email),
                                  title: const Text("Email"),
                                  subtitle:
                                      Text(getdata.datas[buttonindex].email),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.phone),
                                  title: const Text("Phone"),
                                  subtitle:
                                      Text(getdata.datas[buttonindex].phone),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
