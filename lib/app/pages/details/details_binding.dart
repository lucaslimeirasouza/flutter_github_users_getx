import 'package:dio/dio.dart';
import 'package:flutter_users_getx/app/data/repositories/github_repository.dart';
import 'package:flutter_users_getx/app/pages/details/details_controller.dart';
import 'package:get/get.dart';

setUpDetails() {
  Get.put<DetailsController>(
      DetailsController(repository: GithubRepository(dio: Dio())));
}
