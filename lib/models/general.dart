class GeneralResponse {
  int? successCode;
  String? msg;

  GeneralResponse({
    this.successCode,
    required this.msg,
  });

  factory GeneralResponse.fromMap(Map<String, dynamic> map) {
    return GeneralResponse(
      successCode: map['successCode'],
      msg: map['msg'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'successCode': successCode,
      'msg': msg,
    };
  }
}
