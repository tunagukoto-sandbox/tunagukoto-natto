class Point < ApplicationRecord
	belongs_to :student

	def self.update_point(student_id, move_score)
		student = Student.find(student_id)
		point = student.point
		if point.nil?
			point = create_new_point(student)
		end
		point.having_point += move_score
		point.save
		return point
	end

	def self.create_new_point(student)
		point = Point.new(
			student_id: student.id,
			student_name: student.first_name+ student.last_name,
			max_point: 0,
			having_point: 0
		)
		if point.save
			return point
		end
	end
end
