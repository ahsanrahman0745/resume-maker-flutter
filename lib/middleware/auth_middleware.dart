import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? get priority => 4;

  bool isAuthenticated = false;

  @override
  RouteSettings? redirect(String? route) {
    print("checking user status");
    if(FirebaseAuth.instance.currentUser?.uid!=null){
      Get.toNamed(MyRoutes.getFeatureSelectionRoute());
    }else {
      Get.toNamed(MyRoutes.getLoginRoute());
    }
  }

  //This function will be called  before anything created we can use it to
  // change something about the page or give it new page
  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }

  //This function will be called right before the Bindings are initialized.
  // Here we can change Bindings for this page.
  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    return super.onBindingsStart(bindings);
  }

  //This function will be called right after the Bindings are initialized.
  // Here we can do something after  bindings created and before creating the page widget.
  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    return super.onPageBuildStart(page);
  }

  // Page build and widgets of page will be shown
  @override
  Widget onPageBuilt(Widget page) {
    return super.onPageBuilt(page);
  }

  //This function will be called right after disposing all the related objects
  // (Controllers, views, ...) of the page.
  @override
  void onPageDispose() {
    super.onPageDispose();
  }
}
