# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_12_14_224636) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: :cascade do |t|
    t.integer "amount", default: 0
    t.string "my_company_name"
    t.string "my_compagny_address"
    t.integer "my_company_phone"
    t.string "my_company_email"
    t.integer "my_company_siret"
    t.string "my_company_tva"
    t.text "my_company_paiement"
    t.string "customer_name"
    t.string "customer_address"
    t.string "customer_email"
    t.integer "customer_siret"
    t.date "date"
    t.string "description"
    t.integer "invoice_number"
    t.text "prestation"
    t.integer "invoice_tva"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lorums", force: :cascade do |t|
    t.text "paragraphe"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
  end

  create_table "tickets", force: :cascade do |t|
    t.string "name"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
