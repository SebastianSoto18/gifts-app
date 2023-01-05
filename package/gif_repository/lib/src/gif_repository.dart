import 'package:gif_repository/src/models/gif_model.dart';
import 'package:gif_services/gif_services.dart';

/// {@template gif_repository}
/// gif services
/// {@endtemplate}
class GifRepository {
  /// {@macro gif_repository}
  GifRepository({GifServices? gifServices}):_gifServices = gifServices ?? GifServices();

  final GifServices _gifServices;

  Future<List<GifModel>> getGifs() async {
    final List<GifModel> gifs = [];
    final List<String> urls = await _gifServices.getGifs();
    for (final url in urls) {
      gifs.add(GifModel(url));
    }
    return gifs;
  }
}
