class UserModel {
  dynamic id;
  dynamic firstname;
  dynamic lastname;
  dynamic adress;
  dynamic phone;
  dynamic gender;
  dynamic citation;
  dynamic picture;

  UserModel(
      {this.id,
      this.firstname,
      this.lastname,
      this.adress,
      this.phone,
      this.gender,
      this.picture,
      this.citation});

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    adress = json['adress'];
    phone = json['phone'];
    gender = json['gender'];
    picture = json['picture'];
    citation = json['citation'];
  }

  /*factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        adress: json['adress'],
        phone: json['phone'],
        gender: json['gender'],
        picture: json['picture'],
        citation: json['citation'],
      );*/

  /* UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    adress = json['adress'];
    phone = json['phone'];
    gender = json['gender'];
    picture = json['picture'];
    citation = json['citation'];
  }*/
  /* static List<UserModel> fromJson(List<dynamic> json) {
    return List.generate(json.length, (i) {
      return UserModel(
          userid: json[i]['id'],
          nom: json[i]['firstname'],
          prenom: json[i]['lastname'],
          adress: json[i]['adress'],
          phone: json[i]['phone'],
          genre: json[i]['gender'],
          picture: json[i]['picture'],
          citation: json[i]['citation']);
    });
  }*/

  /*Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['adress'] = adress;
    data['phone'] = phone;
    data['gender'] = gender;
    data['picture'] = picture;
    data['citation'] = citation;
    return data;
  }*/
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstname'] = firstname;
    map['lastname'] = lastname;
    map['adress'] = adress;
    map['phone'] = phone;
    map['gender'] = gender;
    map['picture'] = picture;
    map['citation'] = citation;
    return map;
  }
}
