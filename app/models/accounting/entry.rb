module Accounting
  class Entry < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :text_search, :against => [:reference_number, :description]
    multisearchable against: [:reference_number, :description]

    belongs_to :commercial_document, :polymorphic => true, touch: true
    belongs_to :recorder,            class_name: "User", foreign_key: 'recorder_id'
    belongs_to :locality,            class_name: "Locations::Locality"

    has_many :credit_amounts, extend: Accounting::BalanceFinder, :class_name => 'Accounting::CreditAmount', :inverse_of => :entry, dependent: :destroy
    has_many :debit_amounts, extend: Accounting::BalanceFinder, :class_name => 'Accounting::DebitAmount', :inverse_of => :entry, dependent: :destroy
    has_many :credit_accounts, :through => :credit_amounts, :source => :account, :class_name => 'Accounting::Account'
    has_many :debit_accounts, :through => :debit_amounts, :source => :account, :class_name => 'Accounting::Account'
    has_many :amounts, class_name: "Accounting::Amount"
    has_many :accounts, class_name: "Accounting::Account", through: :amounts
    has_one :voucher, dependent: :nullify
    validates :description, presence: true

    validate :has_credit_amounts?
    validate :has_debit_amounts?
    validate :amounts_cancel?

    accepts_nested_attributes_for :credit_amounts, :debit_amounts, allow_destroy: true

    before_save :set_default_date



    def self.entered_on(options={})
      EntriesQuery.new.entered_on(options)
    end


    private


      def set_default_date
        todays_date = ActiveRecord::Base.default_timezone == :utc ? Time.now.utc : Time.now
        self.date ||= todays_date
      end

      def has_credit_amounts?
        errors[:base] << "Entry must have at least one credit amount" if self.credit_amounts.blank?
      end

      def has_debit_amounts?
        errors[:base] << "Entry must have at least one debit amount" if self.debit_amounts.blank?
      end

      def amounts_cancel?
        errors[:base] << "The credit and debit amounts are not equal" if credit_amounts.balance_for_new_record != debit_amounts.balance_for_new_record
      end
  end
end
