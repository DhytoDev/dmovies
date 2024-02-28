import 'package:equatable/equatable.dart';

class Video extends Equatable {
  final String id;
  final String name;
  final String key;
  final String type;

  const Video({
    this.id = '',
    this.name = '',
    this.key = '',
    this.type = '',
  });

  @override
  List<Object?> get props => [id, name, key, type];

  String getImageVideoUrl() => 'https://i1.ytimg.com/vi/$key/0.jpg';
}
