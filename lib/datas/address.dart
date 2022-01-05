// Frete
// Padronizar os dados do endereço caso a API seja trocada. Tornando os dados de endereço como globais
class Address {
  Address(
      {this.street,
      this.number,
      this.complement,
      this.district,
      this.zipCode,
      this.city,
      this.state,
      this.latitude,
      this.longitude});
  String street;
  String number;
  String complement;
  String district;
  String zipCode;
  String city;
  String state;

  double latitude;
  double longitude;
}