import 'package:flutter/material.dart';
import 'package:fluttercookbook/components/app/top_search_bar.dart';
import 'package:fluttercookbook/components/home/body.dart';
import 'package:fluttercookbook/helpers/database_helpers.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _search = false;

  void _toggleSearch([bool nextSearch]) {
    setState(() {
      _search = nextSearch ?? _search;
    });
  }

  void _saveRecipe() async {
    Recipe recipe = Recipe();
    recipe.name = 'Souflee';
    recipe.totalTime = 30;
    DatabaseHelper helper = DatabaseHelper.instance;
    int id = await helper.insert(recipe);
    print('inserted recipe: $id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(64.0),
        child: SafeArea(
          child: Center(
            child: Container(
              child: TopSearchBar(
                search: _search,
                toggleSearch: _toggleSearch,
              ),
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.amber[800],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _saveRecipe,
        tooltip: 'Increment',
        child: Icon(Icons.create),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
