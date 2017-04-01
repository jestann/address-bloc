def greeting
    greet = ARGV.first
    names = ARGV.drop(1)
    names.each do |name|
        puts "#{greet} #{name}"
    end
end

greeting
