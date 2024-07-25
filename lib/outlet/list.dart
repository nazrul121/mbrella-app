// lib/main.dart

import 'package:flutter/material.dart';
import '../../api_service.dart';
import '../../models/user.dart';

class Outlet extends StatefulWidget {
  const Outlet({Key? key}) : super(key: key);

  @override
  State<Outlet> createState() => _OutletState();
}

class _OutletState extends State<Outlet> {
  late ScrollController _scrollController;
  final List<User> _users = [];
  bool _isLoading = false;
  int _page = 0;
  int _pageSize = 10;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
    _fetchUsers();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      if (!_isLoading) {
        _fetchUsers();
      }
    }
  }

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
    });
    try {
      List<User> users = await ApiService.fetchUsers(page: _page, pageSize: _pageSize);
      setState(() {
        _users.addAll(users);
        _isLoading = false;
        _page =_pageSize;
        _pageSize =_pageSize + 10;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        print('Error fetching users: $e');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Outlets '),
        backgroundColor: Colors.yellow.withOpacity(0.3),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _page = 0;
          // _users.clear();
          await _fetchUsers();
        },
        child: GridView.builder(
          controller: _scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two items per row
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _users.length + (_isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < _users.length) {
              return UserItem(_users[index]);
            } else {
              if (_isLoading) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: CircularProgressIndicator(color: Colors.blueGrey, backgroundColor: Colors.yellow.withOpacity(0.3)),
                  ),
                );
              } else {
                return const Center(child: Text('End of users'));
              }
            }
          },
        ),

      ),

    );
  }
}

class UserItem extends StatelessWidget {
  final User user;

  const UserItem(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle user tap, e.g., navigate to user details page
      },
      child: Card(
        elevation: 0,
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(user.image),
              radius: 30,
            ),
            const SizedBox(height: 10),
            Text(
              '${user.firstName} ${user.lastName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              user.email,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
