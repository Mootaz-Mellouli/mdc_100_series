// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // TODO: Add text editing controllers (101)
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _unfocusedColor = Colors.grey[600];
  final _usernameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                const SizedBox(height: 16.0),
                 Text('SHRINE',
                  style: Theme.of(context).textTheme.headline5,),
              ],
            ),
            const SizedBox(height: 120.0),
            // TODO: Wrap Username with AccentColorOverride (103)
            // TODO: Remove filled: true values (103)
            // TODO: Wrap Password with AccentColorOverride (103)
            // TODO: Add TextField widgets (101)
             TextField(
              controller: _usernameController,
              decoration:  InputDecoration(
                labelText: 'Username' ,
                labelStyle: TextStyle(
                    color: _usernameFocusNode.hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : _unfocusedColor),

              ),
               focusNode: _usernameFocusNode,
            ),
            //spacer
            const SizedBox(height: 12.0,),
            //password
             TextField(
              controller: _passwordController,
              decoration:  InputDecoration(
                labelText: 'password',
                labelStyle: TextStyle(
                    color: _passwordFocusNode.hasFocus
                        ? Theme.of(context).colorScheme.secondary
                        : _unfocusedColor
                ),
              ),
               focusNode: _passwordFocusNode,
              obscureText: true,
            ),
            // TODO: Add button bar (101)
             ButtonBar(
              children: <Widget>[
                TextButton(
                    child: Text('Cancel'),
                    onPressed: (){
                      _usernameController.clear();
                    },
                ),
                ElevatedButton(
                    child: Text('Next') ,
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(8.0),
                    ),
                    onPressed: () {
                      _passwordController.clear();
                      Navigator.pop(context);
                    }
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _usernameFocusNode.addListener(() {
      setState(() {
        //Redraw so that the username label reflects the focus state
      });
    });
    _passwordFocusNode.addListener(() {
      setState(() {
        //Redraw so that the password label reflects the focus state
      });
    });
  }
}


// TODO: Add AccentColorOverride (103)
