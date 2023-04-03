import 'dart:convert';

import 'package:flutter_github_trending_repo/model/repo_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:date_format/date_format.dart';
class RepoController extends GetxController {
  var isLoading = false.obs;
  RepoModel? repoModel;


  @override
  Future<void> onInit() async {
    super.onInit();
    fetchData();
  }

  Future<List<RepoModel>?> fetchData() async {
    final lastMonth = DateTime.now().subtract(const Duration(days: 30));
    final formattedDate = formatDate(lastMonth, [yyyy, '-', mm, '-', dd]);
    try {
      isLoading.value = true;
      var response = await http.get(Uri.parse(
          'https://api.github.com/search/repositories?q=created:%3E$formattedDate&sort=stars&order=desc'));
      if (response.statusCode == 200) {
        ///data successfully
        var result = jsonDecode(response.body);
        print(result);
        repoModel = RepoModel.fromJson(result);
        print(repoModel?.totalCount.toString());

        update();
      } else {
        print('error fetching data');
        isLoading.value = false;
      }
    } catch (e) {
      print('Error while getting data is $e');
    } finally {
      isLoading.value = false;
    }
    return null;
  }
}
