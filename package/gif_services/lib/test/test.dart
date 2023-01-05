import 'package:gif_services/gif_services.dart';

void main() async{
  final gifServices = GifServices();
  final gifs = await gifServices.getGifs();
  for(final gif in gifs){
    print(gif);
  }
}