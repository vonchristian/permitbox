class User < ApplicationRecord
  audited
  belongs_to :locality, class_name: "Locations::Locality"
  belongs_to :agency, optional: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one_attached :avatar
  has_many :employee_cash_accounts, class_name: "Employees::EmployeeCashAccount", foreign_key: 'employee_id'
  has_many :cash_accounts,          class_name: "Accounting::Account", through: :employee_cash_accounts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enum access_scope: [:barangay, :local, :provincial, :regional, :national]

  enum role: [:bplo_officer,
              :collection_officer,
              :engineering_officer,
              :health_officer,
              :barangay_officer,
              :fire_safety_officer,
              :mayors_officer,
              :zoning_officer,
              :budget_officer,
              :accounting_officer,
              :assessor_officer,
              :police_officer]

  def first_and_last_name
    "#{first_name} #{last_name}"
  end

  def full_name
    "#{first_name} #{middle_name.try(:first)}. #{last_name}"
  end

  def default_cash_account
    if employee_cash_accounts.present?
      employee_cash_accounts.default_cash_account
    end
  end

  private
  def set_default_avatar
    if !avatar.attached?
      self.avatar.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'default_avatar.png')), filename: 'default-avatar.png', content_type: 'image/png')
    end
  end
end
