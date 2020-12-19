class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :employees

    def initialize(name, title, salary, boss)
        super
        @employees = []
    end

    def bonus(multiplier)
        @employees.inject(0) { |sum, employee| sum + employee.salary } * multiplier
    end
end

if __FILE__ == $PROGRAM_NAME
    ned = Manager.new('Ned', 'Founder', 1_000_000, nil)
    darren = Manager.new('Darren', 'TA Manager', 48_000, ned)
    shawna = Employee.new('Shawna', 'TA', 12_000, darren)
    david = Employee.new('David', 'TA', 10_000, darren)

    darren.employees = [shawna, david]
    ned.employees = [darren, shawna, david]

    p ned.bonus(5) # => 500_000
    p darren.bonus(4) # => 88_000
    p david.bonus(3) # => 30_000
end
