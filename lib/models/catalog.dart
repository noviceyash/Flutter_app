class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.desc, required this.price, required this.color, required this.image});
}

final products = [
  Item(
    id: "product001",
    name: "Birthday card",
    desc: "For Someone Special",
    price: 80,
    color: "#33505a",
    image: "https://cdn.shopify.com/s/files/1/0583/3175/8777/products/8982B.jpg?v=1634120650"
  )
];