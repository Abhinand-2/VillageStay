await Supabase.instance.client.from('bookings').insert({
  'user_id': Supabase.instance.client.auth.currentUser!.id,
  'submission_id': listingId,
  'preferred_date': selectedDate.toIso8601String(),
  'message': 'Excited to visit!'
});
