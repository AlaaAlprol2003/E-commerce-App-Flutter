abstract class Validator {
 static String? nameValidate(String? name) {
    if (name == null || name.trim().isEmpty) {
      return "This Field Is Reauired";
    }
    return null;
  }

 static String? phoneValidate(String? phone) {
    final RegExp mobileNumberRegExp = RegExp(r'^01[0125]\d{8}$');
    if (phone == null || phone.trim().isEmpty) {
      return "This Field Is Reauired";
    }
    if (!mobileNumberRegExp.hasMatch(phone)) {
      return "Please,Enter Valid Phone Number";
    }
    return null;
  }

 static String? emailValidate(String? email) {
    final RegExp emailRegExp = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    if (email == null || email.trim().isEmpty) {
      return "This Field Is Reauired";
    }
    if (!emailRegExp.hasMatch(email)) {
      return "Please,Enter Valid Email";
    }
    return null;
  }

 static String? passwordValidate(String? password) {
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[A-Z])(?=.*[a-z])(?=(.*\d){4,})(?=.*[!@#$%^&*]).{8,}$',
    );

    if (password == null || password.trim().isEmpty) {
      return "This Field Is Reauired";
    }
    if (!passwordRegExp.hasMatch(password)) {
      return "Please,Enter Strong Password";
    }
    return null;
  }
}
