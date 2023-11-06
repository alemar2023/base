class User < ApplicationRecord

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :confirmable, :recoverable, :rememberable, :validatable, :trackable

  validates :role, presence: true
  enum role: %w[superadmin admin moderator user].index_by(&:itself), _prefix: :role
  after_update do
    self.foo
  end

  helper_method :superadmin?
  helper_method :admin?
  helper_method :user?

  def foo
    # attenzione ad usare update_columns per non portare spazzatura
    #self.update_columns()
  end


end
