class MusicModel {
  final String name;
  final String imageUrl;
  final String artist;
  final double length;
  late final bool isFav;
  final String audioUrl;

  MusicModel({
    required this.name,
    required this.imageUrl,
    required this.artist,
    required this.length,
    required this.isFav,
    required this.audioUrl,
  });
}

List<MusicModel> musicList = [
  MusicModel(
      name: "Lose it",
      imageUrl: "assets/images/1.jpg",
      artist: "Flume ft. Vic Mensa",
      length: 345,
      isFav: true,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/'Quiet%20quitting'%20becoming%20common%20in%20workplaces%2F221003-quiet-quitting-a.mp3?alt=media&token=bd41ec77-0841-4e72-a095-2dfca28c1887"),
  MusicModel(
      name: "Helix",
      imageUrl: "assets/images/2.jpg",
      artist: "Flume",
      length: 430,
      isFav: false,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/DaoHoaNac-VanTich-11032905.mp3?alt=media&token=3798ed79-e556-45ac-805e-f0b5c1d5fe4e"),
  MusicModel(
      name: "Say It",
      imageUrl: "assets/images/3.jpg",
      artist: "Flume ft. Tove Lo",
      length: 250,
      isFav: false,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/'Quiet%20quitting'%20becoming%20common%20in%20workplaces%2F221003-quiet-quitting-a.mp3?alt=media&token=bd41ec77-0841-4e72-a095-2dfca28c1887"),
  MusicModel(
      name: "Never Be Like You",
      imageUrl: "assets/images/4.jpg",
      artist: "Flume • Kai",
      length: 500,
      isFav: true,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/'Quiet%20quitting'%20becoming%20common%20in%20workplaces%2F221003-quiet-quitting-a.mp3?alt=media&token=bd41ec77-0841-4e72-a095-2dfca28c1887"),
  MusicModel(
      name: "Numb & Getting Colder",
      imageUrl: "assets/images/5.jpg",
      artist: "Flume • KUCKA",
      length: 330,
      isFav: true,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/'Quiet%20quitting'%20becoming%20common%20in%20workplaces%2F221003-quiet-quitting-a.mp3?alt=media&token=bd41ec77-0841-4e72-a095-2dfca28c1887"),
  MusicModel(
      name: "Wall Out",
      imageUrl: "assets/images/6.jpg",
      artist: "Flume",
      length: 250,
      isFav: false,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/'Quiet%20quitting'%20becoming%20common%20in%20workplaces%2F221003-quiet-quitting-a.mp3?alt=media&token=bd41ec77-0841-4e72-a095-2dfca28c1887"),
  MusicModel(
      name: "Pika",
      imageUrl: "assets/images/7.jpg",
      artist: "Flume ft. Tove Lo",
      length: 450,
      isFav: true,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/'Quiet%20quitting'%20becoming%20common%20in%20workplaces%2F221003-quiet-quitting-a.mp3?alt=media&token=bd41ec77-0841-4e72-a095-2dfca28c1887"),
  MusicModel(
      name: "Space Cadet",
      imageUrl: "assets/images/8.jpg",
      artist: "Flume ft. Tove",
      length: 450,
      isFav: true,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/'Quiet%20quitting'%20becoming%20common%20in%20workplaces%2F221003-quiet-quitting-a.mp3?alt=media&token=bd41ec77-0841-4e72-a095-2dfca28c1887"),
  MusicModel(
      name: "Hyperreal",
      imageUrl: "assets/images/9.jpg",
      artist: "Tove Lo",
      length: 450,
      isFav: false,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/'Quiet%20quitting'%20becoming%20common%20in%20workplaces%2F221003-quiet-quitting-a.mp3?alt=media&token=bd41ec77-0841-4e72-a095-2dfca28c1887"),
  MusicModel(
      name: "Smoke & Retribution",
      imageUrl: "assets/images/10.jpg",
      artist: "Flume • KUCKA",
      length: 450,
      isFav: false,
      audioUrl:
          "https://firebasestorage.googleapis.com/v0/b/recordenglish-a40d9.appspot.com/o/'Quiet%20quitting'%20becoming%20common%20in%20workplaces%2F221003-quiet-quitting-a.mp3?alt=media&token=bd41ec77-0841-4e72-a095-2dfca28c1887"),
];
