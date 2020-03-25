import 'dart:async';
import 'package:ben_demistim/bloc/topic_bloc.dart';
import 'package:ben_demistim/bloc/topic_event.dart';
import 'package:ben_demistim/model/topic.dart';
import 'package:ben_demistim/services/network_utils.dart';
import 'package:ben_demistim/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
	static final String routeName = '/home';

	@override
	State<StatefulWidget> createState() {
		return new _HomePageState();
	}

}

class _HomePageState extends State<HomePage> {
	GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
	Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

	SharedPreferences _sharedPreferences;
	var _authToken, _id, _name, _homeResponse;

	@override
	void initState() {
		super.initState();
		_fetchSessionAndNavigate();
	}

	@override
	void dispose(){
		super.dispose();
	}

	_fetchSessionAndNavigate() async {
		_sharedPreferences = await _prefs;
		String authToken = AuthUtils.getToken(_sharedPreferences);
		var id = _sharedPreferences.getInt(AuthUtils.userIdKey);
		var name = _sharedPreferences.getString(AuthUtils.nameKey);

		//print(authToken);

		_fetchHome(authToken);

		setState(() {
			_authToken = authToken;
			_id = id;
			_name = name;
		});

		if(_authToken == null) {
			_logout();
		}
	}

	_fetchHome(String authToken) async {
		var responseJson = await NetworkUtils.fetch(authToken, '/api/v1/home');

		if(responseJson == null) {

			NetworkUtils.showSnackBar(_scaffoldKey, 'Something went wrong!');

		} else if(responseJson == 'NetworkError') {

			NetworkUtils.showSnackBar(_scaffoldKey, null);

		} else if(responseJson['errors'] != null) {

			_logout();

		}

		setState(() {
		  _homeResponse = responseJson.toString();
		});
	}

	_logout() {
		NetworkUtils.logoutUser(_scaffoldKey.currentContext, _sharedPreferences);
	}


	@override
	Widget build(BuildContext context) {

		return Scaffold(

			body: Center(
				child: Text('Loading...'),
			)
		);
	}
}
