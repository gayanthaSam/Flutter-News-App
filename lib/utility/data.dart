import 'package:flutter_application_1/models/news_category.dart';

List<NewsCategoryModel> getNewsCategories() {
  NewsCategoryModel general = NewsCategoryModel(
    newsCategoryName: "Technology",
    imageUrl:
        "https://images.unsplash.com/photo-1495020689067-958852a7765e?q=80&w=2938&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  );

  NewsCategoryModel entertainment = NewsCategoryModel(
    newsCategoryName: "Entertainment",
    imageUrl:
        "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  );

  NewsCategoryModel health = NewsCategoryModel(
    newsCategoryName: "Health",
    imageUrl:
        "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?q=80&w=2832&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  );

  NewsCategoryModel sports = NewsCategoryModel(
    newsCategoryName: "Sports",
    imageUrl:
        "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  );

  List<NewsCategoryModel> newsCategories = [
    general,
    entertainment,
    health,
    sports
  ];

  return newsCategories;
}
