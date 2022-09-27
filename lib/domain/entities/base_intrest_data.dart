import 'package:equatable/equatable.dart';

class BaseInterestData extends Equatable{

  final String id;
  final String  name;


  BaseInterestData({
    required this.id,
    required this.name});

  @override
  // TODO: implement props
  List<Object?> get props =>[
    id,name
  ];

}