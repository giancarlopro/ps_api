class CompanyUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  belongs_to :company

  PERMISSION_OPTIONS = [['Administrador', 'admin'], ['Empregado', 'employee']]

  validates :name, presence: true, length: { minimum: 6 }
  validates :permission, presence: true
  validates_email_format_of :email
end
