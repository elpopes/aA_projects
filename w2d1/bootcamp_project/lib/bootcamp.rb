class Bootcamp
    attr_accessor :name, :slogan, :teachers, :students
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new{|h, k| h[k] = Array.new}
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity 
            @students << student 
            return true
        else
            false
        end
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length 
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade 
            return true 
        else
            false
        end
    end

    def num_grades(student)
        grades = @grades[student]
        grades.length
    end

    def average_grade(student)
        grades = @grades[student] 
        return nil if grades.empty?
        grades.sum / num_grades(student)
    end
end
