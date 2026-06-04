class CategoryModel {
  String title;
  String id;

  CategoryModel({required this.title, required this.id});
  static List<CategoryModel> categories = [
    CategoryModel(title: "General", id: "General"),
    CategoryModel(title: "Business", id: "Business"),
    CategoryModel(title: "Sports", id: "Sports"),
    CategoryModel(title: "Technology", id: "Technology"),
    CategoryModel(title: "Entertainment", id: "Entertainment"),
    CategoryModel(title: "Health", id: "Health"),
    CategoryModel(title: "Science", id: "Science"),
  ];
}
