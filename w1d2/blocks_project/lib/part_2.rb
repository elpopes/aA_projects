def all_words_capitalized?(words_array)
    words_array.all? {|word| word == word.capitalize}
end

def no_valid_url?(urls_array)
    urls_array.none? {|url| url.end_with?('.com', '.net', '.io', '.org')} 
end

def any_passing_students?(students_array)
    students_array.any? {|student_hash| student_hash[:grades].sum / student_hash[:grades].length > 75}
end