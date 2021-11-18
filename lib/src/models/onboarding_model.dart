class UnbordingContent {
  String? image;
  String? title;
  String? discription;

  UnbordingContent({this.image, this.title, this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
    title: 'Available',
    image: 'assets/images/available.svg',
    discription: "With a loan, you are not alone",
  ),
  UnbordingContent(
    title: 'Efficient',
    image: 'assets/images/efficient.svg',
    discription:"If money is the problem, \n make us your solution",
  ),
  UnbordingContent(
    title: 'Reliable',
    image: 'assets/images/reliable.svg',
    discription: "Coming at your financial, \n            rescue"
  ),
];