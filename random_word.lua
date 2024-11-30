-- Define vowels and consonants
local vowels = {"a", "e", "i", "o", "u"}
local consonants = {"b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"}
local valid_pairs = {
    initial = {
        "bl", "br", "cl", "cr", "dr", "fl", "fr", "gl", "gr", "pl", "pr",
        "sl", "sm", "sn", "sp", "st", "tr", "tw", "ch", "sh", "th", "ph",
        "kn", "sc", "sk"
    },
    medial = {
        "mb", "nk", "nd", "nt", "mp", "pt", "rt", "rk", "rd", "rl", "lp",
        "lt", "lm", "lf", "ft", "bb", "dd", "ff", "gg", "ll", "mm", "nn",
        "pp", "rr", "ss", "tt"
    },
    final = {
        "sh", "th", "ph", "ng", "nd", "nt", "mp", "st", "sp", "sk", "lp",
        "lf", "ft"
    }
}

-- Helper function to check if a character is a vowel
local function is_vowel(char)
    for _, v in ipairs(vowels) do
        if char == v then return true end
    end
    return false
end

-- Helper function to pick a random character
local function random_choice()
    local choise = math.random(1,10)
    
    if choise >= 3 then
        return vowels[math.random(#vowels)]
    else
        return consonants[math.random(#consonants)]
    end
end

-- Helper function to validate consonant pairs
local function is_valid_pair(prev, current, position)
    local pair = prev .. current
    if position == 2 then
        for _, valid_pair in ipairs(valid_pairs.initial) do
            if pair == valid_pair then return true end
        end
    elseif position == Length then
        for _, valid_pair in ipairs(valid_pairs.final) do
            if pair == valid_pair then return true end
        end
    elseif position == 3 then
        for _, valid_pair in ipairs(valid_pairs.medial) do
            if pair == valid_pair then return true end
        end
    end
    return false
end

-- Helper function to determine if processing should continue
local function should_continue(prev_char, next_char, position)
    return (is_vowel(prev_char) and is_vowel(next_char) and prev_char ~= next_char) or
           (is_vowel(prev_char) and not is_vowel(next_char)) or
           (not is_vowel(prev_char) and (is_vowel(next_char) or is_valid_pair(prev_char, next_char, position)))
end

-- Word generator function
local function generate_word()
    local word = ""
    Length = math.random(3,10)
    word = word .. random_choice()

    -- Start the prosess 
    for i = 2, Length do
        local next_char = ""

        -- Fetch the prev and second-prev characters
        local prev_char = word:sub(-1)
        local second_prev_char = word:sub(-2, -2)

        -- Handle the second character specifically
        if is_vowel(prev_char) == is_vowel(second_prev_char) then -- Avoid repeating the same character consecutively
            if is_vowel(prev_char) then --vowels
                repeat
                    next_char = random_choice()
                until not is_vowel(next_char)
            else -- consonants
                repeat
                    next_char = random_choice()
                until is_vowel(next_char)
            end
        else
            repeat
                next_char = random_choice()
            until should_continue(prev_char, next_char, i)
        end

        -- Append the valid next character to the word
        word = word .. next_char
    end

    -- Print the generated word
    print(word)
end

-- Generate a random word
generate_word()
