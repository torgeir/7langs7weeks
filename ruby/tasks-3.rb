module AcvAsCsv

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def act_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods

    def read
      file = File.new(self.class.to_s.downcase + '.txt')
      @headers = file.gets.chomp.split(',')
      @csv_contents = []
      file.each do |row|
        @csv_contents << CsvRow.new(headers, row.chomp.split(','))
      end
    end

    def each(&block)
      @csv_contents.each &block
    end

    attr_accessor :headers, :csv_contents

    def initialize
      read
    end

  end

  class CsvRow

    def initialize(headers, content)
      @headers = headers
      @content = content 
    end

    def method_missing(method, *args)
      header = method.to_s
      if title = @headers.index(header)
        puts @content[title]
      else
        puts "Oups: no such header #{header}"
      end
    end
  end

end

class RubyCsv
  include AcvAsCsv
  act_as_csv
end

m = RubyCsv.new
m.each { |row| print row.one }
