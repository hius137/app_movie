class MovieModel {
  String? image;
  String? name;
  String? actor;
  String? nameActor;
  String? roleActor;
  MovieModel({this.image, this.name, this.actor, this.nameActor, this.roleActor});
}

final dataThumbnailImage = [
  MovieModel(image: 'assets/image/movie1.jpeg', name: 'Snow White'),
  MovieModel(image: 'assets/image/movie2.jpeg', name: 'Fast And Furius'),
  MovieModel(image: 'assets/image/movie3.jpeg', name: 'Detective'),
];

final dataURImage = [
  MovieModel(image: 'assets/image/ur_movie2.jpeg'),
  MovieModel(image: 'assets/image/ur_movie1.jpeg'),
  MovieModel(image: 'assets/image/ur_movie3.jpeg'),
  MovieModel(image: 'assets/image/ur_movie4.jpeg'),
  MovieModel(image: 'assets/image/ur_movie5.jpeg'),
];

final dataActor = [
  MovieModel(actor: 'assets/image/actor1.png', nameActor: 'Chris', roleActor: 'Thor' ),
  MovieModel(actor: 'assets/image/actor2.png', nameActor: 'Natalie Portman', roleActor: 'Jane Foster' ),
  MovieModel(actor: 'assets/image/actor3.png', nameActor: 'Tom Hiddleston', roleActor: 'Loki'  ),
  MovieModel(actor: 'assets/image/actor4.png', nameActor: 'Kat Dennings', roleActor: 'Darcy Lewis'  ),
  MovieModel(actor: 'assets/image/actor5.png', nameActor: 'Anthony Hopkins', roleActor: 'Odin'  ),
];
