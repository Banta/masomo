class SetUp

  class << self 
    def db
  	  create_courses
  	  create_users
  	  create_units
  	  create_tests
    end

    def create_courses
      Course.find_or_create_by!(name: 'BBIT')
      puts 'Created courses.'
    end

    def create_users
      Lecturer.find_or_create_by!(email: 'johndoe@masomo.com') do |lecturer|
        lecturer.name = 'John Doe'
        lecturer.password = Rails.application.secrets.admin_password
        lecturer.password_confirmation = Rails.application.secrets.admin_password
        lecturer.confirm!
      end

      Lecturer.find_or_create_by!(email: 'janedoe@masomo.com') do |lecturer|
        lecturer.name = 'Jane Doe'
        lecturer.password = Rails.application.secrets.admin_password
        lecturer.password_confirmation = Rails.application.secrets.admin_password
        lecturer.confirm!
      end
      puts 'Created users.'
    end

    def create_units
  	  course = Course.find_by(name: 'BBIT')
  	  lecture = Lecturer.find_by(email: 'johndoe@masomo.com')
      Unit.find_or_create_by!(code: 'SZL 2111') do |unit|
        unit.course_id = course.id
        unit.name = 'HIV/AIDS'
        unit.lecturer_id = lecture.id
      end

  	  lecture = Lecturer.find_by(email: 'janedoe@masomo.com')
      Unit.find_or_create_by!(code: 'HRD 2101') do |unit|
        unit.course_id = course.id
        unit.name = 'Communication Skills'
        unit.lecturer_id = lecture.id
      end
      puts 'Created units.'
    end

    def create_tests
  	  unit = Unit.find_by(code: 'SZL 2111')
      CAT.find_or_create_by!(name: 'CAT 1', unit_id: unit.id) do |cat|
        cat.start_time = 1.week.ago
        cat.due_date = 2.weeks.since
        cat.duration = 120 # Duration in minutes
      end

      unit = Unit.find_by(code: 'HRD 2101')
      CAT.find_or_create_by!(name: 'CAT 1', unit_id: unit.id) do |cat|
        cat.start_time = 1.week.ago
        cat.due_date = 2.weeks.since
        cat.duration = 120 # Duration in minutes
      end
      puts 'Created tests.'
    end

    def create_questions
  	  unit = Unit.find_by(code: 'SZL 2111')
  	  test = Test.find_by(name: 'CAT 1', unit: unit.id)
      Question.find_or_create_by!(question: 'What causes AIDS?') do |question|
        question.test_id = test.id
      end

      Question.find_or_create_by!(question: 'Which groups are mostly affected by HIV/AIDS?') do |question|
        question.test_id = test.id
      end

      unit = Unit.find_by(code: 'HRD 2101')
  	  test = Test.find_by(name: 'CAT 2', unit: unit.id)
      Question.find_or_create_by!(question: 'What is communication?') do |question|
        question.test_id = test.id   
      end

      Question.find_or_create_by!(question: 'What are the forms of communication?') do |question|
        question.test_id = test.id   
      end
      puts 'Created questions.'
    end
  end
end