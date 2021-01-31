site_id = ENV['SITE_ID'] || 2659706824478437000

def return_unit_amount_in_cents(row, add_on)
  csv_unit_amount = row[:add_on_unit_amount_1]
  return (csv_unit_amount.to_f * 100).to_i if csv_unit_amount

  add_on.currency(row[:currency]).unit_amount_in_cents
end
row = {subscription_uuid: '58c39e2e72fca7cc13c9b54d66bd6db4', add_on_code_1: 'test1', add_on_quantity_1: '1', currency: 'USD'}
CSV.foreach("#{File.dirname(__FILE__)}/inputs/ob_update.csv", headers: true, header_converters: :symbol) do |row|
  subscription = Subscription.where(site_id: site_id, uuid: row[:subscription_uuid]).first

  unless subscription
    puts "Subscription with UUID(#{row[:subscription_uuid]}) not found"
    next
  end

  add_on = subscription.plan.add_ons.find_by_add_on_code(row[:add_on_code_1])
  sao = subscription.subscription_add_ons.find_by(add_on_id: add_on.add_on_id)

  unless sao
    puts "Subscription Add On with add_on_code(#{row[:add_on_code_1]}) not found"
    next
  end

  unit_amount_in_cents = return_unit_amont_in_cents(row, add_on)
  total_amount = unit_amount_in_cents * row[:add_on_quantity_1].to_i

  if unit_amount_in_cents == sao.unit_amount_in_cents
    puts "Subscription(#{subscription.uuid}) was already updated. Look at refunding Invoice"
    next
  end

  sub_version = subscription.subscription_versions_v2.last
  sao_version = SubscriptionAddOnVersionV2.find_by(subscription_version_v2_id: sub_version.id)

  ActiveRecord::Base.transaction do
    sao.update!(
      unit_amount_in_cents: unit_amount_in_cents,
      total_amount_in_cents: total_amount
    )
    sub_version.update!(add_ons_total_in_cents: total_amount)
    sao_version.update!(unit_amount_in_cents: unit_amount_in_cents)
  end
  puts "Subscription(#{subscription.uuid}) has been updated"
rescue => e
  puts "Issue updating Subscriptions(#{subscription.uuid}): #{e.message}"
end