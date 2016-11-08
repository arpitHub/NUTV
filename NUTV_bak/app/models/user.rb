class User < ActiveRecord::Base
    has_many :projects
    has_secure_password
  
    scope :role, -> (role) { where role: role }
  
    def full_name
      self.first_name + ' ' + self.last_name
    end
  
    def eboard?
      self.role == 'eboard'
    end
  
    def director? 
      self.role == 'director'
    end
  
    def ep? 
      self.role == 'ep' 
    end
  
    def user? 
      self.role == 'user' 
    end
  
    def update_emails(email)
      self.emailchain << email
    end
  
end
