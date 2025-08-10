import '../entities/create_booking_response.dart';
import '../entities/past_booking.dart';

abstract class BookingRepository {
  Future<CreateBookingResponse> createBooking();
  Future<List<PastBooking>> pastBookings();
}
