# file reading - without block
    file = File.open(__FILE__, 'r')
    puts file.readlines
    file.close # remember!

# file reading - block
    File.open(__FILE__, 'r') do |file|
      puts file.readlines
      # file.close'd automatically
    end

# file reading - block impl
    class File
      def self.openIt(filename)
        file = File.open(filename)
        yield file
        file.close
      end
    end

    File.openIt(__FILE__) do |f|
      puts f.readlines
    end

# 1
    sixteen = (1..16).to_a
    sixteen.each_slice 4 do |i,j,k,l|
      print i, j, k, l
    end

# 2
    class CleanTree

      attr_accessor :name, :children

      def initialize(tree = {})
        @children = []
        tree.each_key do |key|
          newtree = CleanTree.new(tree[key])
          newtree.name = key
          @children.push newtree
        end
      end

      def visit(&block)
        block.call self
      end

      def visit_all(&block)
        visit &block
        @children.each do |c|
          c.visit_all &block
        end
      end
    end
    t = CleanTree.new({
      "pap" => {
        "bro"  => {},
        "sis"  => {},
        "more" => {}
      } }) 
    t.visit_all { |tree| print tree.name, '-' }

# 3
    File.open(__FILE__) do |file|
      file.readlines
            .select { |line| line =~ /pap/ }
            .each   { |line| puts "GREP:", line }
    end
