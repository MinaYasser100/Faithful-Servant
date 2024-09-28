import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;

const String firebasemessagingScope =
    'https://www.googleapis.com/auth/firebase.messaging';

Future<String?> getAccessToken() async {
  final serviceAccountJson = {
    "type": "service_account",
    "project_id": "faithful-servant-759bd",
    "private_key_id": "e321347488a29605556f7c59de59047d46af94ad",
    "private_key":
        "-----BEGIN PRIVATE KEY-----\nMIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDH+KfEI8+/h/jE\nk/j5Fz5D4wBG6mdVkATHvJN2TikYatjwKc/WUk3ynj4KldOhWbaBlDvcA9hXyMFa\njwF7ZiclOYpKxcY9GlDmzOKAeet4qVpcdCyKoEh4YbV+K/pf9AR00rF3KwgCvpx5\nDx+N/jaxHdaoB6yN9Iw5UR7TXM7nTx2tToVIzoUCxvHhtGivQkmLZvqtdpNh3Xqi\nHlAUATobJNLSc/lF0g5GbzFODNz5rgUI5+Ysmfsx+miKwLr5KAAwpXB2QTMtrh6h\n0cgi2TfZwR34Pfe+0qRrlNhvKPHrkh7Li6K40OJGxQs86UdvvGFNw7FUchS5EnSy\n2oeRx1mvAgMBAAECggEADPtuSM7aXzYrRvfO+Lzdj01eveaHLDLcB0Di1zyzxkte\n0hikzuaA+6NHpoBGQPoGCIY1wfmDQ2UGcyPy61lHvqRBqiEKLFACYzl3QEf/VXyz\nymobCio7CjWtsVyW4JaC7jf6ICEXCraSiflwCakwpnGoIeMoUf7yVjZB/g7PD+J2\nyUhv554gwHqxVhsCXr/tb1VGTxRc6SUD1m46Tp+uCxBdiZJtYd7+qxFfCuxSSUS1\n50KCB7uVuzfAUx7iFuaYMJgkwr0zd5JwW3FpKfpMrL4UMxBvXCivn2vevDPVcv2U\nUd060sFFTkuRMp0FELTHZCX+8orW7UZOj0jmrbMMwQKBgQD8U2tvKdEgIkhMMKKh\nc6JkZFlv5xknpbj63lluSp+qLRaQ1D/w6WrLOOVyyUbQ4IEazvJJxBgenTBxBO3g\n03YJz8DC6TeWsuXujNud829P3dQtTdUHWQETsZbGEYjA3zTTxDWDgFWgdNTbJ8a4\nnFCw/Ospx5nDRIMqKkbCoVOOaQKBgQDK4hOhtdonG1Vh2l1nBEqGITGgA2qUE/Q5\ncLEFmKUSc86u0qSSaUwIcbzNGhyeQQcZKQHO0Mic37XwITApdpoHmHg2KYUbMInv\n3k1A2Hs8W97DgpRvmY+2limBJyiOV1qG1IpjQL0y7JnQuTkzbNyPcp4Zcr6Ovaa6\nHKA/IHvUVwKBgEkbMklm6DxTMndAsB3vDuHfYTpWzqb6EPo+adLWtCPuJFeZ51y5\nhEOVHIWBY48pPL6zrudIdWSJTnuwXeuB2PVGyCaww3ZaJtxS216MJXgSYWMu5cXX\nN8So83I3qlOXWArzEj4jdKukrfdBMwZR498jqE7WkepNc2NIFHBXpYnhAoGAInYc\nV4+IKrRd4G0zCFiWQApLX56078oj5c3ag9TV1TiOlut4wNXZ8GVBaKVSzx7EkeWB\nRRv5t4vYX52DjMd0im2/nZOX5HJuO6xK+wTKigog4JzBkeNHogAHtMRuAx+bZOOd\nThalDI1b4zRTHwUSwdr6N+BhteVI+Lv8DDz8S6kCgYBozh4pknNm56Xr7rQJqdVP\ntgkC+6PJs9jtR9o0v8zuw0vp1tlPiKzBV//SRsyLIH28OqAtj/3Y7IEmE/+w+QEr\nEIVJuIAKVjMEsIHtie/2Re1pGFEe2Rbtfc1XDsuq0YdIEt8WymlQ0PW81IDLGjem\n+oaXKyRx0YlA/EUatj/kww==\n-----END PRIVATE KEY-----\n",
    "client_email": "faithful-servant-759bd@appspot.gserviceaccount.com",
    "client_id": "113947412143981492462",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://oauth2.googleapis.com/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_x509_cert_url":
        "https://www.googleapis.com/robot/v1/metadata/x509/faithful-servant-759bd%40appspot.gserviceaccount.com",
    "universe_domain": "googleapis.com"
  };

  List<String> scopes = [
    "https://www.googleapis.com/auth/userinfo.email",
    "https://www.googleapis.com/auth/firebase.database",
    "https://www.googleapis.com/auth/firebase.messaging"
  ];

  try {
    http.Client client = await auth.clientViaServiceAccount(
        auth.ServiceAccountCredentials.fromJson(serviceAccountJson), scopes);

    auth.AccessCredentials credentials =
        await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(serviceAccountJson),
      scopes,
      client,
    );

    client.close();
    return credentials.accessToken.data;
  } catch (e) {
    return null;
  }
}
