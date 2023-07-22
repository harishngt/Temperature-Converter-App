class TemperatureLogic {
//Function for Celsius to Fahrenheit
  double celsiusToFahrenheit(double celsius) {
    return (celsius * 9 / 5) + 32;
  }

//Function for Fahrenheit to Celsius
  double fahrenheitToCelsius(double fahrenheit) {
    return (fahrenheit - 32) * 5 / 9;
  }

//Function for Celsius to Kelvin
  double celsiusToKelvin(double celsius) {
    return (celsius + 273.15);
  }

//Function for Kelvin to Celsius
  double kelvinToCelsius(double kelvin) {
    return (kelvin - 273.15);
  }

//Function for Fahrenheit to Kelvin
  double fahrenheitToKelvin(double fahrenheit) {
    double celsiusValue = fahrenheitToCelsius(fahrenheit);
    return celsiusToKelvin(celsiusValue);
  }

//Function for Kelvin to Fahrenheit
  double kelvinToFahrenheit(double kelvin) {
    double celsiusValue = kelvinToCelsius(kelvin);
    return celsiusToFahrenheit(celsiusValue);
  }
}
