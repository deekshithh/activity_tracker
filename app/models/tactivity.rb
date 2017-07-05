class Tactivity < ActiveRecord::Base
	 belongs_to  :task
	 validates   :name, presence: true,
			         length: { minimum: 3,maximum: 100 }
    validates   :description, presence: true,  length: { minimum: 3,maximum: 500 }
    validates   :task_id, presence: true
    validates   :hours, presence: true, :numericality => { :greater_than => 0, :less_than_or_equal_to => 24.00 }
    validates   :start_date, presence: true
    validate   :date_is_in_between_task_range, :total_activity_hours_per_day_less_than_24

    def date_is_in_between_task_range
      if self.start_date and !self.start_date.between?(self.task.start, self.task.end)
        errors[:base] << "Date must be in the range of task"
      end
    end

    def total_activity_hours_per_day_less_than_24
      sum_hours=0
      self.task.tactivities.each do |activity|
        if activity.start_date== self.start_date and activity != self
        sum_hours+= activity.hours
        end 
      end
      sum_hours+= self.hours 
      errors[:base] << "Total activity hours per day must <= 24"  if sum_hours>24
    end
=begin
    def total_activity_hours_per_day_less_than_241
      current_user= self.task.user
      sum_hours=0
      current_user.tasks.each do |task|
        task.tactivities.each do |activity|
          if activity.start_date== self.start_date and activity.id != self.id
            sum_hours+= activity.hours
          end 
        end
      end
      sum_hours+= self.hours
      errors[:base] << "Total activity hours per day must <= 24"  if sum_hours>24
    end
=end

end
