final listing = await Supabase.instance.client
  .from('community_submissions')
  .select()
  .eq('id', listingId)
  .single();

final reviews = await Supabase.instance.client
  .from('reviews')
  .select()
  .eq('submission_id', listingId);
