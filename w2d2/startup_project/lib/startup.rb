require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries_hash)
        @name, @funding, @salaries = name, funding, salaries_hash
        @employees = []
    end

    def valid_title?(string)
        @salaries.has_key?(string)
    end

    def >(other_startup)
        funding > other_startup.funding
    end

    def hire(employee, title)
        case valid_title?(title)
        when false
            raise 'that aint a real job'
        else
            @employees << Employee.new(employee, title)
        end
    end

    def size
        @employees.size
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        case @funding > salary
        when true
            employee.pay(salary)
            @funding -= salary
        else
            raise 'sorry we broke'
        end
    end

    def payday
        @employees.each {|employee| pay_employee(employee)}
    end

    def average_salary
        all_the_money = []
        @employees.each {|employee| all_the_money << @salaries[employee.title]}
        all_the_money.sum / size
    end

    def close
        @employees.clear
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        other_startup.salaries.each {|title, pay| @salaries[title] = pay unless @salaries.has_key?(title)}
        @employees += other_startup.employees
        other_startup.close
    end
end
