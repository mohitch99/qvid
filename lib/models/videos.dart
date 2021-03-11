class Video {
  final String? title;
  final String description;
  final String? thumbnail;
  final String? url;
  final String? author;
  final DateTime? createdAt;
  final int likes;

  Video(this.description, this.likes,
      {this.title, this.thumbnail, this.url, this.author, this.createdAt});
}
