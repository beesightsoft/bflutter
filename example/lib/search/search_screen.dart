import 'package:bflutter_poc/detail/detail_screen.dart';
import 'package:bflutter_poc/model/user_base.dart';
import 'package:bflutter_poc/search/search_bloc.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Screen')),
      body: _SearchInfo(),
    );
  }
}

class _SearchInfo extends StatefulWidget {
  @override
  ___SearchInfoState createState() => ___SearchInfoState();
}

class ___SearchInfoState extends State<_SearchInfo> {
  final bloc = SearchBloc();

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Row(
              children: <Widget>[
                Icon(Icons.search),
                Expanded(
                  child: TextField(
                    onChanged: bloc.searchUser.push,
                    autofocus: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Please enter a search term',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Container(
            child: StreamBuilder(
              stream: bloc.loading.stream,
              builder: (context, loading) {
                if (loading.hasData && loading.data) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Container();
              },
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: bloc.searchUser.stream,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                if (!snapshot.hasData || (snapshot?.data)?.length == 0) {
                  return Text('No data');
                }
                List<UserBase> users = snapshot.data;
                return ListView.builder(
                  itemCount: users.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FlatButton(
                      child: Row(
                        children: <Widget>[
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(users[index].avatarUrl),
                            radius: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 10),
                            child: Text('${users[index].login}'),
                          ),
                        ],
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(userBase: users[index])));
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
