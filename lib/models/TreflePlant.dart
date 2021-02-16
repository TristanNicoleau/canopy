class TreflePlant {
  int id;
  String common_name;
  String
      slug; // An unique human-readable identifier (if you can, prefer to use this over id)
  String
      scientific_name; // The scientific name follows the Binomial nomenclature, and represents its genus and its species within the genus, resulting in a single worldwide name for each organism. The scientific name of an infraspecific taxons (ranks below species, such as subspecies, forms, varieties...) is a combination of the name of a species and an infraspecific epithet. A connecting term is used to denote the rank. See IAPT recommendation
  int year; // The first publication year of a valid name of this species. See author citation
  String
      bibliography; //	The first publication of a valid name of this species. See author citation
  String
      author; // The author(s) of the first publication of a valid name of this species. See author citation
  String status; // The acceptance status of this species by IPNI
  String rank; // The taxonomic rank of the species
  String
      family_common_name; // The common name (in english) of the species family
  String family; // The scientific name of the species family
  int genus_id; // The id of the species genus
  String genus; // The scientific name of the species genus
  String image_url; //	A main image url of the species
  List duration; // The plant duration(s), which can be:
  // Annual: plants that live, reproduce, and die in one growing season.
  // Biennial: plants that need two growing seasons to complete their life cycle, normally completing vegetative growth the first year and flowering the second year.
  // Perennial: plants that live for more than two years, with the shoot system dying back to soil level each year.
  List edible_part; // The plant edible part(s), if any.
  bool edible; // Is the species edible?
  bool vegetable; // Is the species a vegetable?
  String observations; // Some habit observations on the species
  List synonyms; // The symonyms scientific names and authors
  List sources; // The symonyms scientific names and authors

  TreflePlant({
    this.id,
    this.common_name,
    this.slug,
    this.scientific_name,
    this.year,
    this.bibliography,
    this.author,
    this.status,
    this.rank,
    this.family_common_name,
    this.family,
    this.genus_id,
    this.genus,
    this.image_url,
    this.duration,
    this.edible_part,
    this.edible,
    this.vegetable,
    this.observations,
    this.synonyms,
    this.sources,
  });

  // Parse Json object to TreflePlant instance
  static TreflePlant fromJson(Map<String, dynamic> json) {
    return TreflePlant(
      id: json["id"],
      common_name: json["common_name"],
      slug: json["slug"],
      scientific_name: json["scientific_name"],
      year: json["year"],
      bibliography: json["bibliography"],
      author: json["author"],
      status: json["status"],
      rank: json["rank"],
      family_common_name: json["family_common_name"],
      family: json["family"],
      genus_id: json["genus_id"],
      genus: json["genus"],
      image_url: json["image_url"],
      duration: json["duration"],
      edible_part: json["edible_part"],
      edible: json["edible"],
      vegetable: json["vegetable"],
      observations: json["observations"],
      synonyms: json["synonyms"],
      sources: json["sources"],
    );
  }
}
