import 'package:flutter/material.dart';
import 'package:vumobile/core/base/base_view_model.dart';
import 'package:vumobile/core/models/dataModel.dart';
import 'package:vumobile/core/services/apiProvider.dart';

class HomeViewModel extends BaseViewModel {


  DataModel dataModel;

  fetchData()  async {
    this.busy = true;
    apiProvider.fetchList().then((model){
      this.dataModel = model;
      for (var item in dataModel.dataList) {
        debugPrint(item.email.toString());
      }
      this.busy = false;
      notifyListeners();
    });
    
    
  }

}