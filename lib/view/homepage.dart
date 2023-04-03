import 'package:flutter/material.dart';
import 'package:flutter_github_trending_repo/controller/respo_controller.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RepoController controller = RepoController();

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> getData() async {
    await controller.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: Column(
                children: const <Widget>[
                  Text(
                    'Github Repos',
                  ),
                  Text(
                    'Trending',
                  )
                ],
              )),
          centerTitle: true,
        ),
        body: Obx(() {
          return Container(
            child: controller.isLoading.value
                ? const Center(child: CircularProgressIndicator())
                : buildBody(context)
          );
        }));
  }

  Widget buildBody(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: controller.repoModel?.items?.length,
        itemBuilder: (BuildContext context, int index) {
          var repoName = controller.repoModel?.items![index].name;
          var repoDes =
              controller.repoModel?.items![index].description;
          var repoOwner =
              controller.repoModel?.items![index].owner!.login;
          var repoStar =
              controller.repoModel?.items![index].stargazersCount;
          var repoAvatar =
              controller.repoModel?.items![index].owner!.avatarUrl;
          return Card(
            elevation: 5,
            child: InkWell(
                onTap: () {},
                highlightColor: Colors.lightBlueAccent,
                splashColor: Colors.red,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Repo Name:  $repoName.toString()",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                              'Repo Desc:  $repoDes.toString()',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                  child: Text(
                                      "Repo Owner:   $repoOwner.toString()",
                                      textAlign: TextAlign.start,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall)),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[
                                    const Icon(
                                      Icons.star,
                                      color: Colors.deepOrange,
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          top: 4.0),
                                      child: Text(
                                          repoStar.toString(),
                                          textAlign:
                                          TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: Colors.red,
                                    child: Image.network(repoAvatar!),
                                  ))
                            ],
                          ),
                        ),
                      ]),
                )),
          );
        });
  }
}
