abstract class ModelFactory {
  factory ModelFactory.fromJson(Type type, Map<String, dynamic> json) {
    final strType = type.toString().replaceAll("?", "");
    throw UnimplementedError();

    // if (strType == (UserModel).toString()) {
    //   return UserModel.fromJson(json);
    // } else if (strType == (LoginModel).toString()) {
    //   return LoginModel.fromJson(json);
    // } else if (strType == (LaporModel).toString()) {
    //   return LaporModel.fromJson(json);
    // } else if (strType == (BuktiModel).toString()) {
    //   return BuktiModel.fromJson(json);
    // } else if (strType == (KonsultanModel).toString()) {
    //   return KonsultanModel.fromJson(json);
    // } else if (strType == (NotifikasiModel).toString()) {
    //   return NotifikasiModel.fromJson(json);
    // } else {
    //   throw UnimplementedError('`$type` factory unimplemented.');
    // }
  }
}
