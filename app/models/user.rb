class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tasks
  before_destroy :destroy_tasks
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

   validates   :name, presence: true,
			    length: { minimum: 3,maximum: 25 }


	validates   :emp_id, presence: true,
			     uniqueness: { case_sensitive: false },
			    length: { minimum: 3,maximum: 9 }	

	validates   :designation, presence: true,
			    length: { minimum: 3,maximum: 9}	


	validates   :role, presence: true,
			    length: { minimum: 3,maximum: 9}

protected
   def destroy_tasks
     self.tasks.delete_all   
   end
end
