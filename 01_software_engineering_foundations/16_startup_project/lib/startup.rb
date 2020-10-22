require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            employees << Employee.new(employee_name, title)
        else
            raise "Invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding - salary >= 0
            @funding -= salary
            employee.pay(salary)
        else
            raise "Insufficient funds, employee can not be paid"
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end
end
