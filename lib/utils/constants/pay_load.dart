///as given in the pdf
///change device type to 0 or 1
///grant_type to "password"
///

Map<String, dynamic> payload = {
  "query": '''
query Auth_Login(\$loginData: LoginInput!) {
  Auth_Login(loginData: \$loginData) {
    accessToken
  }
}
''',
  "variables": {
    "loginData": {
      "_deviceType": "",
      "_email": "developer.fayizalinp@gmail.com",
      "_password": "0RneWfb0",
      "_userType": 0,
      "deviceId": "",
      "deviceName": "test",
      "deviceToken": "test",
      "grant_type": "login"
    }
  }
};
