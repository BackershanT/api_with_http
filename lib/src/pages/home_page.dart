import 'package:api_with_http/src/model/user_model.dart';
import 'package:api_with_http/src/pages/app_button.dart';
import 'package:api_with_http/src/pages/base_client.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppButton(
            operation: 'Get',
            description: 'Fetch User',
            onPressed: () async {
              var response =
                  await BaseClient().get('/users').catchError((error) {});
              if (response == null) return;
              debugPrint('successful');
              var users  =userFromJson(response);
              debugPrint('user count' + users.length.toString());
            },
          ),
          AppButton(
            operation: 'Post',
            description: 'Add User',
            onPressed: () async {
              var user = User(
                name: 'backershanT',
                qualifications:[
                  Qualification(
                    completionData: "01/01/2000",degree: 'sslc'
                  )
                ]
              );
              var response =
              await BaseClient().post('/users',user).catchError((error) {});
              if (response == null) return;
              debugPrint('successful'+user.name.toString());
            },
          ),
          AppButton(
            operation: 'Put',
            description: 'Edit User',
            onPressed: () async {
              var id =476;
              var user =User(
                name: 'Backer',

              );
              var response =
              await BaseClient().put('/users/$id',user).catchError((error) {});
              if (response == null) return;
              debugPrint('successful'+user.name.toString()+user.id.toString());
            },
          ),
          AppButton(
            operation: 'Delete',
            description: 'Delete User',
            onPressed: () async {
              var id =479;
              var response =
              await BaseClient().delete('/users/$id').catchError((error) {});
              if (response == null) return;
              debugPrint('successful+$id');
            },
          )
        ],
      ),
    );
  }
}
