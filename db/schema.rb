# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_15_050912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "account_budgets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id"
    t.decimal "proposed_amount"
    t.integer "year"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_account_budgets_on_account_id"
    t.index ["locality_id"], name: "index_account_budgets_on_locality_id"
  end

  create_table "accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "contra", default: false
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active", default: true
    t.uuid "main_account_id"
    t.datetime "last_transaction_date"
    t.index ["main_account_id"], name: "index_accounts_on_main_account_id"
    t.index ["type"], name: "index_accounts_on_type"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "trackable_type"
    t.uuid "trackable_id"
    t.string "owner_type"
    t.uuid "owner_id"
    t.string "key"
    t.text "parameters"
    t.string "recipient_type"
    t.uuid "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
    t.index ["owner_type", "owner_id"], name: "index_activities_on_owner_type_and_owner_id"
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
    t.index ["recipient_type", "recipient_id"], name: "index_activities_on_recipient_type_and_recipient_id"
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"
    t.index ["trackable_type", "trackable_id"], name: "index_activities_on_trackable_type_and_trackable_id"
  end

  create_table "adjustment_factors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.decimal "percent"
    t.decimal "amount"
    t.integer "adjustment_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adjustment_type"], name: "index_adjustment_factors_on_adjustment_type"
  end

  create_table "adjustments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "adjustment_factor_id"
    t.string "adjustable_type"
    t.uuid "adjustable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["adjustable_type", "adjustable_id"], name: "index_adjustments_on_adjustable_type_and_adjustable_id"
    t.index ["adjustment_factor_id"], name: "index_adjustments_on_adjustment_factor_id"
  end

  create_table "agencies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["name"], name: "index_agencies_on_name", unique: true
  end

  create_table "amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "PHP", null: false
    t.uuid "entry_id"
    t.string "amountable_type"
    t.uuid "amountable_id"
    t.datetime "date"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id", "entry_id"], name: "index_amounts_on_account_id_and_entry_id"
    t.index ["account_id"], name: "index_amounts_on_account_id"
    t.index ["amountable_type", "amountable_id"], name: "index_amounts_on_amountable_type_and_amountable_id"
    t.index ["date"], name: "index_amounts_on_date"
    t.index ["entry_id", "account_id"], name: "index_amounts_on_entry_id_and_account_id"
    t.index ["entry_id"], name: "index_amounts_on_entry_id"
    t.index ["type"], name: "index_amounts_on_type"
  end

  create_table "annual_inspection_fee_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "fee_amount", default: "0.0", null: false
    t.uuid "locality_id"
    t.uuid "revenue_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_annual_inspection_fee_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_annual_inspection_fee_configs_on_revenue_account_id"
  end

  create_table "area_measurements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "measurable_type"
    t.uuid "measurable_id"
    t.decimal "area"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "sanitary_inspection_config_id"
    t.index ["measurable_type", "measurable_id"], name: "index_area_measurements_on_measurable_type_and_measurable_id"
    t.index ["sanitary_inspection_config_id"], name: "index_area_measurements_on_sanitary_inspection_config_id"
  end

  create_table "arps", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.boolean "cancelled"
    t.integer "number"
    t.integer "request_status"
    t.string "real_property_type"
    t.uuid "real_property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["real_property_type", "real_property_id"], name: "index_arps_on_real_property_type_and_real_property_id"
  end

  create_table "assessment_levels", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "percent"
    t.uuid "classification_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_id"], name: "index_assessment_levels_on_classification_id"
  end

  create_table "asset_sizes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.uuid "enterprise_scale_id"
    t.decimal "asset_size"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_asset_sizes_on_business_id"
    t.index ["enterprise_scale_id"], name: "index_asset_sizes_on_enterprise_scale_id"
  end

  create_table "audits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "auditable_id"
    t.string "auditable_type"
    t.integer "associated_id"
    t.string "associated_type"
    t.uuid "user_id"
    t.string "user_type"
    t.string "username"
    t.string "action"
    t.text "audited_changes"
    t.integer "version", default: 0
    t.string "comment"
    t.string "remote_address"
    t.string "request_uuid"
    t.datetime "created_at"
    t.index ["associated_type", "associated_id"], name: "associated_index"
    t.index ["auditable_type", "auditable_id", "version"], name: "auditable_index"
    t.index ["created_at"], name: "index_audits_on_created_at"
    t.index ["request_uuid"], name: "index_audits_on_request_uuid"
    t.index ["user_id", "user_type"], name: "user_index"
  end

  create_table "barangay_charges", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "barangay_id"
    t.uuid "charge_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["barangay_id"], name: "index_barangay_charges_on_barangay_id"
    t.index ["charge_id"], name: "index_barangay_charges_on_charge_id"
  end

  create_table "barangays", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pin"
    t.decimal "barangay_clearance_fee"
    t.uuid "liability_account_id"
    t.index ["liability_account_id"], name: "index_barangays_on_liability_account_id"
    t.index ["locality_id"], name: "index_barangays_on_locality_id"
    t.index ["pin"], name: "index_barangays_on_pin", unique: true
  end

  create_table "budgets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "account_id"
    t.decimal "amount"
    t.integer "calendar_year"
    t.datetime "date"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_budgets_on_account_id"
    t.index ["locality_id"], name: "index_budgets_on_locality_id"
  end

  create_table "building_permit_fee_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "revenue_account_id"
    t.uuid "locality_id"
    t.decimal "fee_amount", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_building_permit_fee_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_building_permit_fee_configs_on_revenue_account_id"
  end

  create_table "buildings", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "locality_id"
    t.index ["locality_id"], name: "index_buildings_on_locality_id"
  end

  create_table "business_activities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.uuid "line_of_business_id"
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "business_permit_application_id"
    t.decimal "volume", default: "0.0", null: false
    t.index ["business_id"], name: "index_business_activities_on_business_id"
    t.index ["business_permit_application_id"], name: "index_business_activities_on_business_permit_application_id"
    t.index ["line_of_business_id"], name: "index_business_activities_on_line_of_business_id"
  end

  create_table "business_capitals", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.decimal "capital_amount"
    t.datetime "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_capitals_on_business_id"
  end

  create_table "business_incentives", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.uuid "incentive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_business_incentives_on_business_id"
    t.index ["incentive_id"], name: "index_business_incentives_on_incentive_id"
  end

  create_table "business_names", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id", null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["business_id"], name: "index_business_names_on_business_id"
  end

  create_table "business_penalty_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "rate"
    t.uuid "locality_id"
    t.uuid "revenue_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_business_penalty_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_business_penalty_configs_on_revenue_account_id"
  end

  create_table "business_permit_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "applicant_type"
    t.uuid "applicant_id"
    t.datetime "application_date"
    t.string "application_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "business_id"
    t.uuid "locality_id"
    t.uuid "barangay_id"
    t.uuid "province_id"
    t.string "business_name"
    t.uuid "ownership_type_id"
    t.integer "mode_of_payment"
    t.string "complete_address"
    t.uuid "street_id"
    t.boolean "rented"
    t.decimal "monthly_rental"
    t.boolean "market_vendor"
    t.uuid "public_market_id"
    t.integer "tenancy_type"
    t.decimal "business_area"
    t.uuid "business_tax_category_id"
    t.integer "employee_count"
    t.decimal "capital_amount"
    t.string "taxpayer_first_name"
    t.string "taxpayer_middle_name"
    t.string "taxpayer_last_name"
    t.string "account_number"
    t.decimal "gross_sale_amount", default: "0.0"
    t.index ["account_number"], name: "index_business_permit_applications_on_account_number", unique: true
    t.index ["applicant_type", "applicant_id"], name: "index_applicant_on_business_permit_applications"
    t.index ["barangay_id"], name: "index_business_permit_applications_on_barangay_id"
    t.index ["business_id"], name: "index_business_permit_applications_on_business_id"
    t.index ["business_tax_category_id"], name: "index_business_permit_applications_on_business_tax_category_id"
    t.index ["locality_id"], name: "index_business_permit_applications_on_locality_id"
    t.index ["mode_of_payment"], name: "index_business_permit_applications_on_mode_of_payment"
    t.index ["ownership_type_id"], name: "index_business_permit_applications_on_ownership_type_id"
    t.index ["province_id"], name: "index_business_permit_applications_on_province_id"
    t.index ["public_market_id"], name: "index_business_permit_applications_on_public_market_id"
    t.index ["street_id"], name: "index_business_permit_applications_on_street_id"
    t.index ["tenancy_type"], name: "index_business_permit_applications_on_tenancy_type"
  end

  create_table "business_surcharge_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "rate"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "effectivity_date"
    t.index ["locality_id"], name: "index_business_surcharge_configs_on_locality_id"
  end

  create_table "business_tax_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "revenue_account_id"
    t.uuid "locality_id"
    t.uuid "discount_account_id"
    t.index ["discount_account_id"], name: "index_business_tax_categories_on_discount_account_id"
    t.index ["locality_id"], name: "index_business_tax_categories_on_locality_id"
    t.index ["revenue_account_id"], name: "index_business_tax_categories_on_revenue_account_id"
  end

  create_table "business_tax_computation_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "computation_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["computation_type"], name: "index_business_tax_computation_configs_on_computation_type"
  end

  create_table "business_tax_receivables", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.datetime "date"
    t.decimal "amount", default: "0.0", null: false
    t.uuid "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "business_permit_application_id"
    t.index ["business_id"], name: "index_business_tax_receivables_on_business_id"
    t.index ["business_permit_application_id"], name: "index_business_permit_application_on_tax_receivables"
    t.index ["employee_id"], name: "index_business_tax_receivables_on_employee_id"
  end

  create_table "businesses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "ownership_type_id"
    t.uuid "business_tax_category_id"
    t.string "account_number"
    t.string "trade_name"
    t.uuid "locality_id"
    t.integer "business_number"
    t.uuid "business_tax_computation_config_id"
    t.decimal "employee_count"
    t.integer "business_type"
    t.integer "mode_of_payment"
    t.integer "permit_status"
    t.datetime "closed_at"
    t.index ["business_tax_category_id"], name: "index_businesses_on_business_tax_category_id"
    t.index ["business_tax_computation_config_id"], name: "index_businesses_on_business_tax_computation_config_id"
    t.index ["business_type"], name: "index_businesses_on_business_type"
    t.index ["locality_id"], name: "index_businesses_on_locality_id"
    t.index ["mode_of_payment"], name: "index_businesses_on_mode_of_payment"
    t.index ["ownership_type_id"], name: "index_businesses_on_ownership_type_id"
    t.index ["permit_status"], name: "index_businesses_on_permit_status"
  end

  create_table "capital_tax_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "rate"
    t.uuid "locality_id"
    t.uuid "revenue_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_capital_tax_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_capital_tax_configs_on_revenue_account_id"
  end

  create_table "carts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "taxpayer_id"
    t.uuid "user_id"
    t.uuid "ownership_type_id"
    t.decimal "asset_size"
    t.decimal "capital"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "locality_id"
    t.boolean "terms_accepted", default: false
    t.uuid "business_tax_category_id"
    t.integer "application_type"
    t.boolean "rented", default: false
    t.decimal "monthly_rental"
    t.uuid "public_market_id"
    t.boolean "market_vendor"
    t.integer "tenancy_type", default: 0
    t.string "lessor_name"
    t.string "lessor_address"
    t.string "lessor_email"
    t.string "lessor_contact_number"
    t.index ["application_type"], name: "index_carts_on_application_type"
    t.index ["business_tax_category_id"], name: "index_carts_on_business_tax_category_id"
    t.index ["locality_id"], name: "index_carts_on_locality_id"
    t.index ["ownership_type_id"], name: "index_carts_on_ownership_type_id"
    t.index ["public_market_id"], name: "index_carts_on_public_market_id"
    t.index ["taxpayer_id"], name: "index_carts_on_taxpayer_id"
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "chargeables", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "charge_id"
    t.string "chargeable_type"
    t.uuid "chargeable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charge_id"], name: "index_chargeables_on_charge_id"
    t.index ["chargeable_type", "chargeable_id"], name: "index_chargeables_on_chargeable_type_and_chargeable_id"
  end

  create_table "charges", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "revenue_account_id"
    t.decimal "amount"
    t.uuid "locality_id"
    t.integer "charge_scope"
    t.boolean "default_charge", default: false
    t.index ["charge_scope"], name: "index_charges_on_charge_scope"
    t.index ["locality_id"], name: "index_charges_on_locality_id"
    t.index ["revenue_account_id"], name: "index_charges_on_revenue_account_id"
  end

  create_table "classifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "companies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_companies_on_locality_id"
  end

  create_table "competetive_index_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conditions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "document_id"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_id"], name: "index_conditions_on_document_id"
  end

  create_table "contacts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "contactable_type"
    t.uuid "contactable_id"
    t.string "contact_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contactable_type", "contactable_id"], name: "index_contacts_on_contactable_type_and_contactable_id"
  end

  create_table "demo_requests", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email"
    t.string "locality"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "discountable_discounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "discountable_type"
    t.uuid "discountable_id"
    t.uuid "discount_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_id"], name: "index_discountable_discounts_on_discount_id"
    t.index ["discountable_type", "discountable_id"], name: "index_discountable_on_discountable_discounts"
  end

  create_table "discounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.integer "discount_scope"
    t.integer "discount_type"
    t.decimal "rate"
    t.decimal "amount"
    t.string "discounted_account_ids", default: [], array: true
    t.uuid "locality_id"
    t.uuid "discount_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["discount_account_id"], name: "index_discounts_on_discount_account_id"
    t.index ["discount_scope"], name: "index_discounts_on_discount_scope"
    t.index ["discount_type"], name: "index_discounts_on_discount_type"
    t.index ["locality_id"], name: "index_discounts_on_locality_id"
  end

  create_table "document_transactions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.datetime "date"
    t.string "applicant_type"
    t.uuid "applicant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "required_document_id"
    t.uuid "user_id"
    t.index ["applicant_type", "applicant_id"], name: "index_document_transactions_on_applicant_type_and_applicant_id"
    t.index ["required_document_id"], name: "index_document_transactions_on_required_document_id"
    t.index ["type"], name: "index_document_transactions_on_type"
    t.index ["user_id"], name: "index_document_transactions_on_user_id"
  end

  create_table "documentary_stamp_tax_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "accounts", default: [], array: true
    t.uuid "revenue_account_id"
    t.decimal "fee_amount"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_documentary_stamp_tax_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_documentary_stamp_tax_configs_on_revenue_account_id"
  end

  create_table "documents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "locality_id"
    t.string "issuing_office_type"
    t.uuid "issuing_office_id"
    t.index ["issuing_office_type", "issuing_office_id"], name: "index_documents_on_issuing_office_type_and_issuing_office_id"
    t.index ["locality_id"], name: "index_documents_on_locality_id"
  end

  create_table "electrical_installation_fee_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "revenue_account_id"
    t.uuid "locality_id"
    t.decimal "fee_amount", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_electrical_installation_fee_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_electrical_installation_fee_configs_on_revenue_account_id"
  end

  create_table "employee_cash_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "employee_id"
    t.uuid "cash_account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "locality_id"
    t.boolean "default_account", default: false
    t.index ["cash_account_id"], name: "index_employee_cash_accounts_on_cash_account_id"
    t.index ["employee_id"], name: "index_employee_cash_accounts_on_employee_id"
    t.index ["locality_id"], name: "index_employee_cash_accounts_on_locality_id"
  end

  create_table "employee_counts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "total_count", default: 0, null: false
    t.datetime "date"
    t.uuid "business_id"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_employee_counts_on_business_id"
    t.index ["locality_id"], name: "index_employee_counts_on_locality_id"
  end

  create_table "encumberances", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "encumberable_type"
    t.uuid "encumberable_id"
    t.string "title"
    t.string "description"
    t.datetime "effectivity_date"
    t.boolean "cancelled"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "cancellation_date"
    t.index ["encumberable_type", "encumberable_id"], name: "index_encumberances_on_encumberable_type_and_encumberable_id"
  end

  create_table "enterprise_scales", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "min_asset_size"
    t.decimal "max_asset_size"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "locality_id"
    t.index ["locality_id"], name: "index_enterprise_scales_on_locality_id"
  end

  create_table "entries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "date"
    t.string "reference_number"
    t.string "description"
    t.string "commercial_document_type"
    t.uuid "commercial_document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "recorder_id"
    t.uuid "locality_id"
    t.index ["commercial_document_type", "commercial_document_id"], name: "index_commercial_document_on_entries"
    t.index ["locality_id"], name: "index_entries_on_locality_id"
    t.index ["recorder_id"], name: "index_entries_on_recorder_id"
  end

  create_table "establishments", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.boolean "leased"
    t.decimal "area"
    t.string "lessor_type"
    t.uuid "lessor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "monthly_rental"
    t.index ["business_id"], name: "index_establishments_on_business_id"
    t.index ["lessor_type", "lessor_id"], name: "index_establishments_on_lessor_type_and_lessor_id"
  end

  create_table "fire_safety_inspection_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "fire_safety_inspection_config_id", null: false
    t.uuid "account_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_fire_safety_inspection_accounts_on_account_id"
    t.index ["fire_safety_inspection_config_id"], name: "index_fire_safety_config_on_fire_safety_config_accounts"
  end

  create_table "fire_safety_inspection_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "accounts", default: [], array: true
    t.uuid "locality_id"
    t.uuid "liability_account_id"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "minimum_amount", default: "0.0"
    t.index ["liability_account_id"], name: "index_fire_safety_inspection_configs_on_liability_account_id"
    t.index ["locality_id"], name: "index_fire_safety_inspection_configs_on_locality_id"
  end

  create_table "general_revisions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.date "effectivity_year"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gross_sales", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "amount"
    t.string "grossable_type"
    t.uuid "grossable_id"
    t.uuid "business_activity_id"
    t.integer "calendar_year"
    t.string "account_number"
    t.uuid "business_permit_application_id"
    t.integer "gross_sale_type", default: 0
    t.index ["account_number"], name: "index_gross_sales_on_account_number", unique: true
    t.index ["business_activity_id"], name: "index_gross_sales_on_business_activity_id"
    t.index ["business_id"], name: "index_gross_sales_on_business_id"
    t.index ["business_permit_application_id"], name: "index_gross_sales_on_business_permit_application_id"
    t.index ["gross_sale_type"], name: "index_gross_sales_on_gross_sale_type"
    t.index ["grossable_type", "grossable_id"], name: "index_gross_sales_on_grossable_type_and_grossable_id"
  end

  create_table "gross_sales_tax_ranges", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "business_tax_category_id"
    t.decimal "minimum_gross_sale"
    t.decimal "maximum_gross_sale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "tax_type"
    t.decimal "tax_amount"
    t.uuid "locality_id"
    t.decimal "minimum_tax_amount"
    t.decimal "tax_rate"
    t.decimal "gross_limit"
    t.decimal "tax_rate_for_excess"
    t.index ["business_tax_category_id"], name: "index_gross_sales_tax_ranges_on_business_tax_category_id"
    t.index ["locality_id"], name: "index_gross_sales_tax_ranges_on_locality_id"
    t.index ["tax_type"], name: "index_gross_sales_tax_ranges_on_tax_type"
  end

  create_table "health_certificate_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "fee_amount"
    t.uuid "revenue_account_id"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_health_certificate_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_health_certificate_configs_on_revenue_account_id"
  end

  create_table "incentives", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.decimal "amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "business_tax_exemption", default: false
    t.uuid "locality_id"
    t.index ["locality_id"], name: "index_incentives_on_locality_id"
  end

  create_table "incentivizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "incentive_id"
    t.string "incentiveable_type"
    t.uuid "incentiveable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["incentive_id"], name: "index_incentivizations_on_incentive_id"
    t.index ["incentiveable_type", "incentiveable_id"], name: "index_incentiveable_on_incentivizations"
  end

  create_table "interest_rates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "locality_id"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_interest_rates_on_locality_id"
  end

  create_table "lands", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "north_boundary"
    t.string "south_boundary"
    t.string "east_boundary"
    t.string "west_boundary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "locality_id"
    t.index ["locality_id"], name: "index_lands_on_locality_id"
  end

  create_table "ledger_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "ledgerable_type"
    t.uuid "ledgerable_id"
    t.uuid "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_ledger_accounts_on_account_id"
    t.index ["ledgerable_type", "ledgerable_id"], name: "index_ledger_accounts_on_ledgerable_type_and_ledgerable_id"
  end

  create_table "line_of_business_categories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "revenue_account_id"
    t.uuid "locality_id"
    t.index ["locality_id"], name: "index_line_of_business_categories_on_locality_id"
    t.index ["revenue_account_id"], name: "index_line_of_business_categories_on_revenue_account_id"
  end

  create_table "line_of_business_charges", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.decimal "amount"
    t.uuid "revenue_account_id"
    t.uuid "line_of_business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["line_of_business_id"], name: "index_line_of_business_charges_on_line_of_business_id"
    t.index ["revenue_account_id"], name: "index_line_of_business_charges_on_revenue_account_id"
  end

  create_table "line_of_businesses", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.uuid "line_of_business_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "cart_id"
    t.uuid "locality_id"
    t.decimal "fee_amount"
    t.uuid "competetive_index_category_id"
    t.boolean "has_storage_permit_fee", default: false
    t.boolean "essential", default: true
    t.index ["cart_id"], name: "index_line_of_businesses_on_cart_id"
    t.index ["competetive_index_category_id"], name: "index_line_of_businesses_on_competetive_index_category_id"
    t.index ["line_of_business_category_id"], name: "index_line_of_businesses_on_line_of_business_category_id"
    t.index ["locality_id"], name: "index_line_of_businesses_on_locality_id"
  end

  create_table "localities", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "locality_type"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pin"
    t.uuid "province_id"
    t.uuid "capital_tax_revenue_account_id"
    t.uuid "mayors_permit_fee_calculation_config_id"
    t.uuid "sanitary_inspection_revenue_account_id"
    t.uuid "business_tax_computation_config_id"
    t.uuid "police_clearance_revenue_account_id"
    t.uuid "surcharge_revenue_account_id"
    t.uuid "penalty_revenue_account_id"
    t.uuid "zoning_revenue_account_id"
    t.index ["business_tax_computation_config_id"], name: "index_localities_on_business_tax_computation_config_id"
    t.index ["capital_tax_revenue_account_id"], name: "index_localities_on_capital_tax_revenue_account_id"
    t.index ["locality_type"], name: "index_localities_on_locality_type"
    t.index ["mayors_permit_fee_calculation_config_id"], name: "index_localities_on_mayors_permit_fee_calculation_config_id"
    t.index ["penalty_revenue_account_id"], name: "index_localities_on_penalty_revenue_account_id"
    t.index ["pin"], name: "index_localities_on_pin", unique: true
    t.index ["police_clearance_revenue_account_id"], name: "index_localities_on_police_clearance_revenue_account_id"
    t.index ["province_id"], name: "index_localities_on_province_id"
    t.index ["sanitary_inspection_revenue_account_id"], name: "index_localities_on_sanitary_inspection_revenue_account_id"
    t.index ["surcharge_revenue_account_id"], name: "index_localities_on_surcharge_revenue_account_id"
    t.index ["zoning_revenue_account_id"], name: "index_localities_on_zoning_revenue_account_id"
  end

  create_table "locality_accounting_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "locality_id"
    t.uuid "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_id"], name: "index_locality_accounting_accounts_on_account_id"
    t.index ["locality_id"], name: "index_locality_accounting_accounts_on_locality_id"
  end

  create_table "locality_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_locality_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_locality_accounts_on_reset_password_token", unique: true
  end

  create_table "locality_taxpayers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "taxpayer_id"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "receivable_account_id"
    t.index ["locality_id"], name: "index_locality_taxpayers_on_locality_id"
    t.index ["receivable_account_id"], name: "index_locality_taxpayers_on_receivable_account_id"
    t.index ["taxpayer_id"], name: "index_locality_taxpayers_on_taxpayer_id"
  end

  create_table "locations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "locationable_type"
    t.uuid "locationable_id"
    t.uuid "street_id"
    t.uuid "barangay_id"
    t.uuid "locality_id"
    t.uuid "province_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street_number"
    t.string "complete_address"
    t.index ["barangay_id"], name: "index_locations_on_barangay_id"
    t.index ["locality_id"], name: "index_locations_on_locality_id"
    t.index ["locationable_type", "locationable_id"], name: "index_locations_on_locationable_type_and_locationable_id"
    t.index ["province_id"], name: "index_locations_on_province_id"
    t.index ["street_id"], name: "index_locations_on_street_id"
  end

  create_table "machineries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "locality_id"
    t.index ["locality_id"], name: "index_machineries_on_locality_id"
  end

  create_table "market_value_schedules", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "sub_classification_id"
    t.datetime "effectivity_date"
    t.decimal "market_value"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sub_classification_id"], name: "index_market_value_schedules_on_sub_classification_id"
  end

  create_table "mayors_permit_fee_calculation_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "config_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["config_type"], name: "index_mayors_permit_fee_calculation_configs_on_config_type"
  end

  create_table "occupancy_permit_fee_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "revenue_account_id"
    t.uuid "locality_id"
    t.decimal "fee_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_occupancy_permit_fee_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_occupancy_permit_fee_configs_on_revenue_account_id"
  end

  create_table "offices", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "locality_id"
    t.index ["locality_id"], name: "index_offices_on_locality_id"
  end

  create_table "ownership_types", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.uuid "agency_id"
    t.uuid "locality_id"
    t.index ["agency_id"], name: "index_ownership_types_on_agency_id"
    t.index ["locality_id"], name: "index_ownership_types_on_locality_id"
  end

  create_table "ownerships", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "owner_type"
    t.uuid "owner_id"
    t.string "ownable_type"
    t.uuid "ownable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ownable_type", "ownable_id"], name: "index_ownerships_on_ownable_type_and_ownable_id"
    t.index ["owner_type", "owner_id"], name: "index_ownerships_on_owner_type_and_owner_id"
  end

  create_table "penalty_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "rate"
    t.decimal "max_number_of_month"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "general_revision_id"
    t.index ["general_revision_id"], name: "index_penalty_configs_on_general_revision_id"
  end

  create_table "permit_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "applicant_type"
    t.uuid "applicant_id"
    t.datetime "application_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "application_type"
    t.string "account_number"
    t.uuid "locality_id"
    t.string "permitable_type"
    t.uuid "permitable_id"
    t.uuid "voucher_id"
    t.string "application_number"
    t.index ["account_number"], name: "index_permit_applications_on_account_number", unique: true
    t.index ["applicant_type", "applicant_id"], name: "index_permit_applications_on_applicant_type_and_applicant_id"
    t.index ["application_type"], name: "index_permit_applications_on_application_type"
    t.index ["locality_id"], name: "index_permit_applications_on_locality_id"
    t.index ["permitable_type", "permitable_id"], name: "index_permit_applications_on_permitable_type_and_permitable_id"
    t.index ["voucher_id"], name: "index_permit_applications_on_voucher_id"
  end

  create_table "permit_signatories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "permit_id"
    t.uuid "signatory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permit_id"], name: "index_permit_signatories_on_permit_id"
    t.index ["signatory_id"], name: "index_permit_signatories_on_signatory_id"
  end

  create_table "permits", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "permitable_type"
    t.uuid "permitable_id"
    t.uuid "locality_id"
    t.string "permit_number"
    t.datetime "approval_date"
    t.datetime "expiry_date"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "application_date"
    t.string "plate_number"
    t.string "account_number"
    t.integer "permit_type"
    t.string "token"
    t.datetime "cancelled_at"
    t.index ["account_number"], name: "index_permits_on_account_number", unique: true
    t.index ["locality_id"], name: "index_permits_on_locality_id"
    t.index ["permit_type"], name: "index_permits_on_permit_type"
    t.index ["permitable_type", "permitable_id"], name: "index_permits_on_permitable_type_and_permitable_id"
    t.index ["type"], name: "index_permits_on_type"
  end

  create_table "pg_search_documents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.text "content"
    t.string "searchable_type"
    t.uuid "searchable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id"
  end

  create_table "plumbing_installation_fee_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "revenue_account_id"
    t.uuid "locality_id"
    t.decimal "fee_amount", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_plumbing_installation_fee_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_plumbing_installation_fee_configs_on_revenue_account_id"
  end

  create_table "police_clearance_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "revenue_account_id"
    t.decimal "fee_amount"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_police_clearance_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_police_clearance_configs_on_revenue_account_id"
  end

  create_table "prerequisites", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "main_document_id"
    t.uuid "sub_document_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["main_document_id"], name: "index_prerequisites_on_main_document_id"
    t.index ["sub_document_id"], name: "index_prerequisites_on_sub_document_id"
  end

  create_table "property_administrations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "administrator_type"
    t.uuid "administrator_id"
    t.string "property_type"
    t.uuid "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["administrator_type", "administrator_id"], name: "index_administrator_on_property_administrations"
    t.index ["property_type", "property_id"], name: "index_property_administrations_on_property_type_and_property_id"
  end

  create_table "property_index_numbers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "property_type"
    t.uuid "property_id"
    t.string "number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_type", "property_id"], name: "index_property_index_numbers_on_property_type_and_property_id"
  end

  create_table "property_revisions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "general_revision_id"
    t.string "property_type"
    t.uuid "property_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["general_revision_id"], name: "index_property_revisions_on_general_revision_id"
    t.index ["property_type", "property_id"], name: "index_property_revisions_on_property_type_and_property_id"
  end

  create_table "provinces", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "pin"
    t.uuid "region_id"
    t.index ["pin"], name: "index_provinces_on_pin", unique: true
    t.index ["region_id"], name: "index_provinces_on_region_id"
  end

  create_table "public_markets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "address"
    t.uuid "locality_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_public_markets_on_locality_id"
  end

  create_table "real_property_areas", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "measureable_type"
    t.uuid "measureable_id"
    t.decimal "area"
    t.datetime "effectivity_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["measureable_type", "measureable_id"], name: "index_measureable_on_real_property_areas"
  end

  create_table "real_property_classifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "classification_id"
    t.string "classifiable_type"
    t.uuid "classifiable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classifiable_type", "classifiable_id"], name: "index_classifiable_on_real_property_classifications"
    t.index ["classification_id"], name: "index_real_property_classifications"
  end

  create_table "real_property_sub_classifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "sub_classifiable_type"
    t.uuid "sub_classifiable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "sub_classification_id"
    t.index ["sub_classifiable_type", "sub_classifiable_id"], name: "index_sub_classifiable_on_real_property_classifications"
    t.index ["sub_classification_id"], name: "index_sub_classification_on_real_property_sub_classifications"
  end

  create_table "real_property_surcharge_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "rate"
    t.datetime "effectivity_date"
    t.uuid "locality_id"
    t.uuid "general_revision_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["general_revision_id"], name: "index_real_property_surcharge_configs_on_general_revision_id"
    t.index ["locality_id"], name: "index_real_property_surcharge_configs_on_locality_id"
  end

  create_table "regions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registries", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "type"
    t.string "employee"
    t.uuid "employee_id"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_registries_on_employee_id"
    t.index ["locality_id"], name: "index_registries_on_locality_id"
    t.index ["type"], name: "index_registries_on_type"
  end

  create_table "required_documents", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "document_id"
    t.uuid "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "cart_id"
    t.index ["business_id"], name: "index_required_documents_on_business_id"
    t.index ["cart_id"], name: "index_required_documents_on_cart_id"
    t.index ["document_id"], name: "index_required_documents_on_document_id"
  end

  create_table "sanitary_inspection_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "minimum_area"
    t.decimal "maximum_area"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "fee_amount"
    t.uuid "locality_id"
    t.index ["locality_id"], name: "index_sanitary_inspection_configs_on_locality_id"
  end

  create_table "sealing_fee_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "revenue_account_id"
    t.uuid "locality_id"
    t.decimal "fee_amount", default: "0.0", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_sealing_fee_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_sealing_fee_configs_on_revenue_account_id"
  end

  create_table "signatories", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "locality_id"
    t.string "designation"
    t.string "full_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_signatories_on_locality_id"
  end

  create_table "storage_permit_fee_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "minimum_volume"
    t.decimal "maximum_volume"
    t.decimal "fee_amount"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "revenue_account_id"
    t.index ["locality_id"], name: "index_storage_permit_fee_configs_on_locality_id"
    t.index ["revenue_account_id"], name: "index_storage_permit_fee_configs_on_revenue_account_id"
  end

  create_table "streets", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "barangay_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["barangay_id"], name: "index_streets_on_barangay_id"
  end

  create_table "sub_classifications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "classification_id"
    t.string "title"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classification_id"], name: "index_sub_classifications_on_classification_id"
  end

  create_table "surcharge_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.decimal "rate"
    t.datetime "effectivity_date"
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.uuid "general_revision_id"
    t.index ["general_revision_id"], name: "index_surcharge_configs_on_general_revision_id"
    t.index ["locality_id"], name: "index_surcharge_configs_on_locality_id"
  end

  create_table "surcharge_rates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "locality_id"
    t.decimal "rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_surcharge_rates_on_locality_id"
  end

  create_table "taxpayer_accounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.uuid "taxpayer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_taxpayer_accounts_on_confirmation_token", unique: true
    t.index ["email"], name: "index_taxpayer_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_taxpayer_accounts_on_reset_password_token", unique: true
    t.index ["taxpayer_id"], name: "index_taxpayer_accounts_on_taxpayer_id"
    t.index ["unlock_token"], name: "index_taxpayer_accounts_on_unlock_token", unique: true
  end

  create_table "taxpayers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_number"
    t.integer "sex"
    t.index ["account_number"], name: "index_taxpayers_on_account_number", unique: true
    t.index ["sex"], name: "index_taxpayers_on_sex"
  end

  create_table "tenancies", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "tenant_type"
    t.uuid "tenant_id"
    t.uuid "public_market_id"
    t.integer "tenancy_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["public_market_id"], name: "index_tenancies_on_public_market_id"
    t.index ["tenancy_type"], name: "index_tenancies_on_tenancy_type"
    t.index ["tenant_type", "tenant_id"], name: "index_tenancies_on_tenant_type_and_tenant_id"
  end

  create_table "terms", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "termable_type"
    t.uuid "termable_id"
    t.datetime "effectivity_date"
    t.datetime "expiry_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["termable_type", "termable_id"], name: "index_terms_on_termable_type_and_termable_id"
  end

  create_table "tin_plates", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.integer "number"
    t.uuid "business_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["business_id"], name: "index_tin_plates_on_business_id"
  end

  create_table "tricycle_organizations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "abbreviated_name"
    t.string "name"
    t.boolean "active", default: true
    t.uuid "locality_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_tricycle_organizations_on_locality_id"
  end

  create_table "tricycle_permit_applications", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "mtop_number"
    t.string "plate_number"
    t.string "make"
    t.string "color"
    t.uuid "tricycle_organization_id"
    t.uuid "locality_id"
    t.uuid "taxpayer_id"
    t.string "complete_address"
    t.uuid "street_id"
    t.uuid "barangay_id"
    t.integer "tricycle_type"
    t.uuid "tricycle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "account_number"
    t.datetime "application_date"
    t.string "application_number"
    t.integer "mode_of_payment"
    t.string "tricycle_model"
    t.index ["account_number"], name: "index_tricycle_permit_applications_on_account_number", unique: true
    t.index ["barangay_id"], name: "index_tricycle_permit_applications_on_barangay_id"
    t.index ["locality_id"], name: "index_tricycle_permit_applications_on_locality_id"
    t.index ["mode_of_payment"], name: "index_tricycle_permit_applications_on_mode_of_payment"
    t.index ["street_id"], name: "index_tricycle_permit_applications_on_street_id"
    t.index ["taxpayer_id"], name: "index_tricycle_permit_applications_on_taxpayer_id"
    t.index ["tricycle_id"], name: "index_tricycle_permit_applications_on_tricycle_id"
    t.index ["tricycle_organization_id"], name: "index_tricycle_permit_applications_on_tricycle_organization_id"
    t.index ["tricycle_type"], name: "index_tricycle_permit_applications_on_tricycle_type"
  end

  create_table "tricycles", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "plate_number"
    t.string "mtop_number"
    t.uuid "locality_id"
    t.uuid "tricycle_organization_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "make"
    t.string "color"
    t.integer "tricycle_type"
    t.string "tricycle_model"
    t.string "account_number"
    t.uuid "temporary_assessment_account_id"
    t.index ["account_number"], name: "index_tricycles_on_account_number", unique: true
    t.index ["locality_id"], name: "index_tricycles_on_locality_id"
    t.index ["temporary_assessment_account_id"], name: "index_tricycles_on_temporary_assessment_account_id"
    t.index ["tricycle_organization_id"], name: "index_tricycles_on_tricycle_organization_id"
    t.index ["tricycle_type"], name: "index_tricycles_on_tricycle_type"
  end

  create_table "users", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "role"
    t.uuid "locality_id"
    t.string "designation"
    t.uuid "agency_id"
    t.string "middle_name"
    t.integer "access_scope"
    t.index ["access_scope"], name: "index_users_on_access_scope"
    t.index ["agency_id"], name: "index_users_on_agency_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["locality_id"], name: "index_users_on_locality_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["role"], name: "index_users_on_role"
  end

  create_table "valuations", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "valuable_type"
    t.uuid "valuable_id"
    t.datetime "effectivity_date"
    t.decimal "assessed_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["valuable_type", "valuable_id"], name: "index_valuations_on_valuable_type_and_valuable_id"
  end

  create_table "voucher_amounts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "voucher_id"
    t.integer "amount_cents", default: 0, null: false
    t.string "amount_currency", default: "PHP", null: false
    t.uuid "account_id"
    t.string "amountable_type"
    t.uuid "amountable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.boolean "amortizeable", default: false
    t.decimal "quantity", default: "1.0"
    t.integer "amount_type"
    t.uuid "cart_id"
    t.index ["account_id"], name: "index_voucher_amounts_on_account_id"
    t.index ["amount_type"], name: "index_voucher_amounts_on_amount_type"
    t.index ["amountable_type", "amountable_id"], name: "index_voucher_amounts_on_amountable_type_and_amountable_id"
    t.index ["cart_id"], name: "index_voucher_amounts_on_cart_id"
    t.index ["voucher_id"], name: "index_voucher_amounts_on_voucher_id"
  end

  create_table "vouchers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "date"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "payee_type"
    t.uuid "payee_id"
    t.uuid "locality_id"
    t.uuid "entry_id"
    t.text "description"
    t.string "reference_number"
    t.uuid "preparer_id"
    t.uuid "disburser_id"
    t.string "account_number"
    t.index ["account_number"], name: "index_vouchers_on_account_number", unique: true
    t.index ["disburser_id"], name: "index_vouchers_on_disburser_id"
    t.index ["entry_id"], name: "index_vouchers_on_entry_id"
    t.index ["locality_id"], name: "index_vouchers_on_locality_id"
    t.index ["payee_type", "payee_id"], name: "index_vouchers_on_payee_type_and_payee_id"
    t.index ["preparer_id"], name: "index_vouchers_on_preparer_id"
    t.index ["token"], name: "index_vouchers_on_token", unique: true
  end

  create_table "zoning_fee_configs", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "locality_id"
    t.decimal "fee_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locality_id"], name: "index_zoning_fee_configs_on_locality_id"
  end

  add_foreign_key "account_budgets", "accounts"
  add_foreign_key "account_budgets", "localities"
  add_foreign_key "accounts", "accounts", column: "main_account_id"
  add_foreign_key "adjustments", "adjustment_factors"
  add_foreign_key "amounts", "accounts"
  add_foreign_key "amounts", "entries"
  add_foreign_key "annual_inspection_fee_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "annual_inspection_fee_configs", "localities"
  add_foreign_key "area_measurements", "sanitary_inspection_configs"
  add_foreign_key "assessment_levels", "classifications"
  add_foreign_key "asset_sizes", "businesses"
  add_foreign_key "asset_sizes", "enterprise_scales"
  add_foreign_key "barangay_charges", "barangays"
  add_foreign_key "barangay_charges", "charges"
  add_foreign_key "barangays", "accounts", column: "liability_account_id"
  add_foreign_key "barangays", "localities"
  add_foreign_key "budgets", "accounts"
  add_foreign_key "budgets", "localities"
  add_foreign_key "building_permit_fee_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "building_permit_fee_configs", "localities"
  add_foreign_key "buildings", "localities"
  add_foreign_key "business_activities", "business_permit_applications"
  add_foreign_key "business_activities", "businesses"
  add_foreign_key "business_activities", "line_of_businesses"
  add_foreign_key "business_capitals", "businesses"
  add_foreign_key "business_incentives", "businesses"
  add_foreign_key "business_incentives", "incentives"
  add_foreign_key "business_names", "businesses"
  add_foreign_key "business_penalty_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "business_penalty_configs", "localities"
  add_foreign_key "business_permit_applications", "barangays"
  add_foreign_key "business_permit_applications", "business_tax_categories"
  add_foreign_key "business_permit_applications", "businesses"
  add_foreign_key "business_permit_applications", "localities"
  add_foreign_key "business_permit_applications", "ownership_types"
  add_foreign_key "business_permit_applications", "provinces"
  add_foreign_key "business_permit_applications", "public_markets"
  add_foreign_key "business_permit_applications", "streets"
  add_foreign_key "business_surcharge_configs", "localities"
  add_foreign_key "business_tax_categories", "accounts", column: "discount_account_id"
  add_foreign_key "business_tax_categories", "accounts", column: "revenue_account_id"
  add_foreign_key "business_tax_categories", "localities"
  add_foreign_key "business_tax_receivables", "business_permit_applications"
  add_foreign_key "business_tax_receivables", "businesses"
  add_foreign_key "business_tax_receivables", "users", column: "employee_id"
  add_foreign_key "businesses", "business_tax_categories"
  add_foreign_key "businesses", "business_tax_computation_configs"
  add_foreign_key "businesses", "localities"
  add_foreign_key "businesses", "ownership_types"
  add_foreign_key "capital_tax_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "capital_tax_configs", "localities"
  add_foreign_key "carts", "business_tax_categories"
  add_foreign_key "carts", "localities"
  add_foreign_key "carts", "ownership_types"
  add_foreign_key "carts", "public_markets"
  add_foreign_key "carts", "taxpayers"
  add_foreign_key "carts", "users"
  add_foreign_key "chargeables", "charges"
  add_foreign_key "charges", "accounts", column: "revenue_account_id"
  add_foreign_key "charges", "localities"
  add_foreign_key "companies", "localities"
  add_foreign_key "conditions", "documents"
  add_foreign_key "discountable_discounts", "discounts"
  add_foreign_key "discounts", "accounts", column: "discount_account_id"
  add_foreign_key "discounts", "localities"
  add_foreign_key "document_transactions", "required_documents"
  add_foreign_key "document_transactions", "users"
  add_foreign_key "documentary_stamp_tax_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "documentary_stamp_tax_configs", "localities"
  add_foreign_key "documents", "localities"
  add_foreign_key "electrical_installation_fee_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "electrical_installation_fee_configs", "localities"
  add_foreign_key "employee_cash_accounts", "accounts", column: "cash_account_id"
  add_foreign_key "employee_cash_accounts", "localities"
  add_foreign_key "employee_cash_accounts", "users", column: "employee_id"
  add_foreign_key "employee_counts", "businesses"
  add_foreign_key "employee_counts", "localities"
  add_foreign_key "enterprise_scales", "localities"
  add_foreign_key "entries", "localities"
  add_foreign_key "entries", "users", column: "recorder_id"
  add_foreign_key "establishments", "businesses"
  add_foreign_key "fire_safety_inspection_accounts", "accounts"
  add_foreign_key "fire_safety_inspection_accounts", "fire_safety_inspection_configs"
  add_foreign_key "fire_safety_inspection_configs", "accounts", column: "liability_account_id"
  add_foreign_key "fire_safety_inspection_configs", "localities"
  add_foreign_key "gross_sales", "business_activities"
  add_foreign_key "gross_sales", "business_permit_applications"
  add_foreign_key "gross_sales", "businesses"
  add_foreign_key "gross_sales_tax_ranges", "business_tax_categories"
  add_foreign_key "gross_sales_tax_ranges", "localities"
  add_foreign_key "health_certificate_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "health_certificate_configs", "localities"
  add_foreign_key "incentives", "localities"
  add_foreign_key "incentivizations", "incentives"
  add_foreign_key "interest_rates", "localities"
  add_foreign_key "lands", "localities"
  add_foreign_key "ledger_accounts", "accounts"
  add_foreign_key "line_of_business_categories", "accounts", column: "revenue_account_id"
  add_foreign_key "line_of_business_categories", "localities"
  add_foreign_key "line_of_business_charges", "accounts", column: "revenue_account_id"
  add_foreign_key "line_of_business_charges", "line_of_businesses"
  add_foreign_key "line_of_businesses", "carts"
  add_foreign_key "line_of_businesses", "competetive_index_categories"
  add_foreign_key "line_of_businesses", "line_of_business_categories"
  add_foreign_key "line_of_businesses", "localities"
  add_foreign_key "localities", "accounts", column: "capital_tax_revenue_account_id"
  add_foreign_key "localities", "accounts", column: "penalty_revenue_account_id"
  add_foreign_key "localities", "accounts", column: "police_clearance_revenue_account_id"
  add_foreign_key "localities", "accounts", column: "sanitary_inspection_revenue_account_id"
  add_foreign_key "localities", "accounts", column: "surcharge_revenue_account_id"
  add_foreign_key "localities", "accounts", column: "zoning_revenue_account_id"
  add_foreign_key "localities", "business_tax_computation_configs"
  add_foreign_key "localities", "mayors_permit_fee_calculation_configs"
  add_foreign_key "localities", "provinces"
  add_foreign_key "locality_accounting_accounts", "accounts"
  add_foreign_key "locality_accounting_accounts", "localities"
  add_foreign_key "locality_taxpayers", "accounts", column: "receivable_account_id"
  add_foreign_key "locality_taxpayers", "localities"
  add_foreign_key "locality_taxpayers", "taxpayers"
  add_foreign_key "locations", "barangays"
  add_foreign_key "locations", "localities"
  add_foreign_key "locations", "provinces"
  add_foreign_key "locations", "streets"
  add_foreign_key "machineries", "localities"
  add_foreign_key "market_value_schedules", "sub_classifications"
  add_foreign_key "occupancy_permit_fee_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "occupancy_permit_fee_configs", "localities"
  add_foreign_key "offices", "localities"
  add_foreign_key "ownership_types", "agencies"
  add_foreign_key "ownership_types", "localities"
  add_foreign_key "penalty_configs", "general_revisions"
  add_foreign_key "permit_applications", "localities"
  add_foreign_key "permit_applications", "vouchers"
  add_foreign_key "permit_signatories", "permits"
  add_foreign_key "permit_signatories", "signatories"
  add_foreign_key "permits", "localities"
  add_foreign_key "plumbing_installation_fee_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "plumbing_installation_fee_configs", "localities"
  add_foreign_key "police_clearance_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "police_clearance_configs", "localities"
  add_foreign_key "prerequisites", "documents", column: "main_document_id"
  add_foreign_key "prerequisites", "documents", column: "sub_document_id"
  add_foreign_key "property_revisions", "general_revisions"
  add_foreign_key "provinces", "regions"
  add_foreign_key "public_markets", "localities"
  add_foreign_key "real_property_classifications", "classifications"
  add_foreign_key "real_property_sub_classifications", "sub_classifications"
  add_foreign_key "real_property_surcharge_configs", "general_revisions"
  add_foreign_key "real_property_surcharge_configs", "localities"
  add_foreign_key "registries", "localities"
  add_foreign_key "registries", "users", column: "employee_id"
  add_foreign_key "required_documents", "businesses"
  add_foreign_key "required_documents", "carts"
  add_foreign_key "required_documents", "documents"
  add_foreign_key "sanitary_inspection_configs", "localities"
  add_foreign_key "sealing_fee_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "sealing_fee_configs", "localities"
  add_foreign_key "signatories", "localities"
  add_foreign_key "storage_permit_fee_configs", "accounts", column: "revenue_account_id"
  add_foreign_key "storage_permit_fee_configs", "localities"
  add_foreign_key "streets", "barangays"
  add_foreign_key "sub_classifications", "classifications"
  add_foreign_key "surcharge_configs", "general_revisions"
  add_foreign_key "surcharge_configs", "localities"
  add_foreign_key "surcharge_rates", "localities"
  add_foreign_key "taxpayer_accounts", "taxpayers"
  add_foreign_key "tenancies", "public_markets"
  add_foreign_key "tin_plates", "businesses"
  add_foreign_key "tricycle_organizations", "localities"
  add_foreign_key "tricycle_permit_applications", "barangays"
  add_foreign_key "tricycle_permit_applications", "localities"
  add_foreign_key "tricycle_permit_applications", "streets"
  add_foreign_key "tricycle_permit_applications", "taxpayers"
  add_foreign_key "tricycle_permit_applications", "tricycle_organizations"
  add_foreign_key "tricycle_permit_applications", "tricycles"
  add_foreign_key "tricycles", "accounts", column: "temporary_assessment_account_id"
  add_foreign_key "tricycles", "localities"
  add_foreign_key "tricycles", "tricycle_organizations"
  add_foreign_key "users", "agencies"
  add_foreign_key "users", "localities"
  add_foreign_key "voucher_amounts", "accounts"
  add_foreign_key "voucher_amounts", "carts"
  add_foreign_key "voucher_amounts", "vouchers"
  add_foreign_key "vouchers", "entries"
  add_foreign_key "vouchers", "localities"
  add_foreign_key "vouchers", "users", column: "disburser_id"
  add_foreign_key "vouchers", "users", column: "preparer_id"
  add_foreign_key "zoning_fee_configs", "localities"
end
