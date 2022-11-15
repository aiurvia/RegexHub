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

# functions for filter
    # def self.tags
    #   pluck(:tag).uniq
    # end

    # def self.find_all_by_tags(tags, ordering)
    #   self.where(tag: tags).order(ordering)
    # end

    def self.all_tags
      all_tags = self.select(:tag).map(&:tag).uniq.reject(&:empty?)
    end

    # def self.with_tags(tag)
    #   if tag.nil?
    #     return self.where(tag: self.all_tags)
    #   else
    #     return self.where(tag: tag.reject(&:empty?))
    #   end
    # end

    def self.with_tags(tag)
      return self.where(tag: tag.reject(&:empty?))
    end

end
