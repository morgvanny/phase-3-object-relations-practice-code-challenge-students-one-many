class Cohort < ActiveRecord::Base
  has_many :students

  def add_student(name, age)
    students.create(name: name, age: age)
  # Student.create(cohort_id: self.id, name: name, age: age)
  end

  def average_age
    students.average(:age).to_f
  end

  def total_students
    students.count
  end

  def self.biggest
    all.max_by do |cohort|
      cohort.total_students
    end
    # OR fancy AR (more efficient) way
    # joins(:students).group("cohorts.id").order("COUNT(students.id) desc").first
  end

  def self.sort_by_mod
    all.order(:current_mod)
  end

end


