class Validators{
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email address.';
    }
    final emailRegex = RegExp(r'^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password.';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null;
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a name.';
    }

    final nameRegExp = RegExp(r'^[a-zA-Z\s]+$');

    if (!nameRegExp.hasMatch(value)) {
      return 'Invalid name format';
    }

    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a phone number.';
    }
    if (value.length < 11) {
      return 'Please enter a valid phone number.';
    }
    return null;
  }
  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a address.';
    }
    return null;
  }
  String? validateGender(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your gender';
    }

    final lowercaseValue = value.toLowerCase();
    if(lowercaseValue == 'gay'){
      return 'Gays are not allowed';
    }
    if (lowercaseValue != 'male' && lowercaseValue != 'female') {
      return 'Invalid gender';
    }

    return null;
  }

}