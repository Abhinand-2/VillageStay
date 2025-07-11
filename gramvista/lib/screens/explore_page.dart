final response = await Supabase.instance.client
  .from('community_submissions')
  .select()
  .eq('is_admin_approved', true)
  .order('promotion_expiry', ascending: false);
