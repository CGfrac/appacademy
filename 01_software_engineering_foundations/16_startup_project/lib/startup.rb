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

    def >(other_startup)
        self.funding > other_startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "Invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            @funding -= salary
            employee.pay(salary)
        else
            raise "Insufficient funds, employee can not be paid"
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee) }
    end

    def average_salary
        total = 0
        @employees.each { |employee| total += salaries[employee.title] }
        total / (self.size * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        # add funding
        @funding += other_startup.funding

        # merging salaries
        other_startup.salaries.each { |title, salary| @salaries[title] = salary if !@salaries.has_key?(title) }

        # hire employees
        @employees.concat(other_startup.employees)

        # close the other startup
        other_startup.close
    end
end
