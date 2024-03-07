import 'package:flutter/material.dart';
import 'package:flutter_users_getx/app/pages/details/details_page.dart';
import 'package:flutter_users_getx/app/pages/home/home_binding.dart';
import 'package:flutter_users_getx/app/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    setUpHome();
    _controller = Get.find<HomeController>();
    _controller.getGithubUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github users'),
      ),
      body: Obx(
        () {
          return _controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : _controller.users.isEmpty
                  ? Center(
                      child: Text('Nenhum usuario foi encontrado'),
                    )
                  : ListView.separated(
                      separatorBuilder: (_, __) => Divider(),
                      itemCount: _controller.users.length,
                      itemBuilder: (_, index) {
                        final user = _controller.users[index];
                        return ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundColor: Theme.of(context).primaryColor,
                            child: CircleAvatar(
                              radius: 45,
                              backgroundImage: NetworkImage(user.avatarUrl),
                            ),
                          ),
                          title: Text(
                            'Usuário',
                            style: TextStyle(color: Colors.black54),
                          ),
                          subtitle: Text(
                            user.login,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          onTap: () {
                            Get.to(DetailsPage(
                              username: user.login,
                            ));
                          },
                        );
                      },
                    );
        },
      ),
    );
  }
}
