import 'package:flutter/material.dart';
import 'package:tp_groupe5/controller/user_controller.dart';
import 'package:tp_groupe5/models/userModel.dart';
import 'package:tp_groupe5/pages/addUser.dart';
import 'package:tp_groupe5/pages/updatedUser.dart';
import 'package:tp_groupe5/repository/UserRepository.dart';

class HomeSreen extends StatelessWidget {
  const HomeSreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserController userController = UserController(UserRepository());
    Container buildCallContainer(String title, Color color) {
      return Container(
        width: 40.0,
        height: 40,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: Center(child: Text('$title')),
      );
    }

    //test
    userController.fetchUserlist();
    return Scaffold(
        appBar: AppBar(
          title: const Text('TP-API'),
        ),
        body: FutureBuilder<List<UserModel>>(
          future: userController.fetchUserlist(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('error'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return buildUserContent(
                snapshot, userController, buildCallContainer);
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddUser()));
          },
          child: Icon(Icons.add),
        ));
  }

  SafeArea buildUserContent(
      AsyncSnapshot<List<UserModel>> snapshot,
      UserController userController,
      Container buildCallContainer(String title, Color color)) {
    return SafeArea(
      child: ListView.separated(
          itemBuilder: (context, index) {
            var user = snapshot.data?[index];
            return Container(
              height: 100.0,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage('${user?.picture}'),
                        radius: 40,
                      )),
                  Expanded(flex: 2, child: Text('${user?.firstname}')),
                  Expanded(flex: 2, child: Text('${user?.lastname}')),
                  SizedBox(
                      width: 150,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                              onTap: (() {
                                userController
                                    .updatedPathCompleted(user!)
                                    .then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        content: Text('$value')),
                                  );
                                });
                              }),
                              child: buildCallContainer(
                                  'path', Color(0xFFFFE0B2))),
                          InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdatedUser(
                                              nom: user!.firstname,
                                              prenom: user.lastname,
                                              genre: user.gender,
                                              adress: user.adress,
                                              phone: user.phone,
                                              photo: user.picture,
                                              citation: user.citation,
                                            )));
                              },
                              child: buildCallContainer(
                                  'editer', Color(0xFFE1BEE7))),
                          InkWell(
                              onTap: () {
                                userController.delecteUser(user!).then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        content: Text('$value')),
                                  );
                                });
                              },
                              child: buildCallContainer(
                                  'Supprimer', Color(0xFFFFCDD2))),
                        ],
                      ))
                ],
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const Divider(
              thickness: 0.5,
              height: 0.5,
            );
          },
          itemCount: snapshot.data?.length ?? 0),
    );
  }
}
