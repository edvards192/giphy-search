class GifModel{
  final String id; 
  final String title; 
  final String previewUrl; // inside grid
  final String originalUrl; // for inspect
  // Optional params
  final String? username; // to which user gif is tied to
  final String? rating; // rating for content 

  const GifModel({
    required this.id,
    required this.title,
    required this.previewUrl,
    required this.originalUrl,
    this.username,
    this.rating,
  });
}