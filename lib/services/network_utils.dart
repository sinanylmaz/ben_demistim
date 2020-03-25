import 'dart:convert';
import 'package:ben_demistim/utils/auth_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class NetworkUtils {
	static final String host = productionHost;
	static final String productionHost = '';
	static final String developmentHost = '';

	static dynamic authenticateUser(String email, String password) async {
		var uri = host + AuthUtils.endPoint;

		try {
//			final response = await http.post(
//				uri,
//				body: {
//					'email': email,
//					'password': password
//				}
//			);


			//final responseJson = json.decode(response.body);
			final responseJson = json.decode('{"name": "John Smith","user": "john@example.com","id": 123,"auth_token": "john@example.com"}');
			return responseJson;

		} catch (exception) {
			print(exception);
			if(exception.toString().contains('SocketException')) {
				return 'NetworkError';
			} else {
				return null;
			}
		}
	}

	static logoutUser(BuildContext context, SharedPreferences prefs) {
		prefs.setString(AuthUtils.authTokenKey, null);
		prefs.setInt(AuthUtils.userIdKey, null);
		prefs.setString(AuthUtils.nameKey, null);
		Navigator.of(context).pushReplacementNamed('/');
	}

	static showSnackBar(GlobalKey<ScaffoldState> scaffoldKey, String message) {
		scaffoldKey.currentState.showSnackBar(
			new SnackBar(
				content: new Text(message ?? 'You are offline'),
			)
		);
	}

	static fetch(var authToken, var endPoint) async {
		var uri = host + endPoint;

		try {
			final response = await http.get(
				uri,
				headers: {
					'Authorization': authToken
				},
			);

			final responseJson = json.decode(response.body);
			return responseJson;

		} catch (exception) {
			print(exception);
			if(exception.toString().contains('SocketException')) {
				return 'NetworkError';
			} else {
				return null;
			}
		}
	}
}