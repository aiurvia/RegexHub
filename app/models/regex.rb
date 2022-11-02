class Regex < ActiveRecord::Base
    has_many :testcases
    accepts_nested_attributes_for :testcases, :allow_destroy => true 

    validates :title, presence: { message: "Regex must have name!" }
    validates :expression, presence: { message: "Regex must have expression!" }
    # validates :expression, presence: true
    # validates_associated :testcases


    def self.parse_tag(tags)

    end

    def self.all_pass(exp, testcases)
    end

    def self.check_integrity(exp, str)
        reg = Regexp.new exp
        if str == '' or str.nil?
            return "No input."
        else
            res = str =~ reg
            res.nil?? "No match!": "Matches!"
            # "First match at index #{res}."
        end
    end
end
