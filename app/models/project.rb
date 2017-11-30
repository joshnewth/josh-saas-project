class Project < ActiveRecord::Base
  belongs_to :tenant
  validates_uniqueness_of :title
  has_many :artifacts, dependent: :destroy
  has_many :user_projects
  has_many :users, through: :user_projects
  def self.by_user_plan_and_tenant(tenant_id, user)
    tenant = Tenant.find(tenant_id)
    tenant.projects
  end
  
end
