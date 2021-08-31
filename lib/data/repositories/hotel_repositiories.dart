import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/data/model/Hotel_model.dart';

abstract class HotelRepositiories {
  List<Hotel> loadHotel();
}

class HotelImpl implements HotelRepositiories {
  @override
  List<Hotel> loadHotel() {
    List<Hotel> categorList = [
      new Hotel(
          image: AppImage.img8,
          cost: 'from 30/month',
          bath: 2,
          bed: 2,
          info: '18% less than usual ',
          name: 'Muscat Holiday Resort',
          swimming: 1),
      new Hotel(
          image: AppImage.img7,
          cost: 'from 30/month',
          bath: 2,
          bed: 3,
          info: '8% less than usual ',
          name: 'Ocean Paradise',
          swimming: 1),
      new Hotel(
          image: AppImage.img6,
          cost: 'from 30/month',
          bath: 2,
          bed: 2,
          info: '18% less than usual ',
          name: 'Hotel Diamond place',
          swimming: 2),
      new Hotel(
          image: AppImage.img5,
          cost: 'from 30/month',
          bath: 1,
          bed: 8,
          info: '8% less than usual ',
          name: 'Himalayan Height Hotel',
          swimming: 1),
      new Hotel(
          image: '',
          cost: 'from 30/month',
          bath: 2,
          bed: 2,
          info: '8% less than usual ',
          name: 'Long Beach Hotel',
          swimming: 1),
    ];
    return categorList;
  }
}
