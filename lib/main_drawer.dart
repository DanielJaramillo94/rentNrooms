import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_n_rooms/auth.service.dart';
import 'package:rent_n_rooms/models/user.model.dart';

class MainDrawer extends StatelessWidget {
  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User>(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          //string is active and has already receaved the first event
          final user = snapshot.data;
          return user != null
              ? Drawer(
                  child: Column(
                    children: <Widget>[
                      UserInfo(),
                      ListTile(
                        leading: Icon(
                          Icons.book,
                          size: 25,
                        ),
                        title: InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/bookings_list');
                          },
                          child: Text('Mis reservas',
                              style: TextStyle(
                                fontFamily: 'Cocogoose',
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                color: Color.fromRGBO(77, 77, 77, 1),
                              )),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await authService.signOut();
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.arrow_back,
                            size: 25,
                          ),
                          title: Text('Cerrar sesión',
                              style: TextStyle(
                                fontFamily: 'Cocogoose',
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                color: Color.fromRGBO(77, 77, 77, 1),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              :
              Drawer(
                  child: Column(
                    children: <Widget>[
                      UserInfo(),
                      InkWell(
                        onTap: () async {
                          await authService.signInWithGoogle();
                        },
                        child: ListTile(
                          leading: Icon(
                            Icons.whatshot,
                            size: 25,
                          ),
                          title: Text('Google Login',
                              style: TextStyle(
                                fontFamily: 'Cocogoose',
                                fontSize: 15,
                                fontWeight: FontWeight.w200,
                                color: Color.fromRGBO(77, 77, 77, 1),
                              )),
                        ),
                      ),
                    ],
                  ),
                );
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class UserInfo extends StatelessWidget {
  final String defaultPhotoUrl =
      'https://aumentada.net/wp-content/uploads/2015/05/user.png';
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User>(
      stream: authService.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          //string is active and has already receaved the first event
          final user = snapshot.data;
          return user != null
              ? _UserInfo(
                  photoUrl: user.getPhotoUrl(),
                  email: user.getEmail(),
                  name: user.getName())
              : _UserInfo(
                  photoUrl: defaultPhotoUrl, email: 'Inicie sesión', name: '');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

class _UserInfo extends StatelessWidget {
  _UserInfo({
    Key key,
    @required this.photoUrl,
    @required this.email,
    @required this.name,
  }) : super(key: key);

  final String photoUrl;
  final String email;
  final String name;

  final Color mainColor = Color(0xFF006BB1);
  final Color mainColorMiddle = Color(0xFF2195C6);
  final Color mainColorLighter = Color(0xFF42BEBD);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [mainColorLighter, mainColor],
        ),
      ),
      child: Center(
          child: Column(
        children: <Widget>[
          Container(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 10),
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: NetworkImage(photoUrl), fit: BoxFit.fill),
                  ),
                ),
                Flexible(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(email,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Cocogoose',
                              fontSize: 13,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            )),
                        SizedBox(
                          height: 3,
                        ),
                        Text(name,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              fontFamily: 'Cocogoose',
                              fontSize: 13,
                              fontWeight: FontWeight.w200,
                              color: Colors.white,
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }

  Map emailPart(String email) {
    List<String> emailpart = email.split('@');
    String nameEmail = emailpart[0];
    String domainEmail = emailpart[1];
    return {'nameEmail': nameEmail, 'domainEmail': domainEmail};
  }
}