class ResponseCategoryModel {
  final int? id;
  final String? name;
  final String? path;

  ResponseCategoryModel({
    required this.id,
    required this.name,
    required this.path,
  });
}

final categories = [
  ResponseCategoryModel(
    id: 0,
    name: 'Home',
    path: 'assets/icons/house-menu.svg',
  ),
  ResponseCategoryModel(
    id: 1,
    name: 'Condominum',
    path: 'assets/icons/condominium.svg',
  ),
  ResponseCategoryModel(
    id: 2,
    name: 'Keys',
    path: 'assets/icons/keys.svg',
  ),
  ResponseCategoryModel(
    id: 3,
    name: 'Offers',
    path: 'assets/icons/menu-4.svg',
  ),
];
