
class serverUrl{
  static String baseUrl ="http://192.168.1.2:3000/api/";


geturl(RequestType RequestTypes){
  switch (RequestTypes){
    case RequestType.register:
        return baseUrl+RequestType.register.name;

    case RequestType.getUserData:
        return baseUrl+RequestType.getUserData.name;

    case RequestType.login:
         return baseUrl + RequestType.login.name;   
    case RequestType.forgot_password:
        return baseUrl+RequestType.forgot_password.name;
    case RequestType.verify_otp:
        return baseUrl+RequestType.verify_otp.name;
    case RequestType.reset_password:
        return baseUrl+RequestType.reset_password.name;
    case RequestType.updateUser:
        return baseUrl+RequestType.updateUser.name;
    case RequestType.addProperty:
        return baseUrl+RequestType.addProperty.name;
    case RequestType.createTickerIssue:
      // TODO: Handle this case.
    case RequestType.updateTicketIssue:
      // TODO: Handle this case.
    case RequestType.getByproperty:
      // TODO: Handle this case.
    case RequestType.getByTicket:
      // TODO: Handle this case.
    case RequestType.getAdminIssues:
      // TODO: Handle this case.
    case RequestType.getByuserId:
      // TODO: Handle this case.
    case RequestType.Add_favourite:
      // TODO: Handle this case.
    case RequestType.fav_UserId:
      // TODO: Handle this case.
    case RequestType.fav_PropertyId:
      // TODO: Handle this case.
    case RequestType.fav_RoomId:
      // TODO: Handle this case.
    case RequestType.addBooking:
      // TODO: Handle this case.
    case RequestType.showBookings:
      // TODO: Handle this case.
    case RequestType.getUserBooking:
      // TODO: Handle this case.
    case RequestType.getVendorBooking:
      // TODO: Handle this case.
    case RequestType.updatePayment:
      // TODO: Handle this case.
    case RequestType.updateBookingStatus:
      // TODO: Handle this case.
    case RequestType.updateProperty:
      // TODO: Handle this case.
    case RequestType.showProperties:
      // TODO: Handle this case.
    case RequestType.getPropertiesByStatus:
      // TODO: Handle this case.
    case RequestType.getPropertiesByStatusVendor:
      // TODO: Handle this case.
    case RequestType.updateStatus:
      // TODO: Handle this case.
    case RequestType.updateStatusVendor:
      // TODO: Handle this case.
  }

}

}


enum RequestType{
  register,
  login,
  forgot_password,
  verify_otp,
  reset_password,
  getUserData,
  updateUser,
  createTickerIssue,
  updateTicketIssue,
  getByproperty,
  getByTicket,
  getAdminIssues,
  getByuserId,
  Add_favourite,
  fav_UserId,
  fav_PropertyId,
  fav_RoomId,
  addBooking,
  showBookings,
  getUserBooking,
  getVendorBooking,
  updatePayment,
  updateBookingStatus,
  addProperty,
  updateProperty,
  showProperties,
  getPropertiesByStatus,
  getPropertiesByStatusVendor,
  updateStatus,
  updateStatusVendor,

}
