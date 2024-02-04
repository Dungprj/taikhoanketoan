import 'package:flutter/material.dart';
import 'account_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tài Khoản Kế Toán',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tài Khoản Kế Toán'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                labelText: 'Tìm kiếm',
                hintText: 'Nhập từ khóa...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    searchController.clear();
                    setState(() {});
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: AccountData.searchAccounts(searchController.text).length,
              itemBuilder: (context, index) {
                var account = AccountData.searchAccounts(searchController.text)[index];
                return ListTile(
                  leading: IconButton(
                    icon: Icon(
                      account.isFavorite ? Icons.star : Icons.star_border,
                      color: account.isFavorite ? Colors.yellow : null,
                    ),
                    onPressed: () {
                      AccountData.toggleFavoriteStatus(account);
                      setState(() {});
                    },
                  ),
                  title: Text(account.name),
                  subtitle: Text(account.code),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
