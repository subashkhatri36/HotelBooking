import 'package:hotelbooking/core/constant/asset_image.dart';
import 'package:hotelbooking/data/model/category_model.dart';

abstract class CategoryRepositiories {
  List<Category> loadCategory();
}

class CategoryImpl implements CategoryRepositiories {
  @override
  List<Category> loadCategory() {
    List<Category> categorList = [
      new Category(
          image: AppImage.img4,
          title: 'Modern',
          subtitle: 'More than 504,326 House waiting for your rent or buy',
          cost: 'from 30/month'),
      new Category(
          image: AppImage.img3,
          title: 'Classic',
          subtitle: 'More than 504,326 House waiting for your rent or buy',
          cost: 'from 40/month'),
      new Category(
          image: '',
          title: 'Village',
          subtitle: 'More than 504,326 House waiting for your rent or buy',
          cost: 'from 20/month'),
      new Category(
          image: '',
          title: 'reomte',
          subtitle: 'More than 504,326 House waiting for your rent or buy',
          cost: 'from 10/month'),
    ];
    return categorList;
  }
}
