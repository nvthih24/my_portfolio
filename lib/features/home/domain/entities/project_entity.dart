class ProjectEntity {
  final String title;
  final String description;
  final String imageUrl;
  final String? gitHubLink;

  const ProjectEntity({
    required this.title,
    required this.description,
    required this.imageUrl,
    this.gitHubLink,
  });
}
