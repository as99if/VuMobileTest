class DataModel {
  List<Data> dataList;

  DataModel.fromJson(List<dynamic> list) {
    if (list != null) {
      if (dataList == null) dataList = new List<Data>();
      list.forEach((v) {
        dataList.add(new Data.fromList(v));
      });
    }
  }
}

class Data {
  int id;
  String email;
  String first_name;
  String avatar;

  Data.fromList(Map json) {
    this.id = json['id'];
    this.email = json['email'];
    this.first_name = json['first_name'];
    this.avatar = json['avatar'];
  }
}

/*

    {
      "id": 1,
      "email": "george.bluth@reqres.in",
      "first_name": "George",
      "last_name": "Bluth",
      "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/calebogden/128.jpg"
    }
   
*/
