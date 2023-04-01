class Pelicula {
  final String title;
  final String urlImage;
  final String sinopsis;
  final String urlVideo;
  const Pelicula(
      {required this.title,
      required this.urlImage,
      required this.sinopsis,
      required this.urlVideo});
}

const allMovies = [
  Pelicula(
      title: 'Hereditary',
      urlImage: 'assets/hereditary.jpeg',
      sinopsis:
          'Después de la muerte de la matriarca de los Graham, su hija, Annie, se muda a la casa con su familia. Annie espera olvidar los problemas que tuvo en su infancia allí, pero todo se tuerce cuando su hija empieza a ver figuras fantasmales.',
      urlVideo:
          'https://assets.mixkit.co/videos/preview/mixkit-dog-catches-a-ball-in-a-river-1494-large.mp4'),
  Pelicula(
      title: 'Joker',
      urlImage: 'assets/joker.jpg',
      sinopsis:
          'La pasión de Arthur Fleck, un hombre ignorado por la sociedad, es hacer reír a la gente. Sin embargo, una serie de trágicos sucesos harán que su visión del mundo se distorsione considerablemente convirtiéndolo en un brillante criminal.',
      urlVideo:
          'https://assets.mixkit.co/videos/preview/mixkit-people-pouring-a-warm-drink-around-a-campfire-513-large.mp4'),
  Pelicula(
      title: 'Parasite',
      urlImage: 'assets/parasite.jpeg',
      sinopsis:
          'Tanto Gi Taek como su familia están sin trabajo. Cuando su hijo mayor, Gi Woo, empieza a recibir clases particulares en la adinerada casa de Park, las dos familias, que tienen mucho en común pese a pertenecer a dos mundos totalmente distintos, comienzan una relación de resultados imprevisibles.',
      urlVideo:
          'https://assets.mixkit.co/videos/preview/mixkit-stars-in-space-background-1610-large.mp4'),
  Pelicula(
      title: 'Batman: El caballero de la noche',
      urlImage: 'assets/batman.jpg',
      sinopsis:
          'Con la ayuda del teniente Jim Gordon y del Fiscal del Distrito Harvey Dent, Batman mantiene a raya el crimen organizado en Gotham. Todo cambia cuando aparece el Joker, un nuevo criminal que desencadena el caos y tiene aterrados a los ciudadanos.',
      urlVideo:
          'https://assets.mixkit.co/videos/preview/mixkit-waterfall-in-forest-2213-large.mp4'),
];
