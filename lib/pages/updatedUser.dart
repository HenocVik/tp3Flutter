import 'dart:math';

import 'package:flutter/material.dart';
import 'package:tp_groupe5/controller/user_controller.dart';

import 'package:tp_groupe5/models/userModel.dart';
import 'package:tp_groupe5/pages/home_page.dart';
import 'package:tp_groupe5/repository/UserRepository.dart';

class UpdatedUser extends StatefulWidget {
  const UpdatedUser(
      {Key? key,
      required this.nom,
      required this.prenom,
      required this.adress,
      required this.phone,
      required this.genre,
      required this.photo,
      required this.citation})
      : super(key: key);
  final nom, prenom, adress, phone, genre, photo, citation;

  @override
  State<UpdatedUser> createState() => _UpdatedUserState();
}

class _UpdatedUserState extends State<UpdatedUser> {
  final _firstnameController = TextEditingController();
  final _adressControler = TextEditingController();
  final _phoneController = TextEditingController();
  final _lastnameController = TextEditingController();

  final _pictureUrlController = TextEditingController();
  final _citationController = TextEditingController();
  final _sexController = TextEditingController();
  UserController userController = UserController(UserRepository());
  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(
        List.generate(len, (index) => r.nextInt(33) + 89));
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final agrs = ModalRoute.of(context)?.settings.arguments as List<String>;
    if (agrs.isNotEmpty) {
      for (var i = 0; i < agrs.length; i++) {
        _firstnameController.text = agrs[0];
        _lastnameController.text = agrs[1];
        _adressControler.text = agrs[2];
        _phoneController.text = agrs[3];
        _sexController.text = agrs[4];
        _pictureUrlController.text = agrs[5];
        _citationController.text = agrs[6];
      }
    }

    var we = MediaQuery.of(context).size.width;
    var he = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Inscription"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                  child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 5),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _firstnameController,

                        decoration: const InputDecoration(
                          hintText: 'Votre nom ?',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(183, 94, 171, 56),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                            ),
                          ),
                          labelText: 'Nom *',
                          suffixStyle: TextStyle(
                              color: const Color.fromARGB(183, 94, 171, 56)),
                        ),
                        validator: (String? value) {
                          return (value == null || value == "")
                              ? 'Ce champ est obligatoire:'
                              : null;
                        },
                        //onSaved: (val) => name = val!,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.name,
                        controller: _lastnameController,
                        decoration: const InputDecoration(
                          hintText: 'Vos prenoms ?',
                          labelText: 'Prenoms*',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Color.fromARGB(183, 94, 171, 56),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (String? value) {
                          return (value == null || value == "")
                              ? 'Ce champ est obligatoire:'
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _adressControler,
                        decoration: const InputDecoration(
                          hintText: 'votre adresse?',
                          labelText: 'Adresse *',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: const Color.fromARGB(183, 94, 171, 56),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (String? value) {
                          return (value == null || value == "")
                              ? 'Ce champ est obligatoire:'
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: _phoneController,
                        decoration: const InputDecoration(
                          hintText: 'numero de telephone?',
                          labelText: 'Contact *',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Color.fromARGB(183, 94, 171, 56),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (String? value) {
                          return (value == null || value == "")
                              ? 'Ce champ est obligatoire:'
                              : null;
                        },
                        //onSaved: (val) => num = val!,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _sexController,
                        decoration: const InputDecoration(
                          hintText: 'votre sex?',
                          labelText: 'Sex *',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Color.fromARGB(183, 94, 171, 56),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        validator: (String? value) {
                          return (value == null || value == "")
                              ? 'Ce champ est obligatoire:'
                              : null;
                        },
                        //onSaved: (val) => num = val!,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: _pictureUrlController,
                        decoration: const InputDecoration(
                            hintText: 'https://affjgll',
                            labelText: 'Url photo *',
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              borderSide: BorderSide(
                                color: Color(0xFFBEC5D1),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(12.0),
                              ),
                              borderSide: BorderSide(
                                color: Color(0xFFBEC5D1),
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Color.fromARGB(183, 94, 171, 56),
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            )),

                        // onSaved: (val) => pwd = val!,
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        controller: _citationController,
                        decoration: const InputDecoration(
                          hintText: 'Votre citation preferé?',
                          labelText: 'Citation *',
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(12.0),
                            ),
                            borderSide: BorderSide(
                              color: Color(0xFFBEC5D1),
                            ),
                          ),
                          hintStyle: TextStyle(
                            color: Color.fromARGB(183, 94, 171, 56),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        // onSaved: (val) => conPwd = val!,
                      ),
                      SizedBox(
                        height: he * 0.04,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          UserModel user = new UserModel();
                          user.firstname = _firstnameController.text;
                          user.lastname = _lastnameController.text;
                          user.adress = _adressControler.text;
                          user.id = generateRandomString(15);
                          user.gender = _sexController.text;
                          user.phone = _phoneController.text;
                          user.picture = _pictureUrlController.text;
                          user.citation = _pictureUrlController.text;
                          userController.addUser(user);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeSreen()));
                        },
                        child: const Text('Valider'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          // shadowColor: Color.fromARGB(183, 35, 98, 3),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          ),
        ));
  }
}
