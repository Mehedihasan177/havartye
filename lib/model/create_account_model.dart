class CreateAccountModel{

  late String name;
  late String user_name;
  late String phone;
  late String nid_number;
  late String pos_id;
  late String email;
  late int division_id;
  late int district_id;
  late String area;
  late String position;
  late String password;

  CreateAccountModel({
    required this.name,
    required this.user_name,
    required this.nid_number,
    required this.email,
    required this.phone,
    required this.pos_id,
    required this.division_id,
    required this.district_id,
    required this.area,
    required this.position,
    required this.password,
});

}