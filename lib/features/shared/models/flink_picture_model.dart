import '../enums/picture_type.dart';

class FlinkPicture {
  final String path;
  final PictureType type;

  FlinkPicture({
    required this.path,
    this.type = PictureType.network,
  });
}
