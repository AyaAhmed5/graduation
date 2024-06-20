class Auth {
	dynamic message;
	bool? isAuthenticated;
	String? username;
	String? email;
	List<dynamic>? roles;
	String? token;
	dynamic refreshToken;
	String? refreshTokenExpiration;

	Auth({
		this.message, 
		this.isAuthenticated, 
		this.username, 
		this.email, 
		this.roles, 
		this.token, 
		this.refreshToken, 
		this.refreshTokenExpiration, 
	});

	factory Auth.fromJson(Map<String, dynamic> json) => Auth(
				message: json['message'] as dynamic,
				isAuthenticated: json['isAuthenticated'] as bool?,
				username: json['username'] as String?,
				email: json['email'] as String?,
				roles: json['roles'] as List<dynamic>?,
				token: json['token'] as String?,
				refreshToken: json['refreshToken'] as dynamic,
				refreshTokenExpiration: json['refreshTokenExpiration'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'isAuthenticated': isAuthenticated,
				'username': username,
				'email': email,
				'roles': roles,
				'token': token,
				'refreshToken': refreshToken,
				'refreshTokenExpiration': refreshTokenExpiration,
			};
}
