import 'package:dio/dio.dart';
import 'package:flutter_users_getx/app/data/repositories/github_repository.dart';
import 'package:flutter_users_getx/app/pages/home/home_controller.dart';
import 'package:get/get.dart';

setUpHome() {
  Get.put<HomeController>(
      HomeController(repository: GithubRepository(dio: Dio())));
}
