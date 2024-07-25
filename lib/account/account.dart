import 'package:flutter/material.dart';
import 'package:mbrella/account/Login.dart';
import 'package:mbrella/account/register.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../includes/utility.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {});

    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                Login(),
                Register(),
              ],
            ),
          ),
          if(_tabController.index==0)...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Don't have an account?"),
                TextButton(
                  onPressed: () { _tabController.animateTo(1);  },
                  child: Text( 'Sign Up',style: TextStyle(color: Colors.yellow[700]), ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],

          if(_tabController.index==1)...[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Already have an account?"),
                TextButton(
                  onPressed: () {_tabController.animateTo(0); },
                  child: Text( 'Login', style: TextStyle(color: Colors.yellow[700]), ),
                ),
              ],
            ),
            const SizedBox(height: 30),
          ],

        ],
      );
  }
}



