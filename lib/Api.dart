class Api {
  String? dateTime;

  Future<String> getDateAndTime() {
    return Future.delayed(
        const Duration(seconds: 1),
            () => DateTime.now().toIso8601String()).
    then((value){
      dateTime = value;
      return value;
    });
  }
}